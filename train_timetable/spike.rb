#!/usr/bin/env ruby

data_filename = "codejam_utf-8.html"
data_filepath = File.expand_path(File.dirname(__FILE__)) +
  "/test_data/" + data_filename

html = File.read(data_filepath)

# Extracts timetable
start = html.index "<!-- ResultStationToStationAD -->"
stop = html.index "</div><!-- ResultStationToStationContent -->"
table = html[start...stop].gsub(/\r\n/, "").gsub(/\t/, "")
rows = table.scan(/<tr[\s>].*?<\/tr>/)

# Extracts header
header = rows.first
header_fields = header.scan(/<td[> ].*?<\/td>/).collect! do |field|
  field.gsub(/<.*?>/, "")
end
header_fields.pop
rows.shift

# Extracts detailed header of price
rows.first.scan(/<td[> ].*?<\/td>/).last.scan(/>([^<>].*?)</).each do |price_group|
  header_fields.concat price_group[0].scan(/(.*?):/).flatten.first.strip.split("/")
end

# Extracts general info
general_info = []
rows.each do |row|
  fields = row.scan(/<td[> ].*?<\/td>/)
  general_info << fields[0..-2].collect do |field|
    field.gsub(/<.*?>/, "")
  end
end

# Extracts detailed price info
detailed_prices = []
rows.each do |row|
  fields = row.scan(/<td[> ].*?<\/td>/)
  detailed_prices <<  fields.last.gsub(/&nbsp;/, "").scan(/:(.*?)</).flatten.join.split(/[^\d]/)
end

# Output
wanted_fields = [0, 4, 9, 12, 14, 15]

header_fields.values_at(*wanted_fields).each do |field|
  print field.ljust(7)
end
puts

general_info.each_index do |index|
  general_info[index].concat(detailed_prices[index]).values_at(*wanted_fields).each do |field|
    print field.ljust(10)
  end
  puts
end

