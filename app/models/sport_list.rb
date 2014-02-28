class SportList
  include Id::Model

  field :version
  has_many :sports, type: Sport
end
