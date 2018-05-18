#require "nybooks/version"
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/scraper.rb"
require 'pry'
#module Nybooks
  # Your code goes here...
#end

class Books

  attr_accessor :title, :author, :description, :freshness

  @@all = []

  def initialize(bookhash)
    @title = bookhash[:title]
    @author = bookhash[:author]
    @description = bookhash[:description]
    @freshness = bookhash[:freshness]
    @@all << self
  end

  def self.create_from_collection(books_array)
    books_array.each do |book|
      Books.new(book)
    end
  end

  def self.all
    @@all
  end

end
