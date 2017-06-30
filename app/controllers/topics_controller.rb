class TopicsController < ApplicationController

  before_action :authorize,  only: [:destroy, :create, :index]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @message = Message.new
  end

  def new
    @topic = Topic.new
  end

  def create
    sdf
    @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to topics_path
      else
        redirect_to new_topic_path
      end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    if @topic.destroy
      redirect_to topics_path
    else
      redirect_to topic_path
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:subject, :user_id)
  end

end
