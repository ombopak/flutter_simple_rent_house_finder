part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/error.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 14),
              Text(
                'Seems like the page that you\nwere requested is already gone',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.circular(17)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    },
                    child: Text('Back To Home',
                        style: whiteTextStyle.copyWith(fontSize: 18)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
