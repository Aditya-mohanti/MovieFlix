import 'package:flutter/material.dart';
import 'emailpass.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xff000000),
        leading: const Icon(Icons.home_filled,color: Color(0xffE50914),
        ),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
            {
              return NetflixLoginPage();
            }));
          },
              child: Text(
                "SIGN IN",style: TextStyle(
                color: Color(0xffE50914),
                fontSize: 20.0,
              ),
              )),
          TextButton(onPressed: (){}, child: Text(
            "PRIVACY",style: TextStyle(
            color: Color(0xffE50914),
            fontSize: 20.0,
          ),
          )),
        ],
      ),
      backgroundColor: Color(0xff000000),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Card(
            child: Image.asset('Assets/images/crime.png'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 170.0,),
              TextButton(
                onPressed:(){

                },
                child:  const Text('GET STARTED',
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffE50914),
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
