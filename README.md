# Using Google Sheets with Ruby and Sinatra

This is an application that uses Sinatra to host a site that saves data in a Google Sheet. Based on [this blog post](https://www.twilio.com/blog/2017/03/google-spreadsheets-ruby.html). Setup instructions are below.

## Running the application

### Get setup with Google Sheets

Follow the steps in [this blog post](https://www.twilio.com/blog/2017/03/google-spreadsheets-ruby.html) to create the credentials for a service account in the Google APIs Console. Download the credentials and copy them to this project with the filename `client_secret.json`.

You will also need to create a blank spreadsheet and give your service account access to edit.

### Download and prepare the app

Clone this repository with the command:

```bash
git clone https://github.com/philnash/ruby-google-sheets-sinatra.git
cd ruby-google-sheets-sinatra
```

Install the dependencies:

```bash
bundle install
```
