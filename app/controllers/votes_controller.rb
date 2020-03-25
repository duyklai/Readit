class VotesController < ApplicationController
  before_action :set_vote, only: [:update, :destroy]

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to root_path, notice: 'Vote was created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: 'Error in voting.' }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to root_path, notice: 'Vote was created.' }
        format.json { head :no_content }
      else
        format.html { redirect_to root_path, notice: 'Error in voting.' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Vote was destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:value, :user_id, :post_id, :comment_id)
    end
end
