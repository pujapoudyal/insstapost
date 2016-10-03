class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @post = Post.new
        
    end
    
    def create
        @post = current_user_posts.create(post_params)
        if @post.valid?
            redirect_to_root_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:user_id , :photo , :description)
    end
end
