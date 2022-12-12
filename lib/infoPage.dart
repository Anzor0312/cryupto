import 'package:crypto/servise/currensy_model.dart';
import 'package:crypto/servise/get_servise.dart';
import 'package:crypto/servise/searchservise.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key, List<CurrensyModel>? data});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("EHT/USDH"),
          actions: const [Icon(Icons.view_kanban_outlined)],
        ),
        body: FutureBuilder(
          future: GetCurrencyService.getCurrency(),
          builder: (context, AsyncSnapshot<List<CurrensyModel>?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else{
              return GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                return
              
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 40),
                   child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                         Row(
                          children: [
                            Container(
                height: 60,
                width: 6,
                color: Colors.green,
                            ),
                            Column(
                children: [
                             Text(snapshot.data![index].cbPrice.toString(),style: TextStyle(color: Colors.white,fontSize: 30),),
                           Text(snapshot.data![index].code.toString(),style: TextStyle(color: Colors.green),)
                ],
                            )
                            ]),
                         const   SizedBox(width: 15,height: 15,),
                             Container(
                               width: 315,
                               height: 263.37,
                               decoration: BoxDecoration(
                                image: DecorationImage(image: NetworkImage("https://source.unsplash.com/random/$index"),
                                fit: BoxFit.fill
                              
                                )
                               ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                child: Row(children: [
                                  Container(
                                    width: 135,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),color: Colors.greenAccent,
                                    ),
                                    
                                    child: const Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                                      child: Text("Buy",style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                   Container(
                                    width: 135,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10) ,color: Colors.redAccent,
                                    ),
                                   
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                                      child: Text("Sell",style: TextStyle(fontSize: 20),),
                                    ),
                                  ),
                                  
                                
                                ],),
                              ),const SizedBox(height: 15,),
                            Row(
                              
                              children:const [
                               Text("Quick watch",style: TextStyle(color: Colors.white),),
                               SizedBox(width: 190,),
                               Text("See all",style: TextStyle(color: Colors.white),)
                            ],),
                            Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          
                            child: Padding(
                              padding: const EdgeInsets.only(right: 200),
                              child: Container(
                                width: 250,
                                height: 65,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(23, 87, 87, 86),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     
                                  children: [
                                    Container(width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.yellowAccent,
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://cdn.onlinewebfonts.com/svg/download_202966.png"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].title.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      snapshot.data![index].cbPrice.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          
                        );
                      },
                    ),)
                            ]),
                 );
                          }
              );
            }
          },
        ));
  }
}
