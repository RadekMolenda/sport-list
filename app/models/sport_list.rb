class SportList
  include Id::Model

  field :version
  has_many :sports, type: Sport

  def find_sport(id)
    sports.detect { |sport| sport.id == id }
  end

  def self.fetch
    new SportsDAO.fetch_for
  end
end
