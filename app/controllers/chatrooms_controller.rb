class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chat = Chatroom.new
    @chat.user = current_user
    @chat.profile = Profile.find(params[:profile])
    @chat.name = "chats"
    if @chat.save
      redirect_to chatroom_path(@chat)
    else
      render 'pages/home'
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to chatrooms_path
  end
end
