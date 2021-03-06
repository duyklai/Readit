require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe VotesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Vote. As you add validations to Vote, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes_post) {
    { value: 'up', user_id: 1, post_id: 1, comment_id: nil }
  }
  let(:valid_attributes_comment) {
    { value: 'up', user_id: 1, post_id: nil, comment_id: 1 }
  }

  let(:invalid_attributes) {
    { value: nil, user_id: nil, post_id: nil, comment_id: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VotesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  login_user

  describe "POST #create" do
    context "with valid params for post" do
      it "creates a new Vote" do
        expect {
          post :create, params: {vote: valid_attributes_post}, session: valid_session
        }.to change(Vote, :count).by(1)
      end

      it "redirects to the home page" do
        post :create, params: {vote: valid_attributes_post}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with valid params for comment" do
      let(:post_original) { Post.create(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }
      let(:comment) { Comment.create(user_id: 1, post_id: post_original.id, points: 1, body: "newBody", ancestry: nil) }
      let(:valid_attributes_comment) {
        { value: 'up', user_id: 1, post_id: nil, comment_id: comment.id }
      }

      it "creates a new Vote" do
        expect {
          post :create, params: {vote: valid_attributes_comment}, session: valid_session
        }.to change(Vote, :count).by(1)
      end

      it "redirects to the home page due to creating vote from home page" do
        post :create, params: {vote: valid_attributes_comment}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "PUT #update" do
    let(:post_original) { Post.create(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }
    let(:comment) { Comment.create(user_id: 1, post_id: post_original.id, points: 1, body: "newBody", ancestry: nil) }

    context "with valid params" do
      let(:new_attributes_post) {
        { value: 'down', user_id: 1, post_id: post_original.id, comment_id: nil }
      }

      it "updates the requested post vote " do
        vote = Vote.create! valid_attributes_post
        put :update, params: {id: vote.to_param, vote: new_attributes_post}, session: valid_session
        vote.reload
        expect(vote.value).to eq('down')
        expect(vote.user_id).to eq(1)
        expect(vote.post_id).to eq(1)
        expect(vote.comment_id).to eq(nil)
      end

      it "redirects to the home page" do
        vote = Vote.create! valid_attributes_post
        put :update, params: {id: vote.to_param, vote: valid_attributes_post}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with valid params for comment votes" do
      let(:new_attributes_comment) {
        { value: 'down', user_id: 1, post_id: nil, comment_id: comment.id }
      }

      it "updates the requested comment vote " do
        vote = Vote.create! valid_attributes_comment
        put :update, params: {id: vote.to_param, vote: new_attributes_comment}, session: valid_session
        vote.reload
        expect(vote.value).to eq('down')
        expect(vote.user_id).to eq(1)
        expect(vote.post_id).to eq(nil)
        expect(vote.comment_id).to eq(1)
      end

      it "redirects to the home page due to creating vote from home page" do
        vote = Vote.create! valid_attributes_comment
        put :update, params: {id: vote.to_param, vote: valid_attributes_comment}, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post vote" do
      vote = Vote.create! valid_attributes_post
      expect {
        delete :destroy, params: {id: vote.to_param}, session: valid_session
      }.to change(Vote, :count).by(-1)
    end

    it "redirects to the home page" do
      vote = Vote.create! valid_attributes_post
      delete :destroy, params: {id: vote.to_param}, session: valid_session
      expect(response).to redirect_to(root_path)
    end

    it "destroys the requested comment vote" do
      vote = Vote.create! valid_attributes_comment
      expect {
        delete :destroy, params: {id: vote.to_param}, session: valid_session
      }.to change(Vote, :count).by(-1)
    end

    it "redirects to the home page" do
      vote = Vote.create! valid_attributes_comment
      delete :destroy, params: {id: vote.to_param}, session: valid_session
      expect(response).to redirect_to(root_path)
    end
  end

end
