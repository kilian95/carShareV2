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
      //We need to differentiate beween who sent the message and who is signed in
      //currentUserId is the signed in user. data.user_id is the user who sent the message

      //get currentUserId from the url
      var url =  window.location.pathname;
      var urlSubString = url.substring(url.indexOf('/') + 1);
      var currentUserId = urlSubString.split("/");
      
      //Messages that the signed in user sends should be displayed on the right in real time
      if (data.user_id == currentUserId[1]){
        $("#messages").append("<div class='row'>"+
                                "<div class='col-lg-4'></div>"+
                                  "<div class='col-lg-5 send'>"+
                                    "<div class='panel panel-primary send'>" +
                                      data.userName + ": " + data.message + 
                                    "</div>"+ data.created_at +
                                  "</div>"+
                              "</div>");
      //messages sent by the other user should be displayed on the left in real time  
      }else{
        $("#messages").append("<div class='row'>"+
                                "<div class='col-lg-5'>"+
                                  "<div class='col-xs-1 recieve'>" + 
                                  "<img src='" + data.avatar + "'></div>"+
                                  "<div class='col-md-11 recieve'>"+
                                    "<div class='panel panel-primary recieve'>" +
                                      data.userName + ": " + data.message + 
                                    "</div>"+ data.created_at +
                                  "</div>"+
                                "</div>"+
                              "</div>");
      }
      scrollToBottom(); //scroll to bottom of div so the new message is displayed
    },
  });
  return App.messages;
}

function scrollToBottom(){
  var div = document.getElementById("messages");
  div.scrollTop = div.scrollHeight;
}