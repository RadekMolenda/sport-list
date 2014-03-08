class EventsAPIPresenter < EventsPresenter
  def events
    decorate(super).to_json
  end

  private
  def decorate(events)
    events.map(&EventsDecorator.decorate(sport_id))
  end
end

class EventsDecorator < SimpleDelegator
  def initialize(sport_id, event)
    super(event)
    @sport_id = sport_id
  end

  def self.decorate(sport_id)
    -> event {
      new(sport_id, event)
    }
  end

  def to_json(options = {})
    Yajl::Encoder.encode(as_json)
  end

  def as_json
    super.merge({sport_id: @sport_id})
  end
end
