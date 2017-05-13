class PostsController < ApplicationController
  before_filter :check_auth, unless: :current_user
  before_filter :find_post, only: %i[edit update destroy show]

  def index
    @posts = Post.inverse.page(params[:page])

    respond_to do |format|
      format.js { cookies[:current_page] = cookies[:current_page].to_i + 1 unless @posts.empty? }
      format.html { cookies[:current_page] = 1 }
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.slim
    end
  end

  def new
    @post = current_user.posts.new
    @post.images.build

    respond_to do |format|
      format.html # new.html.slim
      format.js
    end
  end

  def edit
    @post.images.build if @post.images.empty?
  end

  def create
    @post = current_user.posts.create(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js
    end
  end

  private

  def can_edit?(post)
    post.user_id == current_user.id || params[:action] == 'show'
  end

  def find_post
    @post = Post.find(params[:id])
    check_auth unless can_edit? @post
  end

  def check_auth
    redirect_to log_in_path
    flash[:error] = 'You need to log in before creating a post or browse them' unless
        params[:action] == 'update'
  end
end
