var myFullpage = new fullpage('#fullpage', {
  anchors: ['firstPage', 'secondPage', '3rdPage'],
  navigation: true,
  navigationPosition: 'right',
  navigationTooltips: ['First page', 'Second page', 'Third and last page'],
  scrollOverflow: true,
  afterResponsive: function (isResponsive) {

  }

});

new fullpage('#fullpage', {
	anchors: ['firstPage', 'secondPage', 'thirdPage', 'fourthPage', 'lastPage'],
	menu: '#myMenu'
});

$("#section0 .HomeSection h3").fitText(3, { minFontSize: '20px', maxFontSize: '30px' });