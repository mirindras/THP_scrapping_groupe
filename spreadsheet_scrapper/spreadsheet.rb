require 'google_drive'
require 'json'

data_bank = File.read "../db/all_emails.JSON"
data = JSON.parse(data_bank)

session = GoogleDrive::Session.from_config("config.JSON")
ws = session.spreadsheet_by_key("1EH-lbs7ys1VYCp6ohFjPg1cLwqYMTqz1r088WdA43UM").worksheets[0]

ws[1, 1] = "VILLES"
ws[1, 2] = "MAILS MAIRIE"
ws.save


g = 2
data.each do |hashes|
  i = 1
  hashes.map do |key_ville_mail,value_ville_mail|
      ws[g, i] = value_ville_mail
      i+=1
  end
  g +=1
end
ws.save


ws.export_as_file("../csv_scrapper/export.csv") 
