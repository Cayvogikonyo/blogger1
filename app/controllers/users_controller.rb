class UsersController < ApplicationController
	 before_action :require_login, except: [:index]
	 before_action :require_owner, only: :edit
def require_owner
	if current_user != Author.includes(:user).find(params[:id])
    redirect_to root_path
    flash.notice = "You Cannot Edit This Profile"
    
  	end
end
def create
	@user = User.new(user_params)
	@user.author_id = params[:author_id]
	@user.save

	redirect_to root_path
end
def edit
	 @author = Author.includes(:user).find(params[:id])
	@user = @author.user
	
end
def update
	@user = User.find(params[:id])
	@user.author_id = params[:author_id]
	@user.update(user_params)

	flash.notice = "Your Profile has Been Updated"

   redirect_to author_path(@user)
end
def index
	@user = User.find(params[:author_id])
end

def user_params
	params.require(:user).permit(:body)
end
end
