class Element < ActiveRecord::Base
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}

  def short
    name.partition('(').first
  end

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end
