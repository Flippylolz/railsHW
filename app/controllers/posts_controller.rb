class PostsController < ApplicationController
  before_filter :check_auth, unless: :current_user
  before_filter :find_post, only: %i[edit update destroy show]

  # GET /posts
  # GET /posts.json

  def index
    @posts = Post.order('id DESC').page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.slim
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    respond_to do |format|
      format.html # show.html.slim
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.new

    respond_to do |format|
      format.html # new.html.slim
      format.json { render json: @post }
      format.js
    end
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.create(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
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
    flash[:error] = 'You need to log in before creating a post or browse them' unless params[:action] == 'update'
  end
end
