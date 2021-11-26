$(document).ready(function(){

    $(".rent").click(function() {
        var count = $("input[name=check]:checked").length;
        if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
            alert("선택된 도서가 없습니다.")
        }else{
            if (document.getElementById("historycount").value >= 5){
                alert("대여 한도 권수가 초과되었습니다.")
            }else{
                $("input[name=check]:checked").each(function() {
                        if (this.value != "2") { //대여불가
                            alert("대여가 불가능합니다.")
                        } else {
                            if ($(this).attr("data-reservest") != "0") {
                                alert("예약도서는 대여가 불가능합니다.")
                            }else{

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
                        }
                    }
                )};
        }
    });

    $(".reserve").click(function() {
        var count = $("input[name=check]:checked").length;
        if (count == 0) { //아무것도 선택된 것이 없을때 alert 띄워주기
            alert("선택된 도서가 없습니다.")
        }
        $("input[name=check]:checked").each(function() {
            if ($(this).attr("data-reservest") != "0") { //예약불가
                alert("예약이 불가능합니다.")
            } else {
                if (this.value == "2") {
                    alert("예약이 불가능합니다.")
                } else {
                    var bookNo = $(this).attr("data-bookNo");
                    $.ajaxSettings.traditional = true;
                    $.ajax({
                        url : "/reserve.do",
                        type : "post",
                        data : {bookNo : bookNo},
                        success : function(data) {
                            alert('선택하신 도서가 예약되었습니다!');
                            location.reload();
                        },
                    });
                }
            }
        });
    });

    $(".wish").click(function() {

        var count = $("input[name=check]:checked").length;

        var no=new Array();
        $("input[name=check]:checked").each(function() {
            no.push($(this).attr("data-bookNo"));
        });
        console.log(no);
        if (count == 0) {
            alert("선택된 도서가 없습니다.")
        } else {
            $.ajaxSettings.traditional = true;
            $.ajax({
                url : "/addWishList.do",
                type : "post",
                data : { chknos : no },
                success : function(data) {
                    alert('위시리스트로 담겼습니다!');
                    location.reload();
                },

                error : function(request, status, error){
                    alert("code:" + request.status + "\n"
                        + "message : " + request.responseText
                        + "\n" + "error : " +error);

                }

            });
        }

    });


})

function check_only(check) {
    var obj = document.getElementsByName("check");
    console.log("check_only");
    for (var i = 0; i < obj.length; i++) {
        if (obj[i] != check) {
            obj[i].checked = false;
        }
    }
}
