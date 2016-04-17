class User < ActiveRecord::Base
  rolify

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates :username, presence: true, length: {in: 4..20}, uniqueness: true
  validates :firstname, :lastname, presence: true, length: {in: 2..100}

  protected

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
