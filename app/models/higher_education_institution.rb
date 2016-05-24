class HigherEducationInstitution < ActiveRecord::Base

  resourcify

  belongs_to :university
  belongs_to :municipality

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}
  validates :acronym, presence: true

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