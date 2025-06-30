require_relative 'api_client'
require_relative 'errors'

class FmvFetcher
  def initialize(api_client)
    @api_client = api_client
  end

  # coin_map example: { 'TON' => 'toncoin', 'BTC' => 'bitcoin' }
  def fetch_all_fmv(transactions, coin_map)
    transactions.map do |tx|
      coin_id = coin_map[tx[:currency]]
      raise ConfigError, "Unknown currency: #{tx[:currency]}" unless coin_id

      fmv = @api_client.fetch_fmv(coin_id, tx[:date])
      tx.merge(fmv_usd: fmv)
    end
  rescue StandardError => e
    raise ApiError, "FMV fetching failed: #{e.message}"
  end
end
