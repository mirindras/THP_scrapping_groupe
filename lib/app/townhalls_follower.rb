require 'dotenv'
require 'twitter'
require 'json'
require 'twitter'

Dotenv.load

puts "This program allow you to send Tweets on Twitter."
puts "It will ping a list of townhalls"

class TweeTown  

  attr_accessor :data_bank, :client, :town_list

  def initialize
    data_bank = File.read "../../db/all_emails.JSON"
    @@town_list = JSON.parse(data_bank)

    client = Twitter::REST::Client.new do | config |
    config.consumer_key        = ENV['twitter_api_key']
    config.consumer_secret     = ENV['api_secret_key']
    config.access_token        = ENV['twitter_access_token']
    config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end

  def town_list
    @@array_names = []
    @@town_list.each do |hashes|
      @@array_names.push(hashes['ville'])
    end
    return @@array_names
  end

  def tweeter_account
    @@array_account = []
    town_list.map { |ville| 
      client.user_search("mairie #{ville}").take(1).collect do |account_name|
      @@array_account.push(account_name)
    end
    }
    puts @@array_account
  end

  def follow_my_town (array)
    array.each { | elem | client.follow(elem) }
  end

end


TweeTown.new.tweeter_account
