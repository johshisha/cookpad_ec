class PortalController < ApplicationController

  # GET /
  def show 
    @portals = Category.all
  end
end
