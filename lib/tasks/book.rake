desc 'Scrape Book Data'

task :scrape_book_data => :environment do 
  require 'nokogiri'
  Book.all.each do |book|
    page = Nokogiri::HTML(File.read("data/#{book.book_number}"))

    #Get the book title
    title = page.css('[@id="btAsinTitle"]').text

    #Get the book author
    author = page.css('div[@class="buying"]/span/a').text

    #Get the book price
    price = page.css('[@id="actualPriceValue"]/b').text

    #Get the book shipping weight
    
    

    #Get the book isbn-10
    

    book.update_attributes(title: title, author: author, price: price, shipping_weight: shipping_weight, isbn10: isbn10)

  end
end