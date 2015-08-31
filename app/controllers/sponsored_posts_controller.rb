class SponsoredPostsController < ApplicationController
  def index
    @sponsored_posts = SponsoredPost.all
  end

  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPost.new
  end


  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = "Sponsored post was saved."
      redirect_to @sponsored_post
    else
      flash[:error] = "Error creating sponsored post. Please try again."
      render :new
    end
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
    @sponsored_post = SponsoredPost.find(params[:id])

    @sponsored_post.title = params[:sponsored_post][:title]
    @sponsored_post.body = params[:sponsored_post][:body]
    @sponsored_post.price = params[:sponsored_post][:price]

    if @sponsored_post.save
      flash[:notice] = "Sponsored post was updated"
      redirect_to @sponsored_post
    else
      flash[:error] = "Error creating sponsored post. Please try again."
      render :new
    end
  end

end
