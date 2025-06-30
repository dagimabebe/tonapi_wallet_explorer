require 'httparty'
require_relative 'errors'

class ApiClient
  include HTTParty
  base_uri 'https://api.coingecko.com/api/v3'

  def fetch_fmv(coin_id, date)
    formatted_date = date.strftime('%d-%m-%Y')
    response = self.class.get("/coins/#{coin_id}/history", query: { date: formatted_date })

    unless response.success?
      raise ApiError, "Failed to fetch FMV for #{coin_id} on #{date}: HTTP #{response.code}"
    end

    data = response.parsed_response
    market_data = data['market_data']
    raise ApiError, "Market data missing for #{coin_id} on #{date}" unless market_data

    price = market_data.dig('current_price', 'usd')
    raise ApiError, "USD price missing for #{coin_id} on #{date}" unless price

    price.to_f
  rescue StandardError => e
    raise ApiError, e.message
  end
end
