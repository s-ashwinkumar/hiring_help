function getMessageText() {
    var $message_input;
    $message_input = $('.message_input');
    return $message_input.val();
};

var setMessage = function(text, side) {

    if(!side) side = 'left';
    var $messages, message;
    if (text.trim() === '') {
        return;
    }
    $('.message_input').val('');
    $messages = $('.messages');
    message = new Message({
        text: text,
        message_side: side
    });
    message.draw();
    return $messages.animate({ scrollTop: $messages.prop('scrollHeight') }, 300);
};
function Message(arg) {
    this.text = arg.text, this.message_side = arg.message_side;
    this.draw = function (_this) {
        return function () {
            var $message;
            $message = $($('.message_template').clone().html());
            $message.addClass(_this.message_side).find('.text').html(_this.text);
            $('.messages').append($message);
            return setTimeout(function () {
                return $message.addClass('appeared');
            }, 0);
        };
    }(this);
    return this;
};

function sendText(message, job_application_id) {
    $.ajax({
        url: "/send_message",
        type: "POST",
        data: {
            message: message,
            job_application_id: job_application_id
        },
        success: function(resp){  debugger; }
    });
};
$( document ).ready(function() {

    $('.send_message').click(function (e) {
        sendText(getMessageText(), $('#job_id').val());
    });


});