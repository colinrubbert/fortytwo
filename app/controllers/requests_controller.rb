class RequestsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :index]

  def index
    @requests  = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    current_user.requests.create(request_params)
    redirect_to root_path
  end

  private

  def request_params
    params.require(:request).permit(:name, :description, :phone, :email)
  end

end
