require_relative '../lib/api_client'

RSpec.describe ApiClient do
  it 'fetches FMV for bitcoin on a known date' do
    client = ApiClient.new
    price = client.fetch_fmv('bitcoin', Date.new(2023, 1, 1))
    expect(price).to be > 0
  end
end
