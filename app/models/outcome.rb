class Outcome
  include Id::Model

  field :id
  field :description
  field :price_decimal
  field :price
  field :price_id
  field :print_order
  field :opponent_id
  field :deduction
  field :sp
  field :nr
  field :market

  def to_json(options = {})
    Yajl::Encoder.encode(as_json)
  end

  protected
  def as_json
    {
      description: description,
      market: market,
      price: price
    }
  end
end
