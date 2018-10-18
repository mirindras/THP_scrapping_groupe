require 'dotenv'
require 'twitter'
require 'json'
require 'twitter'

Dotenv.load

puts "This program allow you to send Tweets on Twitter."
puts "It will ping a list of townhalls"

class TweeTown  

  attr_accessor :data_bank, :client, :city_list

  def initialize
    @data_bank = File.read "../../db/all_emails.JSON"
    @city_list = JSON.parse(data_bank)

    @client = Twitter::REST::Client.new do | config |
    config.consumer_key        = ENV['twitter_api_key']
    config.consumer_secret     = ENV['api_secret_key']
    config.access_token        = ENV['twitter_access_token']
    config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end 

  def town_list
    array_names = []
    @city_list.each do |hashes|
      array_names.push(hashes['ville'])
    end
    return array_names
  end


  def tweeter_account
   user_list = []
   @fuck = []
    @city_list.each do |hashes|
    unless @client.user_search(hashes['ville']).first.nil? == true
      user_list = @client.user_search(hashes['ville']).first
      user_list = user_list.screen_name
      @fuck.push(user_list)
      end 
    end    
    return @fuck
  end 

  def follow_my_town
    array = tweeter_account
    account.each { | elem | client.follow(elem) }
  end

end

TweeTown.new.follow_my_town
