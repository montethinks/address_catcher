# Address Catcher

This application uses Sinatra to serve a landing page that is designed to capture user information and send the results to a Google Spreadsheet that allows for easy sharing an editing.

Send a link to family and friends to gather information to send thank you cards for gifts or invitations to special occasions.



## Running the application

### Get setup with Google Sheets

Go to the Google APIs Console.

1. Create a new project.
2. Click Enable API. Search for and enable the Google Drive API.
3. Create credentials for a Web Server to access Application Data.
4. Name the service account and grant it a Project Role of Editor.
5. Download the JSON file.
6. Copy the JSON file to your spreadsheet_fun directory and rename it to client_secret.json

You will also need to create a blank spreadsheet and give your service account access to edit.

### Download and prepare the app

Clone this repository with the command:

```bash
git clone https://github.com/montethinks/address_catcher.git
cd address_catcher
```

Install the dependencies:

```bash
bundle install
```

