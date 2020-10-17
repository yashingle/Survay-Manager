var createSurvay = $('#save-survay-form');
var survayName = $('#survay-name');
var survayDetail = $('#survay-detail');
var survayPoint = $('#survay-points');
var survayAlert = $('#new-survay-alert');
var deleteSurvay = $('.survay-delete');
var deleteSurvayResponse = $('.survay-response-delete');
var goToSurvay = $('.go-to-survay');
var deleteUser = $('.delete-user');

goToSurvay.css("cursor", "pointer");
survayAlert.hide();
createSurvay.on('submit', function(e) {
  e.preventDefault();
  var name  = survayName.val();
  var detail  = survayDetail.val();
  var total_points  = survayPoint.val();
  var data = {
    title: name,
    detail: detail,
    total_points: total_points,
    authenticity_token: window.authenticity_token
  };
  $.ajax({
    url: "/survay",
    contentType: "application/json",
    type: "POST",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('Accept', 'application/json');
    },
    data: JSON.stringify(data),
    success: function(result) {
      window.location.reload();
    },
    error: function(result) {
      survayAlert.show();
    }
  });
});
deleteSurvay.on('click', function(e) {
  var survayId = $(this).data('survay-id');
  console.log(survayId);
  data = {
    authenticity_token: window.authenticity_token
  };
  $.ajax({
    url: `/survay/${survayId}`,
    contentType: "application/json",
    type: "DELETE",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('Accept', 'application/json');
    },
    data: JSON.stringify(data),
    success: function(result) {
      window.location.reload();
    },
    error: function(result) {
      // survayAlert.show();
    }
  });
});

deleteSurvayResponse.on('click', function(e) {
  var survayResponseId = $(this).data('survay-response-id');
  console.log(survayResponseId);
  data = {
    authenticity_token: window.authenticity_token
  };
  $.ajax({
    url: `/survay-response/${survayResponseId}`,
    contentType: "application/json",
    type: "DELETE",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('Accept', 'application/json');
    },
    data: JSON.stringify(data),
    success: function(result) {
      window.location.reload();
    },
    error: function(result) {
      // survayAlert.show();
    }
  });
});

goToSurvay.on('click', function(e) {
  var survayId = $(this).data('survay-id');
  window.location.assign("/home/survay/"+survayId);
});

deleteUser.on('click', function(e) {
  var userId = $(this).data('user-id');
  data = {
    authenticity_token: window.authenticity_token
  };
  $.ajax({
    url: `/user/${userId}`,
    contentType: "application/json",
    type: "DELETE",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('Accept', 'application/json');
    },
    data: JSON.stringify(data),
    success: function(result) {
      window.location.reload();
    },
    error: function(result) {
      // survayAlert.show();
    }
  });
});