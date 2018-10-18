require 'dotenv'
require 'twitter'
require 'json'

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
    array_names = []
    @@town_list.each do |hashes|
      array_names.push(hashes['ville'])
  end
  puts array_names
  end


  def follow_my_town (array)
    array.each { | elem | client.follow(elem) }
  end

end


TweeTown.new.town_list
