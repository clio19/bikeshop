class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  before_action :authenticate_admin!, :except => [:create,:show]

   layout "frontend", :only => [:new, :create]

  respond_to :html, :json

  def index
    @messages = Message.all
    respond_with(@messages)
  end

  def show
    @message.status = true
    @message.save
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
   if @message.save!
    redirect_to root_path , notice: "Success"
  else
    flash.now[:notice] = "Error"
    render "new" 
  end
end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:title, :body, :status, :tipo)
    end
end
