class ConversationsController < ApplicationController

  def index
    uuid = Conversation.last&.uuid || SecureRandom.uuid
    redirect_to chat_path(uuid)
  end

  def new
    uuid = SecureRandom.uuid
    redirect_to chat_path(uuid)
  end

  def show
    @chat = Conversation.find_by_uuid(params[:id]) || Conversation.create( :uuid => params[:id] )
  end

end
