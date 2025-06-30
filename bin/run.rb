
require 'date'
require 'dotenv/load'  

require_relative '../lib/api_client'
require_relative '../lib/transaction_parser'
require_relative '../lib/fmv_fetcher'
require_relative '../lib/report_generator'
require_relative '../lib/errors'

def main
  input_file = ARGV[0] || 'transactions.csv'
  output_file = ARGV[1] || 'tax_report.csv'

  coin_map = {
    'TON' => 'toncoin',
    'BTC' => 'bitcoin',
    'ETH' => 'ethereum'
  }

  parser = TransactionParser.new(input_file)
  transactions = parser.parse

  api_client = ApiClient.new
  fmv_fetcher = FmvFetcher.new(api_client)
  transactions_with_fmv = fmv_fetcher.fetch_all_fmv(transactions, coin_map)

  report = ReportGenerator.new(transactions_with_fmv)
  report.generate(output_file)

  puts "✅ Report generated successfully at #{output_file}"
rescue ApiError, ParseError, ConfigError => e
  warn "❌ Error: #{e.message}"
  exit 1
end

main if __FILE__ == $PROGRAM_NAME
