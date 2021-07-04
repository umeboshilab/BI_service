class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    if @request.save
      # @request = Request.new
      flash[:notice] = "リクエストを投稿しました"
    else
      flash[:error_messages] = @request.errors.full_messages
    end
    redirect_to service_path
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
