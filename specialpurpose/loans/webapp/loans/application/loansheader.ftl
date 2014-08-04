<script type="text/javascript">
   jQuery(document).ready(function(){


   jQuery('input[name="partyId"]').change(function(){
		 /** var memberId = jQuery('select[name="partyId"]').val;
         alert(memberId); **/
         var memberId = this.value;
         var reqUrl = '/loans/control/memberdetails';
         sendAjaxRequest(reqUrl, memberId);
        });
        
   jQuery('select[name="partyId"]').change(function(){
		 /** var memberId = jQuery('select[name="partyId"]').val;
         alert(memberId); **/
         var memberId = this.value;
         var reqUrl = '/loans/control/memberdetails';
         sendAjaxRequest(reqUrl, memberId);
         
         if ((jQuery('select[name="loanProductId"]').val().length > 0) && (memberId.length > 0)){
         	var loanProductId = jQuery('select[name="loanProductId"]').val();
         	//alert(loanProductId);
         	
         	/**
         		Compute the maximum loan possible for this Member for the specified product
         		
         	**/
         	var loanMaxCalculationUrl = '/loans/control/loanMaxCalculation';
         	calculateLoanMaxAmount(loanMaxCalculationUrl, loanProductId, memberId);
         } 

        });
        
        
        jQuery('select[name="loanProductId"]').change(function(){
		 /** var loanProductId = jQuery('select[name="loanProductId"]').val;
         alert(loanProductId); **/
         var loanProductId = this.value;
         var reqUrl = '/loans/control/loandetails';
         populateLoanDetails(reqUrl, loanProductId);
         
         if ((jQuery('select[name="partyId"]').val().length > 0) && (loanProductId.length > 0)){
          	var memberId = jQuery('select[name="partyId"]').val();
         	//alert(memberId);
         	
         	/**
         		Compute the maximum loan possible for this Member for the specified product
         		
         	**/
         	var loanMaxCalculationUrl = '/loans/control/loanMaxCalculation';
         	calculateLoanMaxAmount(loanMaxCalculationUrl, loanProductId, memberId);
         }

        });
     });
     
     
     

  function sendAjaxRequest(reqUrl, memberId){
    jQuery.ajax({

     url    : reqUrl,
     type   : 'GET',
     data   : {'memberId': memberId}, //here you can pass the parameters to  
                                                   //the request if any.
     success : function(data){
     			//alert(' ID No, Member Type, Member Number, Mobile No for '+memberId);
				//alert(data.firstName);
				 $('input[name="firstName"]').val(data.firstName);
				 $('input[name="middleName"]').val(data.middleName);
				 $('input[name="lastName"]').val(data.lastName);
				 $('input[name="idNumber"]').val(data.idNumber);
				 $('input[name="memberType"]').val(data.memberType);
				 $('input[name="memberNumber"]').val(data.memberNumber);
				 $('input[name="mobileNumber"]').val(data.mobileNumber);
              //You handle the response here like displaying in required div etc. 
               },
      error : function(errorData){

              alert("Some error occurred while processing the request");
              }
    });
    }
    /** 
    	Populate Loan Details
    **/
     function populateLoanDetails(reqUrl, loanProductId){
    jQuery.ajax({

     url    : reqUrl,
     type   : 'GET',
     data   : {'loanProductId': loanProductId}, //here you can pass the parameters to  
                                                   //the request if any.
     success : function(data){
     			//alert(' ID No, Member Type, Member Number, Mobile No for '+memberId);
				//alert(data.firstName);
				 $('input[name="interestRatePM"]').val(data.interestRatePM);
				 $('input[name="maxRepaymentPeriod"]').val(data.maxRepaymentPeriod);
				 $('input[name="maximumAmt"]').val(data.maximumAmt);
               },
      error : function(errorData){

              alert("Some error occurred while processing the request");
              }


    });

   }
   
   	/** 
    	Calculate Loan Maximum Amount
    **/
     function calculateLoanMaxAmount(loanMaxCalculationUrl, loanProductId, memberId){
    jQuery.ajax({

     url    : loanMaxCalculationUrl,
     type   : 'GET',
     data   : {'loanProductId': loanProductId, 'memberId': memberId}, //here you can pass the parameters to  
                                                   //the request if any.
     success : function(data){
				 $('input[name="maxLoanAmt"]').val(data.maxLoanAmt);
               },
      error : function(errorData){

              alert("Some error occurred while processing the request");
              }


    });

   }
   </script>