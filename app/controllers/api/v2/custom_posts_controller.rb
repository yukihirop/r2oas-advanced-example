class Api::V2::CustomPostsController < ApplicationController
  before_action :set_api_v2_custom_post, only: [:show, :edit, :update, :destroy]

  # GET /api/v2/custom_posts
  # GET /api/v2/custom_posts.json
  def index
    @api_v2_custom_posts = Api::V2::CustomPost.all
  end

  # GET /api/v2/custom_posts/1
  # GET /api/v2/custom_posts/1.json
  def show
  end

  # GET /api/v2/custom_posts/new
  def new
    @api_v2_custom_post = Api::V2::CustomPost.new
  end

  # GET /api/v2/custom_posts/1/edit
  def edit
  end

  # POST /api/v2/custom_posts
  # POST /api/v2/custom_posts.json
  def create
    @api_v2_custom_post = Api::V2::CustomPost.new(api_v2_custom_post_params)

    respond_to do |format|
      if @api_v2_custom_post.save
        format.html { redirect_to @api_v2_custom_post, notice: 'Custom post was successfully created.' }
        format.json { render :show, status: :created, location: @api_v2_custom_post }
      else
        format.html { render :new }
        format.json { render json: @api_v2_custom_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v2/custom_posts/1
  # PATCH/PUT /api/v2/custom_posts/1.json
  def update
    respond_to do |format|
      if @api_v2_custom_post.update(api_v2_custom_post_params)
        format.html { redirect_to @api_v2_custom_post, notice: 'Custom post was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v2_custom_post }
      else
        format.html { render :edit }
        format.json { render json: @api_v2_custom_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v2/custom_posts/1
  # DELETE /api/v2/custom_posts/1.json
  def destroy
    @api_v2_custom_post.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_custom_posts_url, notice: 'Custom post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v2_custom_post
      @api_v2_custom_post = Api::V2::CustomPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v2_custom_post_params
      params.require(:api_v2_custom_post).permit(:status, :content)
    end
end
