class ChatChannel < ApplicationCable::Channel

  def subscribed
    stream_from("chat-#{params[:uuid]}")
  end

end