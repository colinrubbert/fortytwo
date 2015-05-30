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
      redirect_to root_path, :notice => "Thank you for submitting a request. We will get back to you as soon as possible."
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
