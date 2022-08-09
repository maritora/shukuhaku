class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @room = Room.find(params[:id])
  end

  def confirm #確認画面
    @post = Post.new(permit_params)
    @post.sumdays = ( @post.end.to_i - @post.start.to_i ) / 86400  #滞在期間
    @post.total_price = @post.total_price * @post.ninzu * @post.sumdays 
  end

  def create
    @post = Post.new(params.require(:post).permit(:room_id, :room_name, :room_info, :room_price, :room_ninzu, :start, :end))
     if @post.save
        flash[:notice] = "予約しました"
        redirect_to :posts
     else
        render "posts"
     end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end