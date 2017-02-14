class Api::V1::MessagesController < ApplicationController
   skip_before_filter :verify_authenticity_token,
                      :if => Proc.new { |c| c.request.format == 'application/json' }

  # Just skip the authentication for now
  # before_filter :authenticate_user!

  respond_to :json

  def index
     respond_with Message.all
#     render :text => '{
#   "success":true,
#   "info":"ok",
#   "data":{
#           "messages":[
#                     {"title":"Complete the app"},
#                     {"title":"Complete the tutorial"}
#                   ]
#          }
# }'
  end

  def create
    respond_with :api, :v1, Message.create(message_params)
  end

  def destroy
    respond_with Message.destroy(params[:id])
  end

  def update
   message = Message.find(params["id"])
   message.update_attributes(message_params)
   respond_with message, json: message
  end

  private

    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.permit(:title, :body, :tipo)
    end

end
