class Post < ActiveRecord::Base
  validates :code, presence: true, length: {in: 1..4}, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}

  ####### Class methods #######
  class << self

    def search(name)
      where("LOWER(name || ' ' || code || ' ') LIKE LOWER(?)", "%#{name}%")
    end
  end

  def post_name_code
    "#{name}, #{code}"
  end
end
