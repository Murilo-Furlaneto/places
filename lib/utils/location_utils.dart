const GOOGLE_API_KEY = 'AIzaSyCSJoeXd48wyT0pFcCzmMct__1ZTe12Wk0';

class LocationUtils {
  static String generatedLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
