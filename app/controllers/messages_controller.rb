class MessagesController < ApplicationController

  before_action :authorize,  only: [:new, :show, :destroy, :create, :index]

  def index
    @topic = Topic.find(params[:topic_id])
    @messages = Message.all
  end

  def show
    # ytfx
    @topic = Topic.find(params[:topic_id])
    @message = @topic.messages.find(params[:message_id])
    @reply = Reply.new
  end

  def new
    @message = Message.new
    # asdf
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @topic.messages.create({
      subject: params[:message][:subject],
      body: params[:message][:body],
      user_id: session[:user_id],
      topic_id: @topic.id,
      topic: @topic
    })
    redirect_to topic_path(@topic)
  end

  def destroy
    @message = Message.find(params[:message_id])
    if @message.destroy
      redirect_to messages_path
    else
      redirect_to message_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :body)
  end

end
