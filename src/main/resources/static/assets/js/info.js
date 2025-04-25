
function callCompany() {
  $.ajax({
    type: "GET",
    url: "/api/settings/companys",
    cache: false,
    success: function (cmd) {
      if (cmd.data.length > 0) {
        for (let i = 0; i < cmd.data.length; i++) {
          $('#compSeq').append(
              '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
        }
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callPartners() {
  $.ajax({
    type: "GET",
    url: "/api/settings/partners/${member.companySeq}",
    cache: false,
    success: function (cmd) {
      if (cmd.data.length > 0) {
        for (let i = 0; i < cmd.data.length; i++) {
          $('#ptnCompSeq').append(
              '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
        }
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callSeqName(target, value) {
  let url = "";
  let userLevel = document.getElementById("userLevel").value;
  switch (target) {
    case 'tidSeq':
      url = "/api/settings/terminal-models";
      break;
    case 'vmSeq':
      url = "/api/settings/vm-models";
      break;
    case 'trbSeq':
      url = "/api/settings/troubles";
      break;
    case 'atSeq':
      url = "/api/settings/actionTroubles";
      break;
    case 'rtSeq':
      url = "/api/settings/realTroubles";
      break;
    case 'progressStatus':
      url = "/api/settings/asStatus/"+userLevel + "/" + value;
      break;
    case 'ptnCompSeq':
      url = "/api/settings/partners/" + value;
      break;
  }

  $.ajax({
    type: "GET",
    url: url,
    cache: false,
    success: function (cmd) {
      if (cmd.data.length > 0) {
        if (value == 0) {
          $('#' + target).next().children("span").parent().css("border", "solid 1px red");
        }
        for (let i = 0; i < cmd.data.length; i++) {
          let selected = cmd.data[i].seq == value ? ' selected' : "";
          $('#' + target).append(
              '<option value="' + cmd.data[i].seq + '" ' + selected + '>' + cmd.data[i].name
              + '</option>');
        }
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callVMModel(vmSeq) {
  $.ajax({
    type: "GET",
    url: "/api/settings/vm-models",
    cache: false,
    success: function (cmd) {
      if (cmd.data.length > 0) {

        for (let i = 0; i < cmd.data.length; i++) {
          let selected = cmd.data[i].seq == vmSeq ? ' selected' : "";
          $('#vmSeq').append(
              '<option value="' + cmd.data[i].seq + '" ' + selected + '>' + cmd.data[i].name
              + '</option>');
        }
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}

function callError() {
  $.ajax({
    type: "GET",
    url: "/api/settings/errors/repair",
    cache: false,
    success: function (cmd) {
      if (cmd.data.length > 0) {
        for (let i = 0; i < cmd.data.length; i++) {
          if (cmd.data[i].type == 'RT') {
            $('#trbSeq').append(
                '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
          } else if (cmd.data[i].type == 'RA') {
            $('#atSeq').append(
                '<option value="' + cmd.data[i].seq + '"">' + cmd.data[i].name + '</option>');
          }
        }
      }
      loadingStop();
    }, // success
    error: function (xhr, status) {
      alert(xhr + " : " + status);
      location.href("/");
    }
  });
}