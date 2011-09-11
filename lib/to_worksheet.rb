class Array
  def to_worksheet(options = {})
    output = '<?xml version="1.0"?>
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
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="12" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s62">
   <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="12" ss:Color="#000000"
    ss:Bold="1"/>
  </Style>
 </Styles>'
    output << '<Worksheet ss:Name="Sheet1"><Table>'
    output << '<Row ss:StyleID="s62">'
    options[:header].each { |value| output << "<Cell><Data ss:Type=\"String\">#{value}</Data></Cell>" } if !options[:header].blank?
    output << "</Row>"
    self.each do |array|
      output << "<Row>"
      array.each do |value|
        output << "<Cell><Data ss:Type=\"#{value.is_a?(Integer) ? 'Number' : 'String'}\">#{value}</Data></Cell>"
      end
      output << "</Row>"
    end
    output << '</Table></Worksheet></Workbook>'
  end
end

 
