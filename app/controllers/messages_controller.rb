class MessagesController < ApplicationController
    def create
        @message = Message.create(content: message_params[:content],sender_user_id: current_user.id,chat_id: params[:chat_id])
    end

    private 

    def message_params
        params.require(:message).permit(:content)
    end
end
