class CommentsController < ApplicationController

    def index
        if params['user_id']
            @users = User.find(params['user_id'])
        elsif params['artwork_id']
            @users = User.find(params['artwork_id'])
        end

        render json: @users.comments
    end

    def create 
        comment = Comment.new(comment_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: comment
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end

end