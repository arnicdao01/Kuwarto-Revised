class PostsController < ApplicationController
	before_action :logged_in_user, only: [:index, :new, :edit, :update, :destroy]

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Posted Successfully"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post.user_id = current_user
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			@post.user_id = current_user
			flash[:success] = "Updated Successfully"
			redirect_to user
		else
			render 'new'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :village, :unit_number, :floor, :barangay, :floor_area, :furnishing ,:bedrooms, :bathrooms, :daily_rate, :weekly_rate, :monthly_rate, :user_id)
	end

	def logged_in_user
	    unless logged_in?
	      store_location
	      flash[:danger] = "Please log in"
	      redirect_to login_url
	    end
	end
end
