class PostsController < ApplicationController
  before_action :set_post, only: :destroy

  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, flash: { success: 'Post was successfully created.' } }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_to root_path, flash: { error: @post.errors.full_messages.join(', ') } }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    password_confirmation = params[:post][:password]
    if @post.password == password_confirmation
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path, flash: { success: 'Post was successfully deleted.' } }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, flash: { error: 'Incorrect password.' } }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content, :password)
    end
end
