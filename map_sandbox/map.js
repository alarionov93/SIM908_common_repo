var gpsLogFilePath = "/data_conversion/data1450131659.22.json";

(function(){
	ymaps.ready(init);
    var myMap;
    var shown;

    function init() {
    	myMap = new ymaps.Map("map", {
    		center: [58.010259, 56.234195],
    		zoom: 12
    	}, {
    		autoFitToViewport: 'always'
    	});
      
      // setInterval(function(){
        $.get('/'+gpsLogFile, function(data) {
          if (shown != null) {
            shown.removeFromMap(myMap);
          }
          var pts = drawPts(data["data"]);
          shown = ymaps.geoQuery(pts).addToMap(myMap).applyBoundsToMap(myMap, {checkZoomRange: true});
        });
      // }, 5000);
    }
})();


function drawPts(a) {
  var myPolyline = new ymaps.Polyline(
    // Указываем координаты вершин ломаной.
    a,
  {
    // не убирать этот блок
    // Описываем свойства геообъекта.
  }, {
    // Задаем опции геообъекта.
    // Отключаем кнопку закрытия балуна.
    balloonCloseButton: true,
    // Цвет линии.
    // strokeColor: color,
    // Ширина линии.
    strokeWidth: 6,
    // Коэффициент прозрачности.
    strokeOpacity: 1
  });

  return myPolyline;
}