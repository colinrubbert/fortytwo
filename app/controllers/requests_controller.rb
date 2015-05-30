class RequestsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :index]

  def index
    @requests  = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.create(request_params)
    if @request.valid?
      redirect_to root_path
    else
      flash.now[:alert] = "Submission didn't pass validation. Please resubmit request."
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def request_params
    params.require(:request).permit(:name, :description, :phone, :email)
  end

end
