require "bundler"
Bundler.require

get "/" do
  erb :index
end

post "/thanks" do
  @name = params["name"]
  @address = params["address"]
  @city = params["city"]
  @state = params["state"]
  @zip = params["zip-code"]

  new_row = [params["name"], params["email"], params["phone_number"]]
  
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
  @session ||= GoogleDrive::Session.from_service_account_key("client_secret.json")
  @spreadsheet ||= @session.spreadsheet_by_title("Address Catcher")
  @worksheet ||= @spreadsheet.worksheets.first
end
