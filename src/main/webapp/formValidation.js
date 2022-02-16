 $(document).ready(function() {
	     var flg=true;
	    $('#name').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_name')
	           
	        }else {

	            if(empName.length>=6 && empName.length<=25)
	           {
	           
	            	  hide('#error_name','#name');
	           
	          }
	          else{

	            err_msg('Employee name must  between 6 and 20 character.!','#error_name');
	           
	        }
	        }
	      	        
	    });
	    
	   $('#name').on('input',function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_name')
	           
	        }else {

	            if(empName.length>=6 && empName.length<=25)
	           {
	           
	            hide('#error_name','#name');
	           
	          }
	          else{

	            err_msg('Employee name must  between 6 and 20 character.!','#error_name');
	           
	        }
	        }
	        
	        

	    }); 
	
	    $('#dep').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_dept')
	           
	        }else {

	            if(empName.length>=5)
	           {
	           
	            hide('#error_dept','#dep');
	           
	          }
	          else{

	            err_msg('More than 6 character must be.!','#error_dept');
	           
	        }
	        }
	    });
	    
	    $('#dep').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!',"#error_dept")
	           
	        }else {

	        	 if(empName.length>=5)
	           {
	           
	            hide('#error_dept','#dep');
	           
	          }
	          else{

	            err_msg('More than 6 character must be.!!',"#error_dept");
	           
	        }
	        }
	        
	        

	    });
	    
	    $('#salary').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_salary')
	           
	        }
	        else {

	           
	            hide('#error_salary','#salary');
	           
	          
	        }
	    });
	    
	    $('#salary').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!',"#error_salary")
	           
	        }else {
	            hide('#error_salary','#salary');
	        }

	    });
	    
	    
	    
	    $('#mobile').focusout(function(){

	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('This field is required.!','#error_mobile')
	           
	        }
	        else{
	     if(empName.length>1 && empName.length==10)
        {
        	hide('#error_mobile','#mobile');
        	
        }
	    
        else{
        	 err_msg('Mobile no should 10 digit.!',"#error_mobile")
        }
	   }
	    });
	    
	    $('#mobile').on('input',function(){
	        var empName=$(this).val();
	        if(empName.length<1)
	        {
	            err_msg('this field is required.!',"#error_mobile")
	        }
	        else
	        {
	         if(empName.length>1 && empName.length==10)
	        {
	        	hide('#error_mobile','#mobile');
	        	
	        }
	        else{
	        	 err_msg('Mobile no should 10 digit.!',"#error_mobile")
	        }
	        }
	    });
	    
	    
	    
	    function err_msg(msg,eid,inputcolor){
	    	 $(eid).text(msg).show();
	    	 $(eid).css('color', 'red');
	    	 $(inputcolor).css('border-color', 'red');
	         flg=false;
	    }
	    function hide(eid,input){
	    	
	        $(eid).hide();
	        $(inputcolor).css('border-color', 'black');
	        flg=true;
	    }

	 });