require_relative "../lib/command_line_interface.rb"

require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_page(url)
    webpage = Nokogiri::HTML(open(url))
    i = 0
    books = []
    doc = webpage.css("ol.book-menu div.book-body")
    #binding.pry
    while i < 14 do
      doc.each do |book|
        title = doc[i].css("h2.title").text
        author = doc[i].css("p.author").text
        description = doc[i].css("p.description").text
        freshness = doc[i].css("p.freshness").text
        books << {:title => title, :author => author, :description => description, :freshness => freshness}
        i +=1
      end
    end
    books
    #binding.pry
  end


end
