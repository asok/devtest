require 'nokogiri'
require 'open-uri'

module Evaluation
  class Letters
    URL = "http://times.com/"

    def call
      Nokogiri::HTML(open(URL)).at('body').inner_text.count("a") / 100
    end
  end

  class Tags
    URL = "https://ajax.googleapis.com/ajax/services/feed/find?v=1.0&q=news"

    def call
      open(URL).read.scan(%r{\\u003cb\\u003e}).count 
    end
  end

  class Nodes
    URL = "http://time.com"

    def call
      Nokogiri::HTML(open(URL)).css('*').select(&:element?).length / 100
    end
  end

  module Methods
    def call(type)
      "Evaluation::#{type}".constantize.new.call
    end
  end

  extend Methods
end
