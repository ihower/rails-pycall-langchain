class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])

    send_file @document.doc.path
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      DocumentParserJob.perform_later(@document)

      redirect_to documents_path, notice: "Doc uploaded successfully."
    else
      render :index
    end
  end

  private

  def document_params
    params.require(:document).permit(:description, :doc)
  end
end
