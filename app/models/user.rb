class User < ActiveRecord::Base

  validates :username, presence: true, length: {in: 4..20}, uniqueness: true
  validates :firstname, :lastname, presence: true, length: {in: 2..100}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

end
