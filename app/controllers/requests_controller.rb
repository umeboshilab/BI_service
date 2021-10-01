class RequestsController < ApplicationController
  before_action :confirm_current_user_belongs_to_group

  def create
    @request = Request.new(request_params)
    request_image_file = nil
    request_image_name = 'no_image.png'
    error_msgs = []

    ActiveRecord::Base.transaction do
      if Group.lock.find_by(id: @current_user.group_id).blank?
        error_msgs << 'グループが存在しないか，削除されました'
        raise ActiveRecord::Rollback
      end
      @request[:group_id] = @current_user.group_id
      if @request[:image].present?
        request_image_file = @request[:image].read
        request_image_name = @request[:image].original_filename
        @request[:image] = request_image_name
      end
      @request.save!
    rescue ActiveRecord::RecordInvalid => e
      error_msgs << e.record.errors.full_messages
    end

    if error_msgs.present?
      redirect_to service_path, flash: {
        request: @request,
        error_messages: error_msgs.flatten
      }
    else
      flash[:notice] = "リクエストを投稿しました"
      if request_image_file
        File.binwrite("public/request_images/#{@request.id}_#{request_image_name}", request_image_file)
      end
      redirect_to service_path
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
