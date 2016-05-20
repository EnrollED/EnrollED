class ModeOfStudy < ActiveRecord::Base
  has_many :study_program_modes

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end