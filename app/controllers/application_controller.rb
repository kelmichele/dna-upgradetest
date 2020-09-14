class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :opened_chatrooms_windows
  helper_method :current_user
	helper_method :boss_admin
	helper_method :closed_line
	helper_method :open_line
  helper_method :fading_users, :active_users


  def create_chat
    @chatroom = Chatroom.create(current_user.id, params[:user_id])

    add_to_chatrooms unless chatted?
    respond_to do |format|
      format.js
    end
  end

	def opened_chatrooms_windows
   	# @users = current_user.admin? ? User.all.where.not(id: current_user) : User.all.where(admin: true)
    @users = user_signed_in? && current_user.admin? ? User.all.where.not(id: current_user) : User.where(admin: true)

    session[:chatrooms] ||= []
    @chatrooms_windows = Chatroom.includes(:recipient, :notes)
                                           .find(session[:chatrooms])
  end

	private
  def boss_admin
	  @boss_admin ||= User.find_by(admin: true)
  end

  def logging_in
  end

  def fading_users
    fading_users = User.where(['created_at <= ? and admin = ?', Date.current-5.days, false])
    fading_users.reorder('created_at DESC')
  end

  def active_users
    active_users = User.where(['created_at >= ? and admin = ?', Date.current, false]).reorder('created_at DESC')
  end

  def closed_line
   	closed_line = Chatroom.where('created_at <= ?', Date.current-5.days)
 	end

  def open_line
   	open_line = Chatroom.where('created_at >= ?', Date.current).reorder('created_at DESC')
  end
end
