class StaticPagesController < ApplicationController

  def home

  #@client = GooglePlaces::Client.new("AIzaSyD0-q-S5dQK7ph84LrAoR3oTaf6rxmDdaw")
  #@spotList = @client.spots(40.340395,-74.586894, :types => 'restaurant', :radius => "1000")
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      
    end
  end

  def search
    @client = GooglePlaces::Client.new("AIzaSyD0-q-S5dQK7ph84LrAoR3oTaf6rxmDdaw")
    @spotList = @client.spots(40.340395,-74.586894, :name => params[:keyword], :types => params[:type], :radius => '1000')
  end

  def 

  def help
  end
    
  def about
  end
    
  def contact
  end

end


