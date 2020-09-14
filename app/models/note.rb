class Note < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_create_commit { NoteBroadcastJob.perform_later(self) }
end
