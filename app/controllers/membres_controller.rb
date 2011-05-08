class MembresController < ApplicationController
  def index
    @users = User.order("points desc").paginate(:per_page => 50, :page => params[:page])
  end
end
