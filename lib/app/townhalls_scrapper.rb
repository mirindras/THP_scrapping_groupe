require 'rubygems'
require 'nokogiri'         
require 'open-uri'
require 'json'
require 'pp'


class Scrapper

  def get_the_email_of_a_townhal_from_its_webpage(url)
    doc = Nokogiri::HTML(open(url))
    doc.css('td')[7].text 
  end

  def get_all_the_urls_of_departement_townhalls(urldepartementx)
    doc = Nokogiri::HTML(open(urldepartementx))
    endlinks = doc.css("a[class=lientxt]")

    endlinks.each do |endlink|    
      villemail = Array.new 
      #ville += urldepartementx.text      

      email = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/"+endlink['href'][1..-1])

      emails = Array.new
      emails.push(email)

      #puts emails

      #puts endlink['href'][5..-6]

      ville = Array.new
      ville.push(endlink['href'][5..-6])

      hashvillemail = Hash.new

      hashvillemail = {
        "ville" => ville,
        "email" => emails,
        "département" => urldepartementx[32..-6],
        }
      puts hashvillemail
     
      # File.open("../../db/all_emails.JSON","w") do |f|
      # f.write(array_final.to_json)
      end

      puts 
      puts
      puts
      puts
      puts
      puts "fin département"
  end 

  def add_to_array
    array_final = Array.new
    array_final.push(hash_ville_mail)
  end

  def perform
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-2.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-3.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-4.html")

    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche-2.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche-3.html")

    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/ille-et-vilaine.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/ille-et-vilaine-2.html")

    get_all_the_urls_of_departements_townhalls("http://annuaire-des-mairies.com/ileetvilaine.html")
  end
end

truc = Scrapper.new
truc.perform