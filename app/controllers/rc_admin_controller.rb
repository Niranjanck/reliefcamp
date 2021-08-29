class RcAdminController < ApplicationController
  before_action :authenticate_relief_camp_admin!
  def index

  end
end
