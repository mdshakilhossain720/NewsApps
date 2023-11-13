import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/NewsModelChannel.dart';
import '../viewmodel/new_view_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
enum FilterList {bbcNewws,aryNews,indepentNews,returs,cnn,aljazara}

class _HomePageState extends State<HomePage> {
  FilterList? selectvalue;
  String name='bbc-news';

  ViewModel viewModel=ViewModel();
  @override
  Widget build(BuildContext context) {
    final heigh=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon:Image.asset('assets/images/category_icon.png',height: 30,width: 30,)),
        title: Text('News',style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
      backgroundColor: Colors.white,
        actions: [
        PopupMenuButton<FilterList>(
          icon: Icon(Icons.more_vert,color: Colors.black87,),
            initialValue: selectvalue,
            onSelected: (FilterList items){
            if(FilterList.bbcNewws.name==items.name){
              name=='bbc-news';
            }
            if(FilterList.aryNews.name==items.name){
              name=='ary-News';
            }
            if(FilterList.indepentNews.name==items.name){
              name=='indepentNews';
            }
            if(FilterList.returs.name==items.name){
              name=='returs';
            }
            setState(() {
              selectvalue=items;
            });
            },

            itemBuilder: (BuildContext context)=> <PopupMenuEntry<FilterList>>
        [

          PopupMenuItem<FilterList>(

               value: FilterList.bbcNewws,
              child: Text('BBC NEWS')),
              PopupMenuItem<FilterList>(

                  value: FilterList.bbcNewws,
                  child: Text('Ary NEws')),
              PopupMenuItem<FilterList>(

                  value: FilterList.bbcNewws,
                  child: Text('indepentNews')),
              PopupMenuItem<FilterList>(

                  value: FilterList.bbcNewws,
                  child: Text('aljazara')),
        ]
        )
        ],
      ),

      body: ListView(
        children: [
        Container(
          height: heigh*.55,
          width: width,
          color: Colors.green,
          child: FutureBuilder<NewsModelChannel>(
            future:viewModel.NewsChannelHeadApi(),
            builder: (BuildContext context,snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(
                  child: SpinKitCircle(
                    size: 50,
                    color: Colors.blue,
                  ),
                );
              }else{
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context,index){
                  return SizedBox(
                   
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: heigh*.55,
                          width: width*0.9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                            fit: BoxFit.cover,
                            ),
                          ),

                        ),

                        Positioned(
                          bottom: 20,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: heigh*.22,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:250,
                                    child: Text(snapshot.data!.articles![index].title.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                      GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  );
                });

              }
            },
          ),
        )


        ],
      ),

    );
  }
}
