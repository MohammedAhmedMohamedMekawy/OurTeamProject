import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teampoject/componence/componence.dart';
import 'package:teampoject/modules/Login/Login_Screen.dart';
var boarederController = PageController();
class BoardingModel{
  final String image;
  final String body;
  final String title;
  BoardingModel({
    required this.image,
    required this.title,
    required this.body
  });
}
class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/baby.jpg',
        title: 'OnBoarding 1 title',
        body: 'OnBoarding 1 body'),
    BoardingModel(
        image: 'assets/images/baby.jpg',
        title: 'OnBoarding 2 title',
        body: 'OnBoarding 2 body'),
    BoardingModel(
        image: 'assets/images/baby.jpg',
        title: 'OnBoarding 3 title',
        body: 'OnBoarding 3 body'),
  ];
  void submit(){
    navigateAndFinish(context, LoginScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: (){
                submit();
              },
              child: Text('SKIP',style: TextStyle(color: Colors.white)),)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (int index){
                      if(index == boarding.length - 1){
                        setState(() {
                          isLast = true;
                        });
                      }else{
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boarederController,
                    itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,)),
              SizedBox(height: 20,),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller:boarederController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotWidth: 10,
                        dotHeight: 10,
                        expansionFactor: 5,
                        activeDotColor: Colors.blue,
                        spacing: 5
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: (){
                      setState((){
                        if(isLast){
                          submit();
                        }
                        boarederController.nextPage(
                            duration: (
                                Duration(milliseconds: 750
                                )
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }  );

                    },
                    child: Icon(Icons.arrow_forward_ios),)
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage(
                '${model.image}'
            )),),
      SizedBox(height: 20,),
      Text('${model.title}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Text('${model.body}')
    ],
  );
}
