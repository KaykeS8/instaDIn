class ChatsController < ApplicationController
  layout "dashboard"
  def index
    @followers = current_user.followers.map(&:followed)
  end

  def show
    @chat_single = Chat.find_by(id: params[:id])
    @followers = current_user.followers.map(&:followed)
    @message = Message.new

    render "index"
  end

  def create
    unless chat_exist?
      @chat = Chat.create!(sender_user_id: current_user.id, recipient_user_id: fetch_recipient.id)
        redirect_to(@chat)
    else
      redirect_to chat_path(seek_chat)
    end
  end

  private
  def fetch_recipient
    User.find(params[:recipient_id])
  end

  def chat_exist?
    Chat.exists?(sender_user_id: current_user.id, recipient_user_id: fetch_recipient.id) || Chat.exists?(sender_user_id: fetch_recipient.id, recipient_user_id: current_user.id)
  end

  def seek_chat
    @chat = Chat.between_users(current_user, fetch_recipient).first
  end
end

#PRECISO PENSAR EM COMO CARREGAR AS MENSAGENS DE UM CHAT ESPECIFICO