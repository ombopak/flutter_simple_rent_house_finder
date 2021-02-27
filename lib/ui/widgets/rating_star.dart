part of 'widgets.dart';

class RatingStar extends StatelessWidget {
  final int index;
  final int rating;

  RatingStar({this.index, this.rating});  

  @override
  Widget build(BuildContext context) {
    return Image.asset( index <= rating ?
      'assets/icon_star.png' : 'assets/icon_star_grey.png', width: 20,      
    );
  }
}