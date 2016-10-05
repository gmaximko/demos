$(document).ready(function () 
{
	var ID;
	var logic_for_ajax=true;
	var time_start;
	var time_create;
	var time_finish;
	var latitude;
	var longitude;
	$(".2").hide();
	$(".1").click(function () 
	{
        	$(".1").hide();
            $(".2").show();
		if (logic_for_ajax!=false) ymaps.ready(init); 
		ID = setInterval(function() 
		{ 
			ymaps.ready(init); 

		}, 5000)
		
		function init() 
		{
			var geolocation = ymaps.geolocation,
			coords = [geolocation.latitude, geolocation.longitude]
			if (logic_for_ajax!=false)
			{ 
				latitude = geolocation.latitude;
				longitude = geolocation.longitude;
				time_start = new Date().toISOString();
				time_create = time_start;

				$.ajax({
					type: 'POST',
					url: 'coordinates',
					data: 
					{
			    	coordinate: 
				    	{
				    	    latitude: latitude,
				    	    longitude: longitude ,
				        	time: time_create,
			    		}
			  		},
					dataType: 'json'
				});
			}
            
            if ((latitude!=geolocation.latitude)&&(longitude!=geolocation.longitude))
			{ 
				latitude = geolocation.latitude;
				longitude =geolocation.longitude;
				time_create = new Date().toISOString();
				$.ajax({
					type: 'POST',
				  	url: 'coordinates',
				  	data: 
				  	{
				    	coordinate: 
				    	{
				        	latitude: latitude,
				        	longitude: longitude ,
				        	time: time_create,
				    	}
				  	},
				  	dataType: 'json'
				});
			} 
			logic_for_ajax=false;
		}
    });

        $(".2").click(function () 
	{
                time_finish = new Date().toISOString();
                $(".2").hide();
                $(".1").show();
		clearInterval(ID);
		location.reload();
		//document.getElementById("table_header_right").display='block';
		logic_for_ajax=true;

    });

});


