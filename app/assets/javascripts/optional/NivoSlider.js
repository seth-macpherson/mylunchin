
	/*
	 * ---------------------------------------------------------------- 
	 *  NivoSlider
	 * ----------------------------------------------------------------  
	 */

	$(window).load(function () {

		$('#slider').nivoSlider({
			pauseTime: 4000,
			// How long each slide will show
			effect: 'fade',
			// Specify sets like: 'fold,fade,sliceDown'
			animSpeed: 700,
			// Slide transition speed	
			directionNav: false // Direction nav (prev/next arrow)
		});

	});
