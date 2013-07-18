require './app/models/drd'
require 'uuidtools'

class DrdMigration < ActiveRecord::Migration
  def up
    begin
      down
    rescue 
    end
    
    create_table :drds, :id => false do |t|
      t.string :uuid
      t.string :name
      t.string :status
      t.string :kind
      t.string :leviathan_uuid
      t.string :leviathan_uri
      t.datetime   :built_at 
    end
    
    5.times do |i|
      ::Drd.create(
        uuid: ::UUIDTools::UUID.random_create.to_s,
        name: "181#{i}",
        status: Random.rand(2) > 0 ? 'activated' : 'deactivated',
        kind: Random.rand(2) > 0 ? 'standard' : 'sentinel',
        leviathan_uuid: uuid = ::UUIDTools::UUID.random_create.to_s,
        leviathan_uri: "http://farscape.example.org/leviathan/#{uuid}",
        built_at: Time.now
      )
    end
  end
  
  def down
    drop_table :drds
  end
end

DrdMigration.new.up
