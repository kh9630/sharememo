class UsersController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = User.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
  end


  def create
    #{'user':{name: hoge,pwd:hoge}}をおくる
    post = User.new(post_params(request.body.read))
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
    @post = User.find(params[:id])
  end

  def post_params(data)
    json_request = ActionController::Parameters.new(JSON.parse(data))
    #{'user':{name: hoge,pwd:hoge}}をおくる
    json_request.require(:user).permit(:name, :pwd)
  end
end
