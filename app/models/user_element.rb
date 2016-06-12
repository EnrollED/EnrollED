class UserElement < ActiveRecord::Base
  belongs_to :user
  belongs_to :element

  validates :score, presence: true, numericality: {greater_than: 0}
  validates :element_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: [:element_id]}

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(users.firstname || ' ' || users.lastname || ' ' || users.firstname) LIKE LOWER(?)", "%#{name}%")
    end
  end
end
