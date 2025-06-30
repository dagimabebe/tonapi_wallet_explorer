# TONAPI Wallet Explorer
is a simple Ruby tool that helps you generate crypto tax reports by processing your wallet transactions and fetching historical USD fair market values (FMV) for each transaction date.

---

🔍 What It Does

* Reads your wallet transactions from a CSV file.
* Fetches historical USD prices (FMV) for each cryptocurrency on the transaction date using the CoinGecko API.
* Generates a clean, tax-ready CSV report that includes your original transactions along with their corresponding USD values.

---

🚀 How to Use — Step by Step

1. Prepare Your Transactions File

Create a CSV file (e.g., `transactions.csv`) containing your wallet transactions with the following columns:

```
date,type,amount,currency,txid
```

2. Install Dependencies

Run the following command to install the required Ruby gems:

```bash
bundle install
```

3. Run the Tool

Execute the script by specifying your input and output filenames:

```
bundle exec ruby bin/run.rb transactions.csv tax_report.csv
```

4. Check the Output

Your tax report will be saved as `tax_report.csv` (or the output file name you provided), with each transaction enriched with its USD fair market value on the transaction date.

5. Use the Report

Use the generated CSV to calculate your crypto capital gains and losses when filing your taxes.

---

📌 Notes

Make sure your CSV file is correctly formatted and uses valid cryptocurrency tickers.
The tool uses the [CoinGecko API](https://www.coingecko.com/en/api) for price data, so ensure you have a stable internet connection while running it.

