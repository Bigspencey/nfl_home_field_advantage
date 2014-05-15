// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.onload = function() {

	var map = new Datamap({
    element: document.getElementById('container'),
    scope: 'usa',
    fills: {
  		defaultFill: '#B8B8B8',
  		Arizona: '#870619',
  		Atlanta: '#BD0D18',
  		Baltimore: '#280353',
  		Buffalo: '#00338D',
  		Carolina: '#000000',
  		Chicago: '#03202F',
  		Cincinnati: '#000000',
  		Cleveland: '#26201E',
  		Dallas: '#002244',
  		Denver: '#FB4F14',
  		Detroit: '#006DB0',
  		Greenbay: '#213D30',
  		Houston: '#02253A',
  		Indianapolis: '#003B7B',
  		Jacksonville: '#D0B239',
  		Kansascity: '#B20032',
  		Miami: '#008D97',
  		Minnesota: '#4F2682',
  		Newengland: '#0D254C',
  		Neworleans: '#D2B887',
  		Giants: '#192F6B',
  		Jets: '#0C371D',
  		Oakland: '#C4C8CB',
  		Philadelphia: '#003B48',
  		Pittsburgh: '#000000',
  		Sandiego: '#08214A',
  		Sanfrancisco: '#AF1E2C',
  		Seattle: '#06192E',
  		StLouis: '#13264B',
  		Tampabay: '#B20032',
  		Tennessee: '#648FCC',
  		Washington: '#773141'
  		//any hex, color name or rgb/rgba value,
  		// Resource: http://teamcolors.arc90.com/
	            		
		},
		geographyConfig: {
      dataUrl: null, //if not null, datamaps will fetch the map JSON (currently only supports topojson)
      borderWidth: 1,
      borderColor: '#FDFDFD',
      popupTemplate: function(geography, data) { //this function should just return a string
        return '<div class="hoverinfo"><strong>' + geography.properties.name + '</strong></div>';
      },
      popupOnHover: true, //disable the popup while hovering
      highlightOnHover: false,
		},
    });

		map.bubbles([
	   {name: 'Arizona', latitude: 33.5386, longitude: -112.1864, radius: 2, fillKey: 'Arizona'},
	   {name: 'Atlanta', latitude: 33.7550, longitude: -84.3900, radius: 31, fillKey: 'Atlanta'},
	   {name: 'Baltimore', latitude: 39.2833, longitude: -76.616, radius: 30, fillKey: 'Baltimore'},
	   {name: 'Buffalo', latitude: 42.9047, longitude: -78.8494, radius: 29, fillKey: 'Buffalo'},
	   {name: 'Carolina', latitude: 35.2269, longitude: -80.8433, radius: 28, fillKey: 'Carolina'},
	   {name: 'Chicago', latitude: 41.8819, longitude: -87.6278, radius: 27, fillKey: 'Chicago'},
	   {name: 'Cincinnati', latitude: 39.1000, longitude: -84.5167, radius: 26, fillKey: 'Cincinnati'},
	   {name: 'Cleveland', latitude: 41.4822, longitude: -81.6697, radius: 25, fillKey: 'Cleveland'},
	   {name: 'Dallas', latitude: 32.7758, longitude: -96.7967, radius: 24, fillKey: 'Dallas'},
	   {name: 'Denver', latitude: 39.7392, longitude: -104.98475, radius: 23, fillKey: 'Denver'},
	   {name: 'Detroit', latitude: 42.3314, longitude: -83.0458, radius: 22, fillKey: 'Detroit'},
	   {name: 'Green Bay', latitude: 44.5133, longitude: -88.0158, radius: 21, fillKey: 'Greenbay'},
	   {name: 'Houston', latitude: 29.7628, longitude: -95.3831, radius: 20, fillKey: 'Houston'},
	   {name: 'Indianapolis', latitude: 39.7910, longitude: -86.1480, radius: 19, fillKey: 'Indianapolis'},
	   {name: 'Jacksonville', latitude: 30.3369, longitude: -81.6614, radius: 18, fillKey: 'Jacksonville'},
	   {name: 'Kansas City', latitude: 39.0997, longitude: -94.5786, radius: 17, fillKey: 'Kansascity'},
	   {name: 'Miami', latitude: 25.7877, longitude: -80.2241, radius: 16, fillKey: 'Miami'},
	   {name: 'Minnesota', latitude: 44.9833, longitude: -93.2667, radius: 15, fillKey: 'Minnesota'},
	   {name: 'New England', latitude: 42.0653, longitude: -71.2483, radius: 14, fillKey: 'Newengland'},
	   {name: 'New Orleans', latitude: 29.9667, longitude: -90.0500, radius: 13, fillKey: 'Neworleans'},
	   {name: 'NY Giants', latitude: 40.8171, longitude: -74.0850, radius: 12, fillKey: 'Giants'},
	   {name: 'NY Jets', latitude: 40.8171, longitude: -74.0850, radius: 11, fillKey: 'Jets'},
	   {name: 'Oakland', latitude: 37.8044, longitude: -122.2708, radius: 20, fillKey: 'Oakland'},
	   {name: 'Philadelphia', latitude: 39.9500, longitude: -75.1667, radius: 9, fillKey: 'Philadelphia'},
	   {name: 'Pittsburgh', latitude: 40.4417, longitude: -80.0000, radius: 8, fillKey: 'Pittsburgh'},
	   {name: 'San Diego', latitude: 32.7150, longitude: -117.1625, radius: 20, fillKey: 'Sandiego'},
	   {name: 'San Francisco', latitude: 37.7083, longitude: -122.2803, radius: 10, fillKey: 'Sanfrancisco'},
	   {name: 'Seattle', latitude: 47.6097, longitude: -122.3331, radius: 10, fillKey: 'Seattle'},
	   {name: 'St. Louis', latitude: 38.6272, longitude: -90.1978, radius: 20, fillKey: 'StLouis'},
	   {name: 'Tampa Bay', latitude: 27.9710, longitude: -82.4650, radius: 30, fillKey: 'Tampabay'},
	   {name: 'Tennessee', latitude: 36.1667, longitude: -86.7833, radius: 20, fillKey: 'Tennessee'},
	   {name: 'Washington', latitude: 38.9339, longitude: -76.8967, radius: 10, fillKey: 'Washington'}
    ]);

	var circles = d3.selectAll('circle')[0];
	
	for (var i = 0; i < circles.length; i++) { 
		circles[i].onmouseover = function() { 
			var data = this.dataset.info.split("\"")[13]
			var teamName = data.toLowerCase() + 2
			this.style.fill = secondaryColors[teamName]
		}; 
	};


	var secondaryColors = {
		arizona2: '#000000',
		atlanta2: '#000000',
		baltimore2: '#000000',
		buffalo2: '#C60C30',
		carolina2: '#0088CE',
		chicago2: '#DD4814',
		cincinnati2: '#FB4F14',
		cleveland2: '#E34912',
		dallas2: '#8C8B8A',
		denver2: '#002244',
		detroit2: '#C5C7CF',
		greenbay2: '#FFCC00',
		houston2: '#B31B34',
		indianapolis2: '#FFFFFF',
		jacksonville2: '#007198',
		kansascity2: '#F2C800',
		miami2: '#015679',
		minnesota2: '#FFC52F',
		newengland2: '#C80815',
		neworleans2: '#000000',
		giants2: '#CA001A',
		jets2: '#FFFFFF',
		oakland2: '#000000',
		philadelphia2: '#708090',
		pittsburgh2: '#F2C800',
		sandiego2: '#EEC607',
		sanfrancisco2: '#E6BE8A',
		seattle2: '#4EAE47',
		stlouis2: '#C9AF74',
		tampabay2: '#89765F',
		tennessee2: '#000080',
		washington2: '#FFB612'
	}

	$(function() {
    $( "#slider" ).slider({
    	orientation: "vertical",
      value: 2004,
      min: 2004,
      max: 2013,
      step: 1,
      slide: function( event, ui ) {
        $('#year').empty().append(ui.value)

      }
    });
  });

	$.ajax({
		url: '/',
		method: 'GET',
		data: {year: $('#year').text()},
		contentType: 'json'
	}).done(function(response) {
		seasonExecute(response);
	});


  function seasonExecute(response) {
		for (var i = 0; i < circles.length; i++) {
			circles[i].r.baseVal.value = response[i]
		}
	}


};



// Listen for event/position
// Make ajax call to server for composite value
// Assign that composite value to each bubble


// OBSERVER FUNCTIONS FROM HELL

	// var target = document.querySelector('#year').innerHTML;

	// var observer = new MutationObserver(function(mutations) {
 //  	mutations.forEach(function(mutation) {
 //    console.log(mutation.type);
 //  	});    
	// });

	// var config = { attributes: true, childList: true, characterData: true };

		// observer.observe(target, config);


