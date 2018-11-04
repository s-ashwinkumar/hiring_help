App.cable.subscriptions.create('RoomChannel', {
    received: function(data) {
        if(data.applicant_name == $('#chat_title').text()){
            setMessage(data.message, data.direction);
        }
    }
});