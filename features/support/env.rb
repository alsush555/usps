require 'selenium-webdriver'
require 'rspec'
require_relative '../page_models/page_actions'
Dir["../page_models/*.rb"].each {|file| require file}

def create_browser
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.window.maximize
end

def usps
  @usps ||= USPS.new @browser
end

