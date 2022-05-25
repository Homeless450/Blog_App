class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.joins(:ratings).group("id").order("avg(ratings.rate) desc").first(10)

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.author_ip = request.remote_ip
    user = User.find_by(login: params[:user][:login]) 

    if user    
      user.posts << @post
      if @post.save
        render json: @post, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def hash 
    @list_of_ips = params[:list_of_ips]
    @hash = @list_of_ips.map do |ip|
      @array_of_users = User.joins(:posts).where(posts: {author_ip: ip}).pluck(:login)
      [ip, @array_of_users]
    end.to_h

    render json: @hash, status: :created
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:body, :title, :author_ip)
    end
end
