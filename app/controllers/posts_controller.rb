class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def points_up
    @post = Post.find(params[:id])
    if vote("up", current_user.id, @post.id)
      @post.update_attributes(points: (@post.points + 1))
      if @post.save
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

  def points_down
    @post = Post.find(params[:id])
    if vote("down", current_user.id , @post.id)
      @post.update_attributes(points: (@post.points - 1))
      if @post.save
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

  # Custom function to find/create new vote record of the post/comment being voted on
  # Returns true if vote has been change/new Vote record; Returns false if vote has not been changed
  def vote(value, user, post = nil, comment = nil)
    if Vote.where(:user_id => user, :post_id => post, :comment_id => comment).first
      vote = Vote.where(:user_id => user, :post_id => post, :comment_id => comment).first
    else
      vote = Vote.new(value: value, user_id: user, post_id: post, comment_id: comment)
      vote.save
      return true
    end

    if vote.value != value
      vote.value = value
      vote.save
      return true
    end

    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :points, :tag, :title, :body)
    end
end
