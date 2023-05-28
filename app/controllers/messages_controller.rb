class MessagesController < ApplicationController

  before_action :find_chat

  def create
    @message = @chat.messages.new( message_params )
    @message.role = "user"

    @message.save!
    ActionCable.server.broadcast( "chat-#{@chat.uuid}", { :html => ApplicationController.render( :partial => "messages/message", :locals => { :message => @message }  ) })

    job_model = "#{@message.processing_job}_job".camelize.constantize
    job_model.perform_later(@message)

    respond_to do |format|
      format.html { redirect_to chat_path(@chat) }
      format.js
    end
  end

  protected

  def find_chat
    @chat = Conversation.find_by_uuid!(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:processing_job, :content)
  end

end
