class Country < ActiveRecord::Base
  validates :code, presence: true, length: {in: 1..3}, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}
 # validates :eu_member, presence: true

 ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end
