class PostsController < ApplicationController
	before_action :logged_in_user, only: [:index,:show, :new, :edit, :update, :destroy]

	def show
		@post = Post.find(params[:id])
		@post_attachments = @post.post_attachments.all
	end

	def new
		@post = Post.new
		@post_attachment = @post.post_attachments.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			params[:post_attachments]['image'].each do |i|
				@post_attachment = @post.post_attachments.create!(:image => i, :post_id => @post.id)
			end
			redirect_to @post
		else
			flash[:danger] = "Please fill up all the fields"
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			flash[:success] = "Updated Successfully"
			redirect_to user
		else
			render 'new'
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :village, :unit_number, :floor, :barangay, :floor_area, :furnishing ,:bedrooms, :bathrooms, :daily_rate, :weekly_rate, :monthly_rate, :user_id, 
			post_attachments: [:id, :post_id, :image])
	end

	def logged_in_user
	    unless logged_in?
	      store_location
	      flash[:danger] = "Please log in"
	      redirect_to login_url
	    end
	end
end
