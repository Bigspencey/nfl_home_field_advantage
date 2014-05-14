class HomepageController < ApplicationController
  def index
  	@composite = Season.all.first.composite
  	if request.xhr?
  		render json: @composite
  	end
  end
end
