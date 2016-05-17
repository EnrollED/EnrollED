class Post < ActiveRecord::Base
  validates :code, presence: true, length: {in: 1..4}, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}
end
