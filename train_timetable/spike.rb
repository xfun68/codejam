#!/usr/bin/env ruby

require 'rexml/document'
include REXML

data_filename = "codejam_utf-8.html"
data_filepath = File.expand_path(File.dirname(__FILE__)) +
  "/test_data/" + data_filename

html = File.open(data_filepath).read

def restrict(html, starting_regexp, stopping_regexp)
  start = html.index starting_regexp
  stop = html.index stopping_regexp
  html[start...stop]
end

table = restrict html, "<!-- ResultStationToStationAD -->", "</div><!-- ResultStationToStationContent -->"

table = table.gsub(/\r\n/, "")
table = table.gsub(/\t/, "")

trs = table.scan(/<tr[\s>].*?<\/tr>/)

header = trs[0]
columns = header.scan(/<td>.*?<\/td>/)
columns.collect! do |field|
  field.gsub(/<.*?>/, "")
end
puts columns.join "\t"

train_info = trs[1]
columns = train_info.scan(/<td>.*?<\/td>/)
columns.collect! do |field|
  field.gsub(/<.*?>/, "")
end
puts columns.join "\t"

