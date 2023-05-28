class ApplicationJob < ActiveJob::Base

  queue_as :lllab_queue

  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError


  def respond_to(message)
    conversion = message.conversation

    begin
      result = yield(message)
    rescue PyCall::PyError => e
      result = "發生 Python 程式錯誤: #{e.value}"
    rescue => e
      result = "發生 Ruby 程式錯誤: #{e}"
    end

    ai_message = conversion.messages.create!( :role => message.processing_job, :content => result)
    ActionCable.server.broadcast( "chat-#{conversion.uuid}", { :html => ApplicationController.render( :partial => "messages/message", :locals => { :message => ai_message }  ) })

  end
end
