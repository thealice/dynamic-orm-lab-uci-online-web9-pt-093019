require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql = "PRAGMA table_info(#{self.table_name})"
    array_of_hashes = DB[:conn].execute(sql)
    column_names = []
    array_of_hashes.each do |hash|
      column_names << hash["name"]
    end

  end

end
