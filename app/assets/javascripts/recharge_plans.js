$(document).ready(function() {
	// Find Operator
	$("#mobNum").keyup(function(){
    	var mobile=document.getElementById('mobNum').value;
    	if (mobile.length==5){
    		get_operator(mobile);
      }
  });
  $("#mobNum").bind("paste",function(){
      var mobile=document.getElementById('mobNum').value;
      if (mobile.length==5){
        get_operator(mobile);
      }
  });
});

function get_plans(numData){
  var zoneCode=numData.plan_code;
  var operator=numData.plan_provider;
  document.getElementById('operator').value=operator;
  $.ajax({
    type: "GET",
    url:"https://www.pay2all.in/planinfo/getinfo?state="+zoneCode+"&operator="+operator+"&authkey=9NhQ5akpPfUIWCoHhGsrKCwHU4iZJXZyvaAS1fcc0IBsQurthICEkTxtkBBt",
    dataType: "json",
    success: show_plan
  });  
}

function show_plan(planData){
  $("#plans").removeClass("hide");
}

function get_operator(mobile){
	$.ajax({
    	type: "GET",
    	url:"https://www.pay2all.in/web-api/get-number?api_token=9NhQ5akpPfUIWCoHhGsrKCwHU4iZJXZyvaAS1fcc0IBsQurthICEkTxtkBBt&number="+mobile,
    	dataType: "json",
    	success: get_plans
  });	
}
