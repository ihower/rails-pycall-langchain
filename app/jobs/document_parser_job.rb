class DocumentParserJob < ApplicationJob

  def perform(document)
    document.parse_and_index!
  end

end
