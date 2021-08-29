class UserController < ApplicationController
  before_action :authenticate_user!
  layout 'map_layout'

  def index

  end

end
