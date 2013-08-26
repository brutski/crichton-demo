require 'crichton'
require 'launchy'
require './db/connection'
require './db/seed'
require './app/models/drd'
require './app/models/drds'

def launch(output, type = :html)
  output_file = "./tmp/output.#{type}"
  
  file = File.open(output_file, 'w')
  if type == :html
    file.write(output)
  else
    pretty_xml(output, file)
  end
  file.close
  
  Launchy.open(output_file) do |exception|
    puts "Attempted to open #{uri} and failed because #{exception}"
  end
end

def drds_descriptor
  Crichton.descriptor_registry['drds'].parent_descriptor
end

def show_alps
  launch(Crichton.raw_descriptor_registry['drds'].parent_descriptor.to_xml, :xml)
end

def show_dereferenced_alps
  launch(Crichton.descriptor_registry['drds'].parent_descriptor.to_xml, :xml)
end

private
def pretty_xml(output, file)
  require "rexml/document"

  doc = REXML::Document.new(output) 
  doc.context[:attribute_quote] = :quote

  formatter = REXML::Formatters::Pretty.new

  # Compact uses as little whitespace as possible
  formatter.compact = true
  formatter.write(doc, file)
end

#Crichton::logger = Logger.new(STDOUT)
