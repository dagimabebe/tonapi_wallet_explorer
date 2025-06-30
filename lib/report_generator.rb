require 'csv'

class ReportGenerator
  def initialize(transactions)
    @transactions = transactions
  end

  def generate(file_path)
    CSV.open(file_path, 'w', write_headers: true, headers: %w[date type amount currency txid fmv_usd]) do |csv|
      @transactions.each do |tx|
        csv << [
          tx[:date].strftime('%Y-%m-%d'),
          tx[:type],
          tx[:amount],
          tx[:currency],
          tx[:txid],
          tx[:fmv_usd]
        ]
      end
    end
  end
end
