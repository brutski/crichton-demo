require 'active_record'
require 'sqlite3'

database_file = './db/development.sqlite3'
File.new(database_file, 'w').close unless File.exists?(database_file)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3',
  pool: 5,
  timeout: 5000
)
