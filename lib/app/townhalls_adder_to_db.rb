require 'json'
require 'csv'

require_relative 'townhalls_follower.rb'
#pas finis a ararnger
class TwitterToJson

    def initialize(array_returned)
        @a = File.open("../../db/all_emails.JSON","w") 
        @a.write(TweeTown.tweeter_account.to_json)

    end

    def add_more(array)
        @a.write(array.to_json)
    end
end`
