class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates :username, presence: true, length: {in: 4..20}, uniqueness: {case_sensitive: false}
  validates :firstname, :lastname, presence: true, length: {in: 2..100}
  validates_format_of :password, with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)?/, message: :complexity

  # Class methods
  class << self

    def search(name)
      where("LOWER(firstname || ' ' || lastname || ' ' || firstname) LIKE LOWER(?)", "%#{name}%")
    end
  end

  # Instance methods
  def disable
    update_attribute(:disabled_at, Time.current)
  end

  def active_for_authentication?
    super && !disabled_at
  end

  def inactive_message
    !disabled_at ? super : :disabled_account
  end

  protected

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
