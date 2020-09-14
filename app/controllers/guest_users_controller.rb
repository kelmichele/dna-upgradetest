class GuestUsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
    redirect_to root_url
  end

  private
  def create_guest_user
    u = User.new(:email => "support_#{Time.now.to_i}#{rand(100)}@customerchat.com", :guest => true)
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

end
