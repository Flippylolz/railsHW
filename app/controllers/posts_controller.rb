class PostsController < ApplicationController
  before_action :check_auth, unless: :current_user
  before_action :find_post, only: %i[edit update destroy show]

  def index
    @posts = Post.includes(:user, :image).inverse.page(params[:page])

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
    @post.build_image

    respond_to do |format|
      format.html # new.html.slim
      format.js
    end
  end

  def edit
    @post.build_image
  end

  def create
    @post = current_user.posts.create(post_params)

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
      if @post.update_attributes(post_params)
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

  def post_params
    params.require(:post).permit(
      :body,
      :published_at,
      :title,
      :user_id,
      image_attributes: %i[id url]
    )
  end
end
