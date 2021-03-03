import 'package:candidateharikrishna/Utils/StyleConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String imageUrl='https://m.economictimes.com/thumb/msid-64230310,width-1200,height-900,resizemode-4,imgsize-61517/stock-market-getty-images.jpg';
  List<String> stockTitle=['Stock market for beginners','Mutual funds foreigners','financial frauds','stock market terminology'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView.builder(
            itemCount: stockTitle.length,
            itemBuilder: (context,index){
          return Container(
            height: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppTheme.primary.withOpacity(0.3),width: 1)
            ),
            margin: EdgeInsets.all(10),
            child: Center(
              child: ListTile(
                leading:Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(imageUrl,fit: BoxFit.cover,),
                ),
                contentPadding: EdgeInsets.all(0),
                title: Text(stockTitle[index],style: AppTheme.common.copyWith(color: AppTheme.primary
                ,fontWeight: FontWeight.bold),),
                subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry'),
              ),
            ),
          );
        }),
      ),
    );
  }
}
