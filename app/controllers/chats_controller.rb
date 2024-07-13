class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = current_user.chats
  end

  def create
    @chat = Chat.between(chat_params[:user1_id], chat_params[:user2_id]).first_or_create!(chat_params)
    redirect_to chat_path(@chat)
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
    @message = Message.new
  end

  private

  def chat_params
    params.require(:chat).permit(:user1_id, :user2_id)
  end
end
