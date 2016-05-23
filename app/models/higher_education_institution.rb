class HigherEducationInstitution < ActiveRecord::Base

  resourcify

  belongs_to :university
  belongs_to :municipality

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ' || acronym || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end

  ####### Instance methods #######
  def full_name
    "#{university.name} - #{name}"
  end
end