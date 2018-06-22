class StaticPagesController < ApplicationController
	def home
  end
  def public
  end
  def index
  	if user_signed_in?
  	  redirect_to home_path
  	else
  	  redirect_to new_user_session_path
  	end
  end
end
