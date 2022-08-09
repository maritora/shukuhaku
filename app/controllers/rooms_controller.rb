class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @posts = Post.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :info, :price, :address, :image))
    if @room.save
      flash[:notice] = "ルームを登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @post = Post.new
    @posts = @room.posts
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @rooms = Room.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
end
