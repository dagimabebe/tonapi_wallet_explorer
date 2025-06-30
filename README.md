TONAPI Wallet Explorer
A simple Ruby tool to generate crypto tax reports by processing wallet transactions and fetching historical USD prices (FMV) for each transaction date.

What It Does
Reads your wallet transactions from a CSV file.

Fetches historical fair market values (FMV) in USD for each cryptocurrency on the transaction date using CoinGecko API.

Generates a CSV report combining your transactions with their USD values, ready for tax reporting.

How to Use — Step by Step
Prepare your transactions file
Create a CSV file (e.g., transactions.csv) with your wallet transactions including columns: date, type, amount, currency, txid.

Install dependencies

Run this command to install required Ruby gems:

bundle install

Run the tool

Execute the script with your input and desired output filenames:

bundle exec ruby bin/run.rb transactions.csv tax_report.csv

Check the output
Your tax report will be saved as tax_report.csv (or your specified output file), containing your transactions enriched with USD fair market values for each date.

Use your report
Use the generated CSV to help calculate your crypto capital gains and losses for tax filing.
