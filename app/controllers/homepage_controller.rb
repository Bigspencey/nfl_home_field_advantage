class HomepageController < ApplicationController
  def index
  	@year = params[:year]
  	@composites = Season.return_composites(@year)
  	@avg_composites = Season.avg_composites
  	if request.xhr?
  		render json: [@composites, @year]
  	end
  end
end
