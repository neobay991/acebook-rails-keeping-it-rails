require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "POST /posts" do

    before(:each) do
      @user = User.create(first_name: "test first name", last_name: "test last name", email: "test@test.com", password: "pa55w0rd")
      post :create, params: { user_id: @user.id, message: "Test message" }
    end

    it "responds with 200" do
      expect(response).to redirect_to("/users/#{@user.id}")
    end

    it "creates a user" do
      expect(Post.find_by(message: "Test message")).to be
    end
  end

  describe "GET /posts/:id" do

    before(:each) do
      @user = User.create(first_name: "test first name", last_name: "test last name", email: "test@test.com", password: "pa55w0rd")
    end

    it 'responds with 200' do
      get :show, params: { user_id: @user.id }
      expect(response).to redirect_to post_path(@user)
    end

  end

end
