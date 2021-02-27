part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> handleBook(Space space) async {
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Konfirmasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Apakah kamu ingin menghubungi pemilik kos?'),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  child: Text(
                    'Nanti',
                    style: greyTextStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Hubungi'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    launchUrl('tel:+${space.phone}');
                  },
                )
              ],
            );
          });
    }

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Image.network(
            widget.space.imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Color(0xFFFFFFFF),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.space.name,
                                style: blackTextStyle.copyWith(fontSize: 20),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '\$${widget.space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Row(
                            children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 2,
                                ),
                                child: RatingStar(
                                  index: index,
                                  rating: widget.space.rating,
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon_kitchen.png',
                                height: 32,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '${widget.space.numberOfKitchens}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: ' Kitchen',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon_bedroom.png',
                                height: 32,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '${widget.space.numberOfBedrooms}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: ' Bedroom',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/icon_cupboard.png',
                                height: 32,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text.rich(
                                TextSpan(
                                    text: '${widget.space.numberOfCupboards}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                    children: [
                                      TextSpan(
                                        text: ' Big lemari',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text('Photos',
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(item,
                                    width: 110, height: 88, fit: BoxFit.cover),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text('Location',
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.space.address}\n${widget.space.city}',
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                          InkWell(
                              onTap: () {
                                launchUrl(widget.space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: edge),
                      height: 50,
                      width: MediaQuery.of(context).size.width - (2 * edge),
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          handleBook(widget.space);
                        },
                        child: Text(
                          'Book Now',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: edge),
            height: 50,
            width: MediaQuery.of(context).size.width - (2 * edge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/btn_back.png',
                    height: 40,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isClicked = !isClicked;
                    });
                  },
                  child: Image.asset(
                    isClicked
                        ? 'assets/btn_wishlist_active.png'
                        : 'assets/btn_wishlist.png',
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
