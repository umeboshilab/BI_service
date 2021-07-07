class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:notice] = "リクエストを投稿しました"
      redirect_to service_path
    else
      redirect_to service_path, flash: {
        request: @request,
        error_messages: @request.errors.full_messages
      }
    end

  end

  def show
  end

  def checkRequest
  end

  def report
  end

  def request_params
    params.require(:request).permit(:title, :message, :image)
  end
end
