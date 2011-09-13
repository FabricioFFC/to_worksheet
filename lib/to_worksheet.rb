class Array

  XML_START  = '
  <?xml version="1.0"?>
    <Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
      xmlns:o="urn:schemas-microsoft-com:office:office"
      xmlns:x="urn:schemas-microsoft-com:office:excel"
      xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
      xmlns:html="http://www.w3.org/TR/REC-html40">
    <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
      <Version>14.0</Version>
    </DocumentProperties>
    <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
      <AllowPNG/>
    </OfficeDocumentSettings>
    <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
      <WindowHeight>6240</WindowHeight>
      <WindowWidth>10000</WindowWidth>
      <WindowTopX>120</WindowTopX>
      <WindowTopY>140</WindowTopY>
      <ProtectStructure>False</ProtectStructure>
      <ProtectWindows>False</ProtectWindows>
    </ExcelWorkbook>
  '

  STYLE = '
  <Styles>
    <Style ss:ID="header">
      <Font ss:Bold="1"/>
    </Style>
  </Styles>
  '


  def to_worksheet(options = {})
    options = {:style => true, :name => 'Sheet1'}.merge(options)

    output = XML_START
    output << STYLE if options[:style]
    output << "<Worksheet ss:Name=\"#{options[:name]}\"><Table>"
    output << '<Row ss:StyleID="header">'

    options[:header].each { |value| output << add_cell(value) } if !options[:header].nil?

    output << "</Row>"

    self.each do |array|
      output << "<Row>"
      array.each do |value|
        output << add_cell(value)
      end
      output << "</Row>"
    end

    output << '</Table></Worksheet></Workbook>'

  end

  def add_cell(value)
    "<Cell><Data ss:Type=\"#{value.is_a?(Integer) ? 'Number' : 'String'}\">#{value}</Data></Cell>"
  end
  
end

 
