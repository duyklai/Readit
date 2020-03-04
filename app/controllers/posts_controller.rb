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
    @tag = Tag.find_by_name(post_params[:tag_id]) || Tag.create(:name => post_params[:tag_id])
    tag_id_post_params = post_params
    tag_id_post_params[:tag_id] = @tag.id
    @post = current_user.posts.build(tag_id_post_params)
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
        redirect_to root_path and return
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @tag = Tag.find_by_name(post_params[:tag_id]) || Tag.create(:name => post_params[:tag_id])
    tag_id_post_params = post_params
    tag_id_post_params[:tag_id] = @tag.id
    respond_to do |format|
      if @post.update(tag_id_post_params)
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
      redirect_to root_path
    end
  end

  # Custom functions for increasing point value of post by 1 OR by 2 if user has voted down previously
  def points_up
    @post = Post.find(params[:id])
    vote_result = Vote.vote("up", current_user.id, @post.id)
    if vote_result
      if vote_result == "new"
        @post.update_attributes(points: (@post.points + 1))
      else
        @post.update_attributes(points: (@post.points + 2))
      end
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

  # Custom functions for decreasing point value of post by 1 OR by 2 if user has voted up previously
  def points_down
    @post = Post.find(params[:id])
    vote_result = Vote.vote("down", current_user.id , @post.id)
    if vote_result
      if vote_result == "new"
        @post.update_attributes(points: (@post.points - 1))
      else
        @post.update_attributes(points: (@post.points - 2))
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :points, :tag_id, :title, :body)
    end
end
