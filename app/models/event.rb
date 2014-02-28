class Event
  include Id::Model

  field :id
  field :is_virtual
  field :event_id
  field :title
  field :score
  field :start_time
  field :meeting
  field :meeting_id
  field :american_format
  field :event_type
  field :pos
  field :status
  field :status_type
  field :total_outcomes
  has_many :outcomes, type: Outcome

end
