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

RSpec.describe CommentsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { user_id: 1, points: 1, post_id: 1, body: 'MyBody' }
  }

  let(:invalid_attributes) {
    { user_id: nil, points: nil, post_id: nil, body: nil }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # Not testing for GET #index and GET #show because methods were removed and 
  # deemed unnecessary 

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      comment = Comment.create! valid_attributes
      get :edit, params: {id: comment.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:post_original) { Post.create(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }
      let(:valid_attributes) { { user_id: 1, points: 1, post_id: post_original.id, body: 'MyBody'} }

      it "creates a new Comment" do
        expect {
          post :create, params: {comment: valid_attributes}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the associated post" do
        post :create, params: {comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(post_original)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {comment: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:second_post) { Post.create(user_id: 2, points: 1, tag_id: 2, title: "newTitle", body: "newBody") }
      let(:valid_attributes) { { user_id: 1, points: 1, post_id: second_post.id, body: 'MyBody'} }
      let(:new_attributes) {
        { user_id: 2, points: 2, post_id: second_post.id, body: 'MyNewBody' }
      }

      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: new_attributes}, session: valid_session
        comment.reload
        expect(comment.user_id).to eq(2)
        expect(comment.points).to eq(2)
        expect(comment.post_id).to eq(1)
        expect(comment.body).to eq('MyNewBody')
      end

      it "redirects to the associated post" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: valid_attributes}, session: valid_session
        expect(response).to redirect_to(second_post)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        comment = Comment.create! valid_attributes
        put :update, params: {id: comment.to_param, comment: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    let(:post_original) { Post.create(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }
    let(:valid_attributes) { { user_id: 1, points: 1, post_id: post_original.id, body: 'MyBody'} }

    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {id: comment.to_param}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the associated post" do
      comment = Comment.create! valid_attributes
      delete :destroy, params: {id: comment.to_param}, session: valid_session
      expect(response).to redirect_to(post_original)
    end
  end

end
