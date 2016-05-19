class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates :username, presence: true, length: {in: 4..20}, uniqueness: {case_sensitive: false}
  validates :firstname, :lastname, presence: true, length: {in: 2..100}
  validates_format_of :password, with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)?|^(?![\s\S])/, message: :complexity

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(firstname || ' ' || lastname || ' ' || firstname) LIKE LOWER(?)", "%#{name}%")
    end
  end

  ####### Instance methods #######
  def disable
    update_attribute(:disabled_at, Time.current)
  end

  def password_required?
    if !persisted?
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  def active_for_authentication?
    super && !disabled_at
  end

  def inactive_message
    !disabled_at ? super : :disabled_account
  end

  # new function to set the password without knowing the current
  # password used in our confirmations controller.
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  def has_no_password?
    self.encrypted_password.blank?
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  protected

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
