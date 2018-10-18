require 'json'
require 'csv'

require_relative 'townhalls_follower.rb'
#pas finis a ararnger
class TwitterToJson

    def initialize(array_returned)
        @a = File.open("./../3.4-Envoi_emails/db/all_emails.JSON","w") 
        @a.write(array_returned.to_json)

        #@b = CSV.open("./../3.4-Envoi_emails/db/townhalls.csv", "wb")
        #@b << array_returned
    end

    def add_more(array)
        @a.write(array.to_json)
        @b << array
    end
end
