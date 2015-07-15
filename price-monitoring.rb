require 'open-uri'
require 'hpricot'
require './config-reader'

puts "Writing in directory: " + File.dirname(File.realpath(__FILE__))

def handleItem(itemName, url, locator) 
	time = Time.new
	doc = Hpricot(open(url))
	price_content = doc.search(locator).inner_html
	puts "Price found: " + price_content[/\d+/]
	File.open(File.dirname(File.realpath(__FILE__)) + '/' + itemName + '.txt', 'a') { 
		|file| file.write(time.inspect + " price: " + price_content[/\d+/] + "\n") 
	}
end

configReader = ConfigReader.new
configReader.readConfig()
config = configReader.getConfig()

config["items"].each{
	|item| handleItem(item['name'],item['url'],item['locator'])
}