class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


  def create
    
        #uri = URI("http://localhost:9998/sol2lun/")
    response = '{"gregorianDate":"20151214","lunarDate":"20151104"}'
    parsed_json = JSON.parse response
    lunarOutput = parsed_json["lunarDate"] #this returns "20151104"
    
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Date created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  
  def destroy
    @micropost.destroy
    flash[:success] = "Date deleted"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
    
end