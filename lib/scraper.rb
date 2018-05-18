require_relative "../lib/command_line_interface.rb"

require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_page(url)
    webpage = Nokogiri::HTML(open(url))
    books = []

    #each book = webpage.css("ol.book-menu li")[4] <- iterate by even nos.
    #freshness = webpage.css("ol.book-menu li")[4].css("div.book-body p.freshness").text
    #title = webpage.css("ol.book-menu li")[4].css("div.book-body h2.title").text
    #author = webpage.css("ol.book-menu li")[4].css("div.book-body p.author").text
    #description = webpage.css("ol.book-menu li")[4].css("div.book-body p.description").text
    #rank = webpage.css("ol.book-menu li")[29].css("button").attribute("data-rank").value

    #author = webpage.css("ol.book-menu li")[30].css("button").attribute("data-author").value

    #books = webpage.css("ol.book-menu div.book-body")[0]
    #title = webpage.css("ol.book-menu div.book-body")[0].css("h2.title").text
    #author = webpage.css("ol.book-menu div.book-body")[0].css("p.author").text
    #description = webpage.css("ol.book-menu div.book-body")[0].css("p.description").text
    #rank = 


    binding.pry


    books
  end

end
