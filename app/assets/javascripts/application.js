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
//= require_tree .
//= require jquery
//= require jquery_ujs
//= require cocoon

$(function () {
  $(".js-edit-comment-button").on("click", function () {
    console.log("called jquery")
    const commentId = $(this).data('comment-id');
    const commentLabelArea = $('#js-comment-label-' + commentId);
    const commentTextArea = $('#js-textarea-comment-' + commentId);
    const commentButton = $('#js-comment-button-' + commentId);

    commentLabelArea.hide();
    commentTextArea.show();
    commentButton.show();
  });

  $(document).on("click", ".comment-cancel-button", function () {
    const commentId = $(this).data('cancel-id');
    const commentLabelArea = $('#js-comment-label-' + commentId);
    const commentTextArea = $('#js-textarea-comment-' + commentId);
    const commentButton = $('#js-comment-button-' + commentId);
    const commentError = $('#js-comment-post-error-' + commentId);

    commentLabelArea.show();
    commentTextArea.hide();
    commentButton.hide();
    commentError.hide();
  });

  $(document).on("click", ".comment-update-button", function () {
    const commentId = $(this).data('update-id');
    console.log("commentId:" + commentId);
    const textField = $('#js-textarea-comment-' + commentId);
    const comment = textField.val();
    console.log("comment:" + comment);

    $.ajax({
      url: '/comments/' + commentId,
      type: 'PATCH',
      data: {
        comment: {
          comment: comment
        }
      }
    })

    .done(function (data) {
      const commentLabelArea = $('#js-comment-label-' + commentId);
      const commentTextArea = $('#js-textarea-comment-' + commentId);
      const commentButton = $('#js-comment-button-' + commentId);
      const commentError = $('#js-comment-post-error-' + commentId);

      commentLabelArea.show();
      commentLabelArea.text(data.comment);
      commentTextArea.hide();
      commentButton.hide();
      commentError.hide();
    })

    .fail(function () {
      const commentError = $('#js-comment-post-error-' + commentId);
      commentError.text('コメントを入力してください');
    })
  });
});