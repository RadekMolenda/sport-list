class SportsDAO < Catcher::API
  def resource
    "http://www.betvictor.com/live/#{locale}/live/list.json"
  end

  def locale
    options.fetch(:locale, 'en')
  end
end
