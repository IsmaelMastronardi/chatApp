class MessagesController < ApplicationController
  before_action :authenticate_user!
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast "chat_channel_#{@chat.id}", {message: render_message(@message)}
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    render(partial: 'message', locals: { message: message })
  end

end
