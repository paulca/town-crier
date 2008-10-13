require 'rubygems'
require 'twitter'
require 'date'
class TownCrier
  class << self
    def run(username, password)
      Twitter::Base.new(username, password).update(message)
    end
    
    def time
      Time.now
    end
    
    def hour
      time.strftime("%l")
    end
    
    def date_formatted
      time.strftime("%e %B, %Y")
    end
    
    def message
      return "It's midnight on a new day, #{date_formatted}#{seasonal_greeting}" if hour == 0
      "#{hour} o'clock and all's well! "
    end
    
    def seasonal_greeting
      return " Happy Christmas!" if Date.today == Date.parse('25 Dec 2008')
    end
  end
end
