// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// SHOW POP-OVER
function showPopOver(divID) {
	// LOAD THE VIEW SIZE + SCROLL POSITION
	loadScreen();

	// SHOW THE DIV
	document.getElementById(divID).style.display = "block";

	// SET THE DIV POSITION
	document.getElementById(divID).style.left = ((myWidth / 2)-(document.getElementById(divID).offsetWidth / 2))+"px";
	document.getElementById(divID).style.top = ((myHeight / 2)-(document.getElementById(divID).offsetHeight / 2)+myScroll)+"px";
}

function closePopOver(divID) {
	document.getElementById(divID).style.display = "none";
}
// LOAD SCREEN ATTRIBUTES
var myWidth = 0, myHeight = 0, myScroll = 0; myScrollWidth = 0; myScrollHeight = 0;


function loadScreen() {
	if (document.all) {
		// IE
		myWidth  = (document.documentElement.clientWidth) ? document.documentElement.clientWidth : document.body.clientWidth;
		myHeight = (document.documentElement.clientHeight) ? document.documentElement.clientHeight : document.body.clientHeight;
		myScroll = (document.documentElement.scrollTop) ? document.documentElement.scrollTop : document.body.scrollTop;
	} else {
		// NON-IE
		myWidth = window.innerWidth;
		myHeight = window.innerHeight;
		myScroll = window.pageYOffset;
	}

	if (window.innerHeight && window.scrollMaxY) { 
		// NON-IE
		myScrollWidth = document.body.scrollWidth;
		myScrollHeight = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight) {
		// IE
		myScrollWidth = document.body.scrollWidth;
		myScrollHeight = document.body.scrollHeight;
	 } else {
		// IE MAC
		myScrollWidth = document.body.offsetWidth;
		myScrollHeight = document.body.offsetHeight;
	}
}