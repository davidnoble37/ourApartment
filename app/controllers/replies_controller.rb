class RepliesController < ApplicationController

  before_action :authorize,  only: [:new, :show, :destroy, :create, :index]

  def index
    @replies = Reply.all
  end

  def new
    @reply = Reply.new
  end

  def show
    @reply = Reply.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @message = @topic.messages.find(params[:message_id])
    @message.replies.create({
      body: params[:reply][:body],
      user_id: session[:user_id],
      topic_id: @topic.id,
      topic: @topic
      })
      redirect_to topic_message_path(@topic,@message)
  end

  def destroy
    @reply = Reply.find(params[:id])
    if @reply.destroy
      redirect_to replies_path
    else
      redirect_to reply_path
    end
  end

  private
  def reply_params
    params.require(:reply).permit(:body)
  end

end
