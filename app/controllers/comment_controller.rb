class CommentController < ApplicationController
    def index
        id = params[:id]
        post = Post.find_by(id: id)
        comments = post.comments.where("id > ?",0).limit(20).order("created_at DESC")
        render json: comments.to_json()
    end
    def create
        id = params[:id]
        content = params[:content]
        post = Post.find_by(id: id)
        user = User.first
        comment = post.comments.create(user: user,selected: false,content: content)
        render json: comment.to_json()
    end
    def destroy
        id = params[:comment_id]
        comment = Comment.find_by(id: id).destroy
        render json: comment.to_json()
    end
    def select
        post_id = params[:post_id]
        post = Post.find_by(id: post_id)
        comment_id = params[:comment_id]
        comment = Comment.find_by(id: comment_id)
        if !post.answered
            comment.selected = true
            comment.save!
            post.answered = true
            post.save!
        end
        render json: comment.to_json()
    end
 
end
