#!/usr/bin/env ruby

data_filename = "codejam_utf-8.html"
data_filepath = File.expand_path(File.dirname(__FILE__)) +
  "/test_data/" + data_filename

html = File.read(data_filepath)

# Extracts timetable
start = html.index "<!-- ResultStationToStationAD -->"
stop = html.index "</div><!-- ResultStationToStationContent -->"
table = html[start...stop].gsub(/\r\n/, "").gsub(/\t/, "").gsub(/&nbsp/, "")
rows = table.scan(/<tr[\s>].*?<\/tr>/)

# Extracts header
header = rows.first
header_fields = header.scan(/<td[> ].*?<\/td>/).collect! do |field|
  field.gsub(/<.*?>/, "")
end
rows.shift

# Extracts operating info
operating_infos = []
rows.each do |row|
  operating_infos << row.scan(/<td[> ].*?<\/td>/).collect do |field|
    field.gsub(/<.*?>/, "")
  end
end

# Output
wanted_fields = [0, 4, 9, 12]

header_fields.values_at(*wanted_fields).each do |field|
  print field.ljust(10)
end
puts

operating_infos.each do |info|
  info.values_at(*wanted_fields).each do |field|
    print field.ljust(10)
  end
  puts
end

