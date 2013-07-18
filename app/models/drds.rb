require 'crichton/representor/factory'

class Drds
  extend Crichton::Representor::Factory
  
  def self.collection
    drds = Drd.all
    drds_collection = {
      total_count: drds.count, 
      items: drds
    }
    build_state_representor(drds_collection, :drds, {state: :collection})
  end
end
