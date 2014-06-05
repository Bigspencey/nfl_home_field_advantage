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
	      popupOnHover: false, //disable the popup while hovering
	      highlightOnHover: false,
			},
			bubblesConfig: {
				popupOnHover: true,
			},
    });

		map.bubbles([
		   {name: 'Arizona Cardinals', latitude: 33.5386, longitude: -112.1864, radius: 18.13, fillKey: 'Arizona'},
		   {name: 'Atlanta Falcons', latitude: 33.7550, longitude: -84.3900, radius: 42, fillKey: 'Atlanta'},
		   {name: 'Baltimore Ravens', latitude: 39.2833, longitude: -76.616, radius: 16.5, fillKey: 'Baltimore'},
		   {name: 'Buffalo Bills', latitude: 42.9047, longitude: -78.8494, radius: 24.38, fillKey: 'Buffalo'},
		   {name: 'Carolina Panthers', latitude: 35.2269, longitude: -80.8433, radius: 9.38, fillKey: 'Carolina'},
		   {name: 'Chicago Bears', latitude: 41.8819, longitude: -87.6278, radius: 3.5, fillKey: 'Chicago'},
		   {name: 'Cincinnati Bengals', latitude: 39.1000, longitude: -84.5167, radius: 18.13, fillKey: 'Cincinnati'},
		   {name: 'Cleveland Browns', latitude: 41.4822, longitude: -81.6697, radius: 10.5, fillKey: 'Cleveland'},
		   {name: 'Dallas Cowboys', latitude: 32.7758, longitude: -96.7967, radius: 21.5, fillKey: 'Dallas'},
		   {name: 'Denver Broncos', latitude: 39.7392, longitude: -104.98475, radius: 41.25, fillKey: 'Denver'},
		   {name: 'Detroit Lions', latitude: 42.3314, longitude: -83.0458, radius: 9, fillKey: 'Detroit'},
		   {name: 'Green Bay Packers', latitude: 44.5133, longitude: -88.0158, radius: 16.5, fillKey: 'Greenbay'},
		   {name: 'Houston Texans', latitude: 29.7628, longitude: -95.3831, radius: 7.13, fillKey: 'Houston'},
		   {name: 'Indianapolis Colts', latitude: 39.7910, longitude: -86.1480, radius: 35.88, fillKey: 'Indianapolis'},
		   {name: 'Jacksonville Jaguars', latitude: 30.3369, longitude: -81.6614, radius: 16, fillKey: 'Jacksonville'},
		   {name: 'Kansas City Chiefs', latitude: 39.0997, longitude: -94.5786, radius: 17.5, fillKey: 'Kansascity'},
		   {name: 'Miami Dolphins', latitude: 25.7877, longitude: -80.2241, radius: 10.88, fillKey: 'Miami'},
		   {name: 'Minnesota Vikings', latitude: 44.9833, longitude: -93.2667, radius: 20.63, fillKey: 'Minnesota'},
		   {name: 'New England Patriots', latitude: 42.0653, longitude: -71.2483, radius: 40, fillKey: 'Newengland'},
		   {name: 'New Orleans Saints', latitude: 29.9667, longitude: -90.0500, radius: 7.13, fillKey: 'Neworleans'},
		   {name: 'NY Giants', latitude: 40.8171, longitude: -74.0850, radius: 6.75, fillKey: 'Giants'},
		   {name: 'NY Jets', latitude: 40.8171, longitude: -74.0850, radius: 38.25, fillKey: 'Jets'},
		   {name: 'Oakland Raiders', latitude: 38.044, longitude: -122.2708, radius: 6.75, fillKey: 'Oakland'},
		   {name: 'Philadelphia Eagles', latitude: 39.9500, longitude: -75.1667, radius: 35, fillKey: 'Philadelphia'},
		   {name: 'Pittsburgh Steelers', latitude: 40.4417, longitude: -80.0000, radius: 52, fillKey: 'Pittsburgh'},
		   {name: 'San Diego Chargers', latitude: 32.7150, longitude: -117.1625, radius: 27.13, fillKey: 'Sandiego'},
		   {name: 'San Francisco 49ers', latitude: 37.5083, longitude: -122.2803, radius: 3.13, fillKey: 'Sanfrancisco'},
		   {name: 'Seattle Seahawks', latitude: 47.6097, longitude: -122.3331, radius: 19.38, fillKey: 'Seattle'},
		   {name: 'St. Louis Rams', latitude: 38.6272, longitude: -90.1978, radius: 36, fillKey: 'StLouis'},
		   {name: 'Tampa Bay Buccaneers', latitude: 27.9710, longitude: -82.4650, radius: 20.5, fillKey: 'Tampabay'},
		   {name: 'Tennessee Titans', latitude: 36.1667, longitude: -86.7833, radius: 7.5, fillKey: 'Tennessee'},
		   {name: 'Washington Redskins', latitude: 38.9339, longitude: -76.8967, radius: 12.75, fillKey: 'Washington'}
    ],
    {popupTemplate: function(geography, data) {
	    return '<div class="hoverinfo"><strong>' + data.name + "<br>" + "Composite: " + data.radius + '</strong></div>';
	   }
	});

	// Jquery Slider

	$(function() {
    $("#slider").slider({
    	orientation: "vertical",
     	value: 2004,
      	min: 2004,
      	max: 2013,
      	step: 1,
      	slide: function(event, ui) {
	        $('#year').empty().append(ui.value)
	        execute.requestComposite();
      		}
    	});
 	});

	var circles = d3.selectAll('circle')[0];
	execute.hoverEffect(circles)


	$.ajax({
		url: '/',
		method: 'GET',
		contentType: 'json'
	}).done(function(response) {
		debugger
	})

};

var execute = {

	hoverEffect: function(circles) {
		for (var i = 0; i < circles.length; i++) { 
			circles[i].onmouseover = function() { 
				var data = this.dataset.info.split("\"")[13]
				var teamName = data.toLowerCase() + 2
				this.style.fill = secondaryColors[teamName]
				this.style.stroke = '#FFF'
			}; 
		};
	},

	requestComposite: function() {
		$.ajax({
			url: '/',
			method: 'GET',
			data: {year: $('#year').text()},
			contentType: 'json'
		}).done(function(response) {
			execute.seasonExecute(response[0]);
		});
	},

	seasonExecute: function(response) {
		var circles = d3.selectAll('circle')[0];
		$.each(circles, function(index, value) {
			$(value).attr({r: response[index]});
			value.setAttribute("data-info", execute.generateString(value, response[index]))
		})
	},

	generateString: function(value, response) {
		var string = value.getAttribute("data-info")
		var replacementString = string.replace(/"radius"(.*),/, "\"radius\"" + ":" + response + ",")
		return replacementString
	}	
}

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
