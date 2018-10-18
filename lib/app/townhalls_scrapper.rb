require 'open-uri'
require 'nokogiri'
require 'pry'
require 'rubygems'
require 'json'

class Scrapper 

    attr_accessor :url, :doc, :departements

    def initialize
        @url = "http://annuaire-des-mairies.com"
        @doc = Nokogiri::HTML(open(@url))
        @departements = Array.new 
        @departements = ["http://www.annuaire-des-mairies.com/ille-et-vilaine.html","http://www.annuaire-des-mairies.com/ille-et-vilaine-2.html",
        "http://www.annuaire-des-mairies.com/haute-loire.html",
        "http://www.annuaire-des-mairies.com/haute-vienne.html"]
    end 

    def get_the_email_of_a_townhal_from_its_webpage(url)
        self.url = url 
        self.doc = Nokogiri::HTML(open(@url))
        self.doc.css("td")[7].text
    end 

    def get_departement_name(url)
        self.url = url
        self.doc = Nokogiri::HTML(open(@url))
        self.doc.xpath('/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]').text
    end 

    def get_all_the_urls_of_three_departments 
        begin 
        array = Array.new 
        self.departements.each do |i| 
        self.url = "#{i}"
        self.doc = Nokogiri::HTML(open(@url))
        news_links = self.doc.css("a").select{|link| link['class'] == "lientxt"}
        news_links = news_links.each{|link| 
        hash = Hash.new 
        hash["departement"] = get_departement_name (linkhref = 'http://annuaire-des-mairies.com'+ link['href'][1..-1]) 
        hash["ville"] = link.text 
        hash["email"] = get_the_email_of_a_townhal_from_its_webpage (linkhref = 'http://annuaire-des-mairies.com'+ link['href'][1..-1])
        print array.push(hash)
        }
            rescue OpenURI::HTTPError => the_error #évite les URLs renvoyant une erreur 404
            end
            end 
        array 
    end 
end 

results = Scrapper.new.get_all_the_urls_of_three_departments

File.open("../../db/all_emails.JSON","w") do |f|
    f.write(results.to_json)
end
