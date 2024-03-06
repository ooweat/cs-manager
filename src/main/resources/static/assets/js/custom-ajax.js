//조직 Ajax
function getOrg(){
    var franchisor_id=$('#franchisor_id option:selected').val();
    var member_id=$('#org_member_id').val();
    var user_name;
    $.ajax({
        type: "GET",
        url:'/terminal/aJaxUserOrgList.do',
        dataType:"json",
        data: {franchisor_id : franchisor_id, user_name : user_name},
        success: function(data){
            if(data.length>0){
                $("#member_id").find("option").remove().end().append("<option value=''>-가맹점 선택-</option>");
                $("#member_id").css("border","1px solid #6777ef");
                $("#member_id").attr("disabled",false);
                $("#member_id").focus();
                //배열 개수 만큼 option 추가
                $.each(data, function(i){
                    $("#member_id").append("<option value='"+data[i].franchisor_id+"' id='"+data[i].franchisor_id+"'>"+data[i].user_name+"</option>");
                    //20210406
                    //값이 같으면 selected 옵션 추가
                    if(member_id==data[i].franchisor_id){
                        $("#"+data[i].franchisor_id).attr("selected","selected");
                    }
                });


            }else{
                $("#member_id").find("option").remove().end().append("<option value=''>-가맹점없음-</option>");
                $("#member_id").css("border","1px solid red");
                $("#member_id").attr("disabled",true);
                $("#franchisor_id").focus();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("오류 발생");
        }
    });
};
function getOrgCube(){
    var franchisor_id=$('#franchisor_id option:selected').val();
    var cube_id=$('#org_cube_id').val();
    var cube_model_name;
    $.ajax({
        type: "GET",
        url:'aJaxOrgCubeList.do',
        dataType:"json",
        data: {franchisor_id : franchisor_id},
        success: function(data){
            if(data.length>0){
                $("#cube_id").find("option").remove().end().append("<option value=''>-큐브선택-</option>");
                $("#cube_id").css("border","1px solid #6777ef");
                $("#cube_id").attr("disabled",false);
                $("#cube_id").focus();
                //배열 개수 만큼 option 추가
                $.each(data, function(i){
                    $("#cube_id").append("<option value='"+data[i].cube_id+"' id='"+data[i].cube_id+"'>"+data[i].cube_model_name+"</option>");
                    //20210406
                    //값이 같으면 selected 옵션 추가
                    if(cube_id==data[i].cube_id){
                        $("#"+data[i].cube_id).attr("selected","selected");
                    }
                });
            }else{
                $("#cube_id").find("option").remove().end().append("<option value=''>-큐브없음-</option>");
                $("#cube_id").css("border","1px solid red");
                $("#cube_id").attr("disabled",true);
                $("#cube_id").focus();
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("오류 발생");
        }
    });
};
