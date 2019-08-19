class UserController < ApplicationController
  def index
  	@user = User.all
  end

  def show
  	#@user = current_user
  	if params[:id].to_i == current_user.id
  end
end

end
