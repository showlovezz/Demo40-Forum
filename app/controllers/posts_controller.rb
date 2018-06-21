class PostsController < ApplicationController

	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts = Post.order("created_at DESC")
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path, notice: "文章建立成功"
		else
			render "new", alert: "文章建立失敗"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to posts_path, notice: "文章修改成功"
		else
			render "edit", alert: "文章修改失敗"
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, alert: "文章已被刪除"
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
