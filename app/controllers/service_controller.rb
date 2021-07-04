class ServiceController < ApplicationController
    def index
        @requests = Request.all
    end
end
