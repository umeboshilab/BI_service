class ServiceController < ApplicationController
    def index
        @requests = Request.all
        @request = Request.new(flash[:request])
    end
end
