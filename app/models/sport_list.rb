class SportList
  include Id::Model

  field :version
  has_many :sports, type: Sport

  def find_sport(id)
    sports.detect { |sport| sport.id == id }
  end

  def ordered_sports
    sports.sort { |a, b| a.pos <=> b.pos }
  end

  def self.fetch(locale)
    new SportsDAO.fetch_for locale: locale
  end
end
