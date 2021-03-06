class MessagesController < ApplicationController

def create
  message = Message.new(message_params)
  message.user = current_user
  
  if message.save
    #broadcasting out to messages channel including the chat_id so messages are broadcasted to specific chat only
    ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
      message: message.content,
      userName: message.user.firstName,
      user_id: message.user.id,
      created_at: message.created_at.strftime("%d %B %H:%M"),
      avatar: message.user.avatar.url.to_s  
    )
    
  else
    redirect_to chats_path
  end
end

private
    def message_params
      params.require(:message).permit(:content, :chat_id, :other_user)
    end
end