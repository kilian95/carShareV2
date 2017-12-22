//server only listens when user is looking to chat instead of always running in the background.

function createMessageChannel() {
  
  App.messages = App.cable.subscriptions.create({
    channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
  },
  {
    received: function(data) {
      $("#messages").removeClass('hidden')
      return $('#messages').append(this.renderMessage(data));
    },
    renderMessage: function(data) {
      $("#messages").append("<p> <b>" + data.user + ": </b>" + data.message + "</p>");
    },
  });
  return App.messages;
}

function scrollToBottom(){
  var div = document.getElementById("messages");
  div.scrollTop = div.scrollHeight;
}