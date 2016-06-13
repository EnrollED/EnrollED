class Element < ActiveRecord::Base
  has_many :user_elements

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}

  def short
    name.partition('(').first
  end

  ####### Variables #######
  PRETVORBA = {
      splosna_matura: {
          34 => 100.0,
          33 => 99.2,
          32 => 98.3,
          31 => 97.5,
          30 => 96.7,
          29 => 95.8,
          28 => 95,
          27 => 94,
          26 => 93,
          25 => 92,
          24 => 91,
          23 => 90,
          22 => 87.5,
          21 => 85,
          20 => 80,
          19 => 75,
          18 => 70,
          17 => 67.5,
          16 => 65,
          15 => 60,
          14 => 55,
          13 => 50,
          12 => 47.5,
          11 => 45,
          10 => 40
      },
      poklicna_matura: {
          23 => 100.0,
          22 => 98.3,
          21 => 96.7,
          20 => 95,
          19 => 93,
          18 => 90,
          17 => 85,
          16 => 80,
          15 => 75,
          14 => 70,
          13 => 65,
          12 => 60,
          11 => 55,
          10 => 50,
          9 => 45,
          8 => 40
      }
  }

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end
