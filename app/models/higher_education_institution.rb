class HigherEducationInstitution < ActiveRecord::Base
  belongs_to :university
  belongs_to :municipality
  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ' || acronym || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end