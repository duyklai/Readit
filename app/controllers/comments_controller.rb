class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    comment_post = @comment.post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comment_post, notice: 'Comment was deleted.' }
      format.json { head :no_content }
    end
  end

  # Custom functions for increasing point value of comment by 1 OR by 2 if user has voted down previously
  def points_up
    @comment = Comment.find(params[:id])
    vote_result = Vote.vote("up", current_user.id, nil, @comment.id)
    if vote_result
      if vote_result == "new"
        @comment.update_attributes(points: (@comment.points + 1))
      else
        @comment.update_attributes(points: (@comment.points + 2))
      end
      if @comment.save
        respond_to do |format|
          format.html { redirect_to request.referrer}
          format.js
        end
      else
        flash[:notice] = "Error Voting Please Try Again"
        redirect_to request.referrer
      end
    else
      flash[:notice] = ""
      redirect_to request.referrer
    end
  end

  # Custom functions for decreasing point value of comment by 1 OR by 2 if user has voted up previously
  def points_down
    @comment = Comment.find(params[:id])
    vote_result = Vote.vote("down", current_user.id, nil, @comment.id)
    if vote_result
      if vote_result == "new"
        @comment.update_attributes(points: (@comment.points - 1))
      else
        @comment.update_attributes(points: (@comment.points - 2))
      end
      if @comment.save
        respond_to do |format|
          format.html { redirect_to request.referrer}
          format.js
        end
      else
        flash[:notice] = "Error Voting Please Try Again"
        redirect_to request.referrer
      end
    else
      flash[:notice] = ""
      redirect_to request.referrer
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :points, :body, :ancestry)
    end
end
