class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def hobby
    posts_for_branch(params[:action])
  end

  def study
    posts_for_branch(params[:action])
  end

  def team
    posts_for_branch(params[:action])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_posts
      branch = params[:action]
      search = params[:search]
      category = params[:category]

      if category.blank? && search.blank?
        posts = Post.by_branch(branch).all
      elsif category.blank? && search.present?
        posts = Post.by_branch(branch).search(search)
      elsif category.present? && search.blank?
        posts = Post.by_category(branch, category)
      elsif category.present? && search.present?
        posts = Post.by_category(branch, category).search(search)
      else
      end
    end

    def posts_for_branch(branch)
      @categories = Category.where(branch: branch)
      @posts = get_posts.paginate(page: params[:page])
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.fetch(:post, {})
    end
end
