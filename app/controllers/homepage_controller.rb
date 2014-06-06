class HomepageController < ApplicationController
  def index
  	@year = params[:year]
  	@composites = Season.return_all_composites
  	@avg_composites = Season.avg_composites
  	if request.xhr?
  		render json: [@composites]
  	end
  end
end
