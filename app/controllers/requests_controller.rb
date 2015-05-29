class RequestsController < ApplicationController

  def index
    @requests  = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    Request.create(request_params)
    redirect_to root_path
  end

  private

  def request_params
    params.require(:request).permit(:name, :description, :phone, :email)
  end

end
