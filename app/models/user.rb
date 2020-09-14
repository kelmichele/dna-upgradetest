class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable ,:validatable

  has_many :personal_messages, dependent: :destroy
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'

  has_many :notes
  has_many :chatrooms, foreign_key: :sender_id

  def name
  	email.split('@')[0]
	end

  def online?
    !Redis.new.get("user_#{self.id}_online").nil?
  end

  # def self.new_guest
  #   new { |u| u.guest = true }
  # end

  def is_guest?
    email.include?("customerchat.com")
  end
end
