part of 'models.dart';

class Space {
  int id;
  String name;
  int price;
  String city;
  String country;
  String imageUrl;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;

  Space(
      {this.id,
      this.name,
      this.price,
      this.city,
      this.imageUrl,
      this.country,
      this.rating,
      this.address,
      this.mapUrl,
      this.numberOfBedrooms,
      this.numberOfCupboards,
      this.numberOfKitchens,
      this.phone,
      this.photos});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}
