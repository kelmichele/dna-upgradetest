App.chatroom = App.cable.subscriptions.create("ChatroomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var chatroom = $('#chatrooms-list').find("[data-chatroom-id='" + data['chatroom_id'] + "']");
    if (data['window'] !== undefined) {
      var chatroom_visible = chatroom.is(':visible');

      if (chatroom_visible) {
        var notes_visible = (chatroom).find('.panel-body').is(':visible');

        if (!notes_visible) {
          chatroom.removeClass('panel-heading').addClass('panel-success');
          // chatroom.removeClass('panel-default').addClass('panel-success');
        }
        chatroom.find('.notes-list').find('ul').append(data['note']);
      }
      else {
        $('#chatrooms-list').append(data['window']);
        chatroom = $('#chatrooms-list').find("[data-chatroom-id='" + data['chatroom_id'] + "']");
        chatroom.find('.panel-body').toggle();
      }
    }
    else {
      chatroom.find('ul').append(data['note']);
    }

    var notes_list = chatroom.find('.notes-list');
    var height = notes_list[0].scrollHeight;
    notes_list.scrollTop(height);
  },

  speak: function(note) {
    return this.perform('speak', {
      note: note
    });
  }
});
$(document).on('submit', '.new_note', function(e) {
  e.preventDefault();
  var values = $(this).serializeArray();
  App.chatroom.speak(values);
  $(this).trigger('reset');
});
