class HomePageController < ApplicationController
  def home
    @posts = Post.all
  end
end
