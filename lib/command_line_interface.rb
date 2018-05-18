require 'nokogiri'
require 'pry'

class CommandLineInterface

  BASEPATH = "https://www.nytimes.com/books/best-sellers/hardcover-fiction/"
  BASEPATH2 = "https://www.nytimes.com/books/best-sellers/hardcover-nonfiction/"

    def run
      #main_menu
      generate_book_list
    end

    def main_menu
      puts "Welcome to NY Best Seller Books:"
      puts "Please select from the menu below:"
      puts "1. Hardcover Fiction"
      puts "2. Hardcove NonFiction"
      puts "3. Exit"
      input = gets.strip
      #binding.pry
      case input.to_i
      when 1
        #generate_book_list1
        second_menu
      when 2
        #generate_book_list2
        second_menu
      else
      end
    end

    def second_menu
      puts "Type 'Exit' or press '1' to return to main menu"
      input = gets.strip

      if input.to_i == 1
        main_menu
      elsif input != "Exit"
        second_menu
      end

    end

    def display_booklist
    end


    def generate_book_list
      Scraper.scrape_page(BASEPATH)
    end

end
