require "bundler"
Bundler.require

get "/" do
  erb :index
end

post "/" do
  new_row = [
    params["name"], params["email"], params["address"], params["city"], params["state"], params["zipcode"]
  ]
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
  @spreadsheet ||= @session.spreadsheet_by_title("Lizz&Monte/Invitation List")
  @worksheet ||= @spreadsheet.worksheets.first
end
