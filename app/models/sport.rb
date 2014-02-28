class Sport
  include Id::Model

  field :id
  field :pos
  field :title
  field :is_virtual
  has_many :events, type: Event
  has_many :meetings
end
