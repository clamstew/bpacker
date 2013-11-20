desc 'Scrape Book Data'

task :scrape_book_data => :environment do 
  require 'nokogiri'
  Book.all.each do |book|
    page = Nokogiri::HTML(File.read("data/#{book.book_number}"))

    #Get the book title
    # title = page.at_css('[@id="btAsinTitle"]').text
    title = page.at_css("#btAsinTitle").text

    #Get the book author
    # author = page.at_css('div[@class="buying"]/span/a').text
    author = page.at_css(".buying span a").text


    # Get the book price
    # price = page.at_css('[@id="actualPriceValue"]/b').text
    price = page.at_css(".bb_price").text[/[0-9\.\S0-9]+/]

    #Get the book shipping weight
    # @TODO
    

    #Get the book isbn-10
    # @TODO

    book.update_attributes(title: title, author: author, price: price)

  end
end