require 'rubygems'
require 'nokogiri'         
require 'open-uri'
require 'json'
require 'pp'


class Scrapper

  def initialize
    @arrayfinal = Array.new
  end

  def get_the_email_of_a_townhal_from_its_webpage(url)

    begin
      doc = Nokogiri::HTML(open(url)) do
        doc.css('td')[7].text 
    end

    rescue 
        return "vide@vide.com"
    end

  end




  def get_all_the_urls_of_departement_townhalls(urldepartementx)

 
      doc = Nokogiri::HTML(open(urldepartementx)) 

          endlinks = doc.css("a[class=lientxt]")

          begin endlinks.each do |endlink|    
     
            email = get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/"+endlink['href'][1..-1])

            @hashvillemail = Hash.new

            @hashvillemail = {
              "ville" => endlink['href'][5..-6],
              "email" => email,
              "département" => urldepartementx[32..-6],
              }
            puts @hashvillemail      
         
            @arrayfinal.push(@hashvillemail)

          end
          rescue 
            print "rescue moi!"
          end
    





      File.open("../../db/all_emails.JSON","w") do |f|
        f.write(@arrayfinal.to_json)
      end

      puts 
      puts
      puts
      puts
      puts
      puts "fin département"
  end 

###########################################################

  def perform
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados.html")
       # juste après blonville sur mer
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-2.html")

    puts "sleep 30"
    #sleep 30
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-3.html")
    #puts "sleep 10"
    #sleep 10
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/calvados-4.html")

    #puts "sleep 60"
    #sleep 60

    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche-2.html")
    puts "sleep 30"
    #sleep 30
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/manche-3.html")

    #puts "sleep 60"
    #sleep 60

    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/ille-et-vilaine.html")
    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/ille-et-vilaine-2.html")

    puts "sleep"
    #sleep 60

    get_all_the_urls_of_departement_townhalls("http://annuaire-des-mairies.com/ileetvilaine.html")
  end
end

truc = Scrapper.new
truc.perform