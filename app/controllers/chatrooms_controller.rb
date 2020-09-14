class ChatroomsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    @chatroom = Chatroom.get(current_user.id, params[:user_id])

    add_to_chatrooms unless chatted?
    respond_to do |format|
      format.js
    end
  end

  def close
    @chatroom = Chatroom.find(params[:id])

    session[:chatrooms].delete(@chatroom.id)
    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_chatrooms
    session[:chatrooms] ||= []
    session[:chatrooms] << @chatroom.id
  end

  def chatted?
    session[:chatrooms].include?(@chatroom.id)
  end
end
