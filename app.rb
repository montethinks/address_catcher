require "bundler"
require "dotenv/load"
Bundler.require

get "/" do
  erb :index
end

post "/" do
  @name = params["name"]
  @email = params["email"]
  @address = params["address"]
  @city = params["city"]
  @state = params["state"]
  @zip = params["zip-code"]

  new_row = [params["name"], params["email"], params["address"], 
              params["city"], params["state"], params["zip-code"]]
  
  begin
    worksheet.insert_rows(worksheet.num_rows+1, [new_row])
    worksheet.save
    erb :thanks
  rescue
    erb :index, locals: {
      error_message: "Your details could not be saved, please try again!"
    }
  end
end

def worksheet
  @session ||= GoogleDrive::Session.from_service_account_key(ENV['AUTH_SPREADSHEET'])
  @spreadsheet ||= @session.spreadsheet_by_title("address-catcher")
  @worksheet ||= @spreadsheet.worksheets.first
end

