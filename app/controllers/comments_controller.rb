class CommentsController < ApplicationController
protect_from_forgery :except => :create
before_filter :authenticate_user!

def create
    @comment = Comment.new(params[:comment])


    respond_to do |format|
      if @comment.save
         @notice = { "success" => "true"}
          format.json { render json: @notice }
        else
          @notice={"success" => "Please fill all fileds"}
          format.json { render json: @notice }
      end
    end
end




end