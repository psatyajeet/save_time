class WaittimesController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]

	def create
		@location=Location.find(params[:id])
	    @waittime = @location.waittimes.build(content: params[:id2])
	    if @waittime.save
	      flash[:success] = "Waittime added!"
	      render 'static_pages/search'
	    else
	      render 'static_pages/home'
	    end
	end

end