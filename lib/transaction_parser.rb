require 'csv'
require_relative 'errors'

class TransactionParser
  attr_reader :transactions

  def initialize(file_path)
    @file_path = file_path
    @transactions = []
  end

  def parse
    raise ParseError, "File #{@file_path} does not exist" unless File.exist?(@file_path)

    CSV.foreach(@file_path, headers: true) do |row|
      @transactions << {
        date: Date.parse(row['date']),
        type: row['type'],
        amount: row['amount'].to_f,
        currency: row['currency'],
        txid: row['txid']
      }
    end

    @transactions
  rescue StandardError => e
    raise ParseError, "Failed to parse transactions: #{e.message}"
  end
end
