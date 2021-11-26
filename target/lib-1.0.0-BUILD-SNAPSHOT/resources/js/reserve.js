$(document).ready(function(){

    $(".delete").click(function() {
        var count = $("input[name=check]:checked").length;
        var no = new Array();

        $("input[name=check]:checked").each(function() {
            no.push($(this).attr("data-bookNo"));
        });

        if (count == 0) {
            alert("선택된 목록이 없습니다.")
        } else {
            $.ajaxSettings.traditional = true;
            $.ajax({
                url : "/reserveCancel.do",
                type : "post",
                data : {bookNo : no},
                success : function(data) {
                    alert("삭제되었습니다");
                    location.reload();
                },
            });
        }
    });

    $(".rent").click(function() {
        var count = $("input[name=check]:checked").length;
        if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
            alert("선택된 도서가 없습니다.");
        }else if(count > 1){
            alert("대여는 한번에 한권씩만 가능합니다.");
        }else{
            if (document.getElementById("historycount").value >= 5){
                alert("대여 한도 권수가 초과되었습니다.");
            }else{
                $("input[name=check]:checked").each(function() {
                    if (this.value != "2") { //대여불가
                        alert("대여가 불가능합니다.")
                    } else {
                        var bookNo = $(this).attr("data-bookNo");

                        $.ajaxSettings.traditional = true;
                        $.ajax({
                            url : "/rent.do",
                            type : "post",
                            data : {bookNo : bookNo},
                            success : function(data) {
                                alert('선택하신 도서가 대여되었습니다!');
                                location.reload();
                                console.log(attr("data-historycount"));
                            },
                            error : function(request, status, error){
                                alert("code:" + request.status + "\n"
                                    + "message : " + request.responseText
                                    + "\n" + "error : " +error);
                            },
                        });
                    }
                });

            };
        }
    });

})