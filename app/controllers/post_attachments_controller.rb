class PostAttachmentsController < ApplicationController

	def new
		@post_attachment = PostAttachment.new
	end

	def create
		@post_attachment = current_post.post_attachments.build(post_attachment_params)
		if @post_attachment.save
			flash[:success] = "Posted Successfully"
			redirect_to root_url
		else
			render 'new'
		end
	end
end
