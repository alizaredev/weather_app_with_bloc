class WeatherDTO {
  final String name;
  final String icon;
  final double speed;
  final double tempe;
  final String main;
  final int humidity;

  const WeatherDTO({
    required this.name,
    required this.icon,
    required this.speed,
    required this.tempe,
    required this.main,
    required this.humidity,
  });

  factory WeatherDTO.fromMapJson(Map<String, dynamic> jsonMapObject) {
    try {
      return WeatherDTO(
        name: jsonMapObject['name'] as String,
        icon: jsonMapObject['weather'][0]['icon'] as String,
        speed: (jsonMapObject['wind']['speed'] as num).toDouble(),
        tempe: ((jsonMapObject['main']['temp'] as num) - 273.15).toDouble(),
        humidity: (jsonMapObject['main']['humidity'] as num).toInt(),
        main: jsonMapObject['weather'][0]['main'] as String,
      );
    } catch (e) {
      throw Exception('Error processing received data: ${e.toString()}');
    }
  }
}
