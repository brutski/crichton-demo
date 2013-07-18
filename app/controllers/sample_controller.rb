# Note: This is just an example of the future implementation of Crichton in a Rails controller. It is not accessed
# in the demo.

class DrdsController < ApplicationController
  respond_to :xhtml, :halo_json
  
  def show
    @drd = Drd.find_by_uuid(params[:uuid])
    respond_with(@drd, get_authorizations)
  end
  
  private
  def get_authorizations
    # Some logic
    {conditions: [:some, :authorized, :conditions]}
  end
end
