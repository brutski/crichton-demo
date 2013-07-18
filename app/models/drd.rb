require 'crichton'

class Drd < ActiveRecord::Base
  include Crichton::Representor::State
  represents :drd
  state_method :status
  
  def leviathan_url
    leviathan_uri
  end
end
