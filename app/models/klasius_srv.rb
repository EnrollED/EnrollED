class KlasiusSrv < ActiveRecord::Base
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :description_sl, presence: true, length: {in: 2..500}
  validates :level, presence: true

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(description_sl || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end
end
