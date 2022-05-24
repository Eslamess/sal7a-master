$(document).ready(function () {


    let url = "/chat/message";
    let csrf = $("meta[name=csrf-token]").attr('content');
    let chat = $('#chat');
    let wrapper = $('#chat-wrapper');
    let message = $('#message-content');
    chat.scrollTop(wrapper.height());
    function sendMessage() {
        $.post(
            url,
            {
                _token: csrf,
                message: message.val(),
                room_id: `${roomID}`
            }
        ).fail(function(e){
            console.log(e)
        });
        message.val('');
    }
    $('#send-btn').click(function () {
        sendMessage();
    });

    message.keypress(function (e) {
        if (e.which === 13) {
            sendMessage();
        }
    });
    message.on('keydown', function () {
        window.Echo.private(`typing-room-${roomID}`)
            .whisper('typing', {
                name: username
            });
    });
    function isTyping(x) {
        $('#typing').html(x + ' is typing..')
        setTimeout(function () {
            $('#typing').html('')
        }, 3000);
    }
    function updateChat(e) {
        let text = e.message.text;
        let username = e.message.user.name;
        let sender_id = e.message.sender_id;
        let css = '';
        if (userID == sender_id)
            css = 'alert-warning ml-auto';
        else
            css = 'alert-info';

        wrapper.append('<div class="alert w-50 ' + css + '"><span class="text-secondary font-weight-bold">' + username + '<div class="py-1"><p class="m-0">' + text + '</p></div><div class="text-right text-secondary" style="font-size: 12px"><span>' + e.message.created_at + '</span></div></div>');
        chat.scrollTop(wrapper.height());
    }
    window.Echo.private(`room-${roomID}`)
        .listen('MessageDelivered', e => {
            updateChat(e)
        });
    window.Echo.private(`typing-room-${roomID}`)
        .listenForWhisper('typing', (e) => {
            isTyping(e.name)
        });
});
