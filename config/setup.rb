require 'watir'
require 'watir-webdriver'
require 'nokogiri'
require 'open-uri'
require 'whenever'

downloads_directory = "#{Dir.pwd}/data_downloads"
@profile = Selenium::WebDriver::Firefox::Profile.new
@profile['browser.download.folderList'] = 2 # custom location
@profile['browser.download.dir'] = downloads_directory
@profile['browser.helperApps.neverAsk.saveToDisk'] = "text/csv"