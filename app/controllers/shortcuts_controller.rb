class ShortcutsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    posts = Shortcut.order(created_at: :desc)
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
  end

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
  end


  def create
    #{'memo':{user_id: hoge,title:hoge...}}をおくる
    post = Shortcut.new(post_params(request.body.read))
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
    @post = Shortcut.find(params[:id])
  end

  def post_params(data)
    json_request = ActionController::Parameters.new(JSON.parse(data))
    #{'memo':{user_id: hoge,title:hoge...}}をおくる
    json_request.require(:shortcut).permit(:is_valid, :title, :user_id, :content,\
                                           :color, :work_time, :is_alarm, :alarm_timing)
  end
end
