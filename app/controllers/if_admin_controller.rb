class IfAdminController < ApplicationController
  before_action :authenticate_information_admin!
  def index
  end

end
