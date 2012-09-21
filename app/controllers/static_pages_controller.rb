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
      #flash.now[:error] = 'You much choose a location'
      #render 'static_pages/home'
      @result = request.location
      $lat=@result.latitude
      $long=@result.longitude
    else
      $lat=@coordinate.first
      $long=@coordinate.second
    end
      @client = GooglePlaces::Client.new("AIzaSyD0-q-S5dQK7ph84LrAoR3oTaf6rxmDdaw")
      $spotList = @client.spots($lat, $long, :keyword => params[:keyword], :types => params[:type], :radius => params[:dist].to_i*1000)
      if $spotList!=nil
          $spotList.each do |x|
            @location=Location.create(name: x.name , reference: x.id)
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


