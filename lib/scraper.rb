require_relative "../lib/command_line_interface.rb"

require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_page(url)
    webpage = Nokogiri::HTML(open(url))
    books = []
    doc = webpage.css("ol.book-menu div.book-body")
    doc.each do |book|
      title = doc.css("h2.title").text
      author = doc.css("p.author").text
      description = doc.css("p.description").text
      freshness = doc.css("p.freshness").text
      books << {:title => title, :author => author, :description => description, :freshness => freshness}
    end
    books
    binding.pry
  end
    #books = webpage.css("ol.book-menu div.book-body")[0]
    #title = webpage.css("ol.book-menu div.book-body")[0].css("h2.title").text
    #author = webpage.css("ol.book-menu div.book-body")[0].css("p.author").text
    #description = webpage.css("ol.book-menu div.book-body")[0].css("p.description").text



end
