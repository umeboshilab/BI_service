class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
    request_image_file = nil
    request_image_name = 'no_image.png'
    if @request[:image]
      request_image_file = @request[:image].read
      request_image_name = @request[:image].original_filename
    end

    @request[:image] = request_image_name

    if @request.save
      flash[:notice] = "リクエストを投稿しました"
      if request_image_file
        File.binwrite("public/request_images/#{@request.id}_#{request_image_name}", request_image_file)
      end
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
