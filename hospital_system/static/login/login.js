$(document).ready(function() {


    $("#log_create" ).click(function() {
        var user_email_text = $("#inputEmail").val();
        var user_pwd_text = $("#inputPassword").val();
        
        $.ajax({
            type: "POST",                
            dataType : "json",
            // url: "",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify({"email":user_email_text,
                                    "pwd":user_pwd_text, 
                                    "type":"log_create", 
                                    'csrfmiddlewaretoken':$('[name="csrfmiddlewaretoken"]').val()}),
            success: function(result){
                if(result == "success"){
                    window.location.href = "/log_create";
                }
                else{
                    $("#msg").text("Your account doesn't match the password, please try again or your account is not exist");
                }
            },
            error: function(request, status, error){
                console.log("Error");
                console.log(request)
                console.log(status)
                console.log(error)
            }
        });


    });

    // $("#log_create" ).click(function() {
    //     var user_acct_text = $("#user_acct").val();
    //     var user_pwd_text = $("#user_pwd").val();
    //     console.log(user_acct_text);
    //     console.log(user_pwd_text);
    //     if( user_acct_text.length == 0 ){
    //         alert("Your acct input is invalid");
    //         $("#user_pwd").clear();
    //         $("#user_acct").clear();
    //     }
    //     if( user_pwd_text.length == 0 ){
    //         alert("Your acct pwd is invalid");
    //         $("#user_pwd").clear();
    //         $("#user_acct").clear();
    //     }
    //     $.ajax({
    //         type: "POST",
    //         url: "/query_db",                
    //         dataType : "json",
    //         contentType: "application/json; charset=utf-8",
    //         data : JSON.stringify({"acct":user_acct_text,"pwd":user_pwd_text,"type":"create"}),
    //         success: function(result){
    //             if(result == "success"){
    //                 window.location.href = "/query_page";
    //             }
    //             else{
    //                 $("#msg").text("Your account already exists");
    //             }
    //         },
    //         error: function(request, status, error){
    //             console.log("Error");
    //             console.log(request)
    //             console.log(status)
    //             console.log(error)
    //         }
    //     });
    // });


    


});