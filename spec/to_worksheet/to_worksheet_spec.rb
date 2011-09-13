require 'spec_helper'

describe ToWorksheet do

  it 'generate worksheet' do
    worksheet = ToWorksheet.return_array.to_worksheet(:header => ['fruit', 'price'], :name => 'Price List')
    file  = File.new("/tmp/worksheet.xls", "w")
    file.puts worksheet
    file.close
  end

end
