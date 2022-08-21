class PostsController < ApplicationController
  def index
    @rooms = Room.all
    @posts = Post.all
  end

  def new
    @post = Post.new  
  end

  def create
    @post = Post.new(params.require(:post).permit(:room_name, :start, :end, :ninzu, :totalprice, :sumdays, :user_id, :room_id))
    if @post.save
      flash[:notice] = "予約が完了しました。"
      redirect_to @post
    else
      render "new"
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

  def confirm #確認画面
    @room = Room.find_by(params[:id])
    @post = Post.new(params.require(:post).permit(:room_name, :start, :end, :room_price, :ninzu, :sumdays, :user_id, :room_id))
    @sumdays = (@post.end.to_i - @post.start.to_i) / 86400
    @totalprice = @post.room_price * @post.ninzu * @sumdays
  end

end