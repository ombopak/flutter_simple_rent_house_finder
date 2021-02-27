part of 'widgets.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(space),),);
      },
      child: Container(
        width: 329,
        height: 110,
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  width: 130,
                  height: 110,
                  child: Stack(
                    children: [
                      Image.network(
                        space.imageUrl,
                        width: 130,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30)),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Image.asset(
                                'assets/icon_star.png',
                                width: 18,
                              ),
                              SizedBox(width: 2,),
                              Text('${space.rating}/5', style: whiteTextStyle.copyWith(fontSize: 13),),
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  space.name,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: 2,
                ),
                Text.rich(
                  TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextStyle.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                          text: ' / month',
                          style: greyTextStyle.copyWith(fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
            
          ],
        ),
        
      ),
    );
  }
}
