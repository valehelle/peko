class PostController < ApplicationController
    def index
        post = Post.near([2.7856273,101.7602899], 30, :units => :km).where('id > ?',0).limit(20).order("created_at DESC")
        render json: post.to_json(:only => [:id, :question, :address, :created_at], :include => { :user => {:only => :nickname}})
    end
    def show
        id = params[:id]
        post = Post.find_by(id: id)
        render json: post.to_json(:only => [:id, :question, :address, :created_at], :include => { :user => {:only => :nickname}})
    end
    def create
        post = User.first.posts.create(post_params)
        render json: post.to_json(:only => [:id, :question, :address, :created_at], :include => { :user => {:only => :nickname}})
    end
    def destroy
        id = params[:id]
        post = Post.find_by(id: id).destroy
        render json: post.to_json()
    end

    private
    def post_params
        params.permit(:question, :latitude, :longitude)
    end
end
