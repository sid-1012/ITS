
$(function() {
	
	$("#uname").change(function(){  
        var uname = $(this).val(); 
        alert(uname);
        
        if(uname.length >= 3){  
            $(".status").html("<img src='images/loader.gif'><font color=gray> Checking availability...</font>");  
             $.ajax({  
                type: "POST",  
                url: "ValidationController",  
                data: "uname="+ uname,  
                success: function(msg){
                	  $(".status").html(msg);
                	}
            });   
        }  
        else{  
               
            $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>");  
        }  
        
          
    });  
	
	$("#myform").validate({
		rules : {
			
			firstName : {
				required : true,
				minlength : 3,
				maxlength : 50,
				mycustomvalidation : true
					
			},
			middleName : {
				required : true,
				mycustomvalidation : true
			},
			lastName :{ 
				required : true,
				mycustomvalidation : true
			},
			email :{
				required : true,
				email : true
			},
			uname : {
				required : true,
			},
			contactNumber :{
				required : true,
				maxlength : 10,
				phonevalidation : true
			},
			pass :{
				required : true,
				minlength : 6,
				passvalidation : true
			},
			rpass :{ 
				required : true,
				equalTo : "#pass"
			},
			
		},
		
		messages : {
			name : {
//				required : "Please enter a name",
				minlength : $.format("Minimum {0} characters required!"),
				maxlength : $.format("Maximum {0} characters allowed!")

			},
			pass : {
		       minlength: "Your password must be at least 5 characters long" }
		    }
		
	});
	$.validator.addMethod("mycustomvalidation", function(value, element) {
		return /^[A-Za-z\_ -]+$/.test(value);
	}, "Alpha Characters Only.");
	$.validator.addMethod("phonevalidation", function(value, element) {
		return /^[0-9]{10}$/.test(value);
	}, "Enter Correct Number.");
	$.validator.addMethod("passvalidation", function(value, element) {
		return /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/.test(value);
	}, "Enter atlest 1 number, Capital, Small, alphanumeric .");
	
	
	// use ajax to check if a user has been previously registered
    // using this email
	 
	 
	
});
