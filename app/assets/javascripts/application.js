// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require tagsinput
//= require bootstrap-datepicker
//= require chat
//= require_tree .
$( document ).ready(function() {
    $(function(){
        // always pass csrf tokens on ajax calls
        $.ajaxSetup({
            headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
        });
    });
    $('.datepicker').datepicker({format: 'dd/mm/yyyy'});
    $('#job_accept').click( function(){
        $.ajax({
            url: "/accept_application",
            type: "POST",
            data: {
                job_application_id: this.getAttribute('job_application_id')
            },
            success: function(resp){ location.reload();}
        });
    });

    $('#job_decline').click( function(){
        var that = this;
        $.ajax({
            url: "/decline_application",
            type: "POST",
            data: {
                job_application_id: this.getAttribute('job_application_id')
            },
            success: function(resp){  location.reload();}
        });
    });

    $('#enable_chat').click( function(){
        $('#current_job_application').val(this.getAttribute('job_application_id'))
        $.ajax({
            url: "/get_chat",
            type: "GET",
            data: {
                job_application_id: this.getAttribute('job_application_id')
            },
            success: function(response){
                $('#chat_title').text(response.applicant_name);

                if(response.messages.length != 0){
                    response.messages.forEach( function(message){
                        setMessage(message.message, message.side);
                    });
                }
            }
        });
    });
});