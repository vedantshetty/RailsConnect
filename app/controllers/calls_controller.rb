class CallsController < ApplicationController

  def create
    head :no_content
    ActionCable.serve.broadcast('call_channel', whitelisted_call_params)
  end

  private
  #type -> signal being broadcasted(JOIN, EXCHANGE, LEAVE)
  #from/to -> a number representing the user
  #sdp -> session description protocol is a serialized JSON that wil contain the users IP, media stream info and a ton of other info
  #call -> header the date will be under

  def whitelisted_call_params
    params.permit(:call,:type,:from,:to,:sdp)
  end
end
