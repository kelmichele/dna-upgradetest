class NoteBroadcastJob < ApplicationJob
  queue_as :default

  def perform(note)
    sender = note.user
    recipient = note.chatroom.opposed_user(sender)

    broadcast_to_sender(sender, note)
    broadcast_to_recipient(recipient, note)
  end

  private

  def broadcast_to_sender(user, note)
    ActionCable.server.broadcast(
      "chatrooms-#{user.id}",
      note: render_note(note, user),
      chatroom_id: note.chatroom_id
    )
  end

  def broadcast_to_recipient(user, note)
    ActionCable.server.broadcast(
      "chatrooms-#{user.id}",
      window: render_window(note.chatroom, user),
      note: render_note(note, user),
      chatroom_id: note.chatroom_id
    )
  end

  def render_note(note, user)
    ApplicationController.render(
      partial: 'notes/note',
      locals: { note: note, user: user }
    )
  end

  def render_window(chatroom, user)
    ApplicationController.render(
      partial: 'chatrooms/chatroom',
      locals: { chatroom: chatroom, user: user }
    )
  end
end
