class PostsController < ApplicationController



	before_action :find_post, only:[:show, :edit, :update, :destroy] 

def index
@posts = Post.all.order("created_at DESC")
end

def show 
end



def new 
@posts = Post.new
end

def create 
@posts = Post.new(post_params)
if @posts.save
	redirect_to @posts
else
	render 'new'
end

end

def edit
end


def destroy
@posts.destroy
redirect_to root_path
end

def update
	if @posts.update(post_params)
		redirect_to @posts
		else
		render 'edit' 
end
end


private 

 def find_post
 	@posts = Post.find(params[:id])
end

private 

def post_params
params.require(:post).permit(:title, :content)
end

end
