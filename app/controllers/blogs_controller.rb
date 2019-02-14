class BlogsController < ApplicationController
  # before_action >> จะทำ method set_blog ก่อน
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all

    # @blogs = Blog.limit(1) >> show แค่ blog 1
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show

  end

  # GET /blogs/new
  def new
    # ไปหน้าform create
    @blog = Blog.new
    # พอกด create จะ ridirect ไป method create
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    # create จริงๆ
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
                     # redirect_to blog_path(@blog)
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
     # byebug if allows yout to stop your system and then ask the system about itself while it's running
    # byebug
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      # friendly for also help lookup in slug
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      # it is submit in the form update or create
      params.require(:blog).permit(:title, :body)
    end
end
