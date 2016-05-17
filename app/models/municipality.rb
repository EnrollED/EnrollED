class Municipality < ActiveRecord::Base
  validates :code, presence: true, length: {in: 1..3}, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}
end
