class HomepageController < ApplicationController
  def index
  	@year = params[:year]
  	@composites = Season.return_composites(@year)
  	if request.xhr?
  		render json: @composites
  	end
  end
end
