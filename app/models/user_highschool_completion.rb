class UserHighschoolCompletion < ActiveRecord::Base
  belongs_to :user
  belongs_to :highschool_completion

  validates :passed, inclusion: [true, false]
  validates :highschool_completion_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: [:highschool_completion_id]}

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(users.firstname || ' ' || users.lastname || ' ' || users.firstname) LIKE LOWER(?)", "%#{name}%")
    end
  end
end
