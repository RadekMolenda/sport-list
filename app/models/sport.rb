class Sport
  include Id::Model

  field :id
  field :pos
  field :title
  field :is_virtual
  has_many :events
  has_many :meetings
end
