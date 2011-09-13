require 'rubygems'

Dir["lib/to_worksheet.rb"].each {|file| require file }

class ToWorksheet
  def self.return_array
    [['apple', 1], ['orange', 0.5], ['pineapple', 2], ['watermelon', 3]]
  end
end


