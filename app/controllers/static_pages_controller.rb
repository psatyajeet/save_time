class StaticPagesController < ApplicationController

  def home

    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end      

  end

  def search

    @coordinate=Geocoder.coordinates(params[:address])
    if (@coordinate==nil)
      flash.now[:error] = 'You much choose a location'
      render 'static_pages/home'
    else
      @client = GooglePlaces::Client.new("AIzaSyD0-q-S5dQK7ph84LrAoR3oTaf6rxmDdaw")
      $spotList = @client.spots(@coordinate.first,@coordinate.second, :keyword => params[:keyword], :types => params[:type], :radius => params[:dist].to_i*1000)
      if $spotList!=nil
          $spotList.each do |x|
            @location=Location.create(name: x.name , reference: x.id)
          end 
      end 
    end

    # be careful, I used a global variable for spotList which may be bad. 


  end

  def help
  end
    
  def about
  end
    
  def contact
  end

end


