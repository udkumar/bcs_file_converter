class PostAttachmentsController < ApplicationController
  before_action :set_post_attachment, only: [:show, :edit, :update, :destroy]

  # GET /post_attachments
  # GET /post_attachments.json
  def index
    @post_attachments = PostAttachment.all.paginate(page: params[:page], per_page: 5)
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1
  # GET /post_attachments/1.json
  def show

  end

  # GET /post_attachments/new
  def new
    @post_attachment = PostAttachment.new
  end

  # GET /post_attachments/1/edit
  def edit
  end

  # POST /post_attachments
  # POST /post_attachments.json
  def create
    @post_attachment = PostAttachment.new(post_attachment_params)

    respond_to do |format|
      if @post_attachment.save
        if params[:convert_t] == "usfm_to_tab"
          PostAttachment.converter(@post_attachment)
        end
        format.html { redirect_to @post_attachment, notice: 'Post attachment was successfully created.' }
        format.json { render :show, status: :created, location: @post_attachment }
      else
        format.html { render :new }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_attachments/1
  # PATCH/PUT /post_attachments/1.json
  def update
    respond_to do |format|
      if @post_attachment.update(post_attachment_params)
        format.html { redirect_to @post_attachment.post, notice: 'Post attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_attachment }
      else
        format.html { render :edit }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_attachments/1
  # DELETE /post_attachments/1.json
  def destroy
    @post_attachment.destroy
    respond_to do |format|
      format.html { redirect_to post_attachments_url, notice: 'Post attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    @post_attachment = PostAttachment.find(params[:id])
    send_file @post_attachment.avatar.path, :x_sendfile=>true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attachment
      @post_attachment = PostAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_attachment_params
      params.require(:post_attachment).permit(:convert_t, :post_id, :avatar)
    end
end
