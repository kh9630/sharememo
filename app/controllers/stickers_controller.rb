class StickersController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Sticker.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
  end


  def create
    #{'sticker':{genre: hoge,title:hoge...}}をおくる
    post = Sticker.new(post_params(request.body.read))
    if post.save
      render json: { status: 'SUCCESS',data: post }
    else
      render json: { status: 'ERROR', data: post.errors }
    end
  end

  def destroy
    @post.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
  end

  def update
    if @post.update(post_params(request.body.read))
      render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
    else
      render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
    end
  end

  private

  def set_post
    @post = Sticker.find(params[:id])
  end

  def post_params(data)
    json_request = ActionController::Parameters.new(JSON.parse(data))
    #{'memo':{user_id: hoge,title:hoge...}}をおくる
    json_request.require(:sticker).permit(:genre, :title, :img_url)
  end
end
