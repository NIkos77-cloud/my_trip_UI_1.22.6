import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_trip/common/global.dart';
import 'package:happy_trip/common/screenutil.dart';


class SearchHistoryPage extends StatefulWidget {
  @override
  _SearchHistoryPageState createState() => _SearchHistoryPageState();
}

class _SearchHistoryPageState extends State<SearchHistoryPage> {
  Size _size;
  Set<Marker> _markers = {};
  GoogleMapController mapController;
  bool isMapCreated = false;
  @override
  Widget build(BuildContext context) {
    changemapmode();
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: ListTile(
            contentPadding: EdgeInsets.only(
              top: ScreenUtil.getResponsiveHeightOfWidget(0, _size.width),
              left: ScreenUtil.getResponsiveWidthOfWidget(10, _size.width),
            ),
            leading: Padding(
              padding: EdgeInsets.only(left: ScreenUtil.getResponsiveWidthOfWidget(8, _size.width), top: 5),
         
            ),
            trailing: Container(
              padding: EdgeInsets.only(right: ScreenUtil.getResponsiveWidthOfWidget(20, _size.width)),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, NoAnimationMaterialPageRoute(builder: (context) => HotellistingPage()));
                  },
                  child: Image.asset("assets/images/nav_bar_list.png")),
            ),
          ),
        ),
        title: Text(
          'Search History',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff42436A)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0.0,
      ),
      body: body(),
    );
  }

body()
{
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff620BDC),width: 2.0),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                        child: Image.asset('assets/images/plussign.png',height: 16,width: 16,),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 70.0,
                      width: MediaQuery.of(context).size.width -130,
                      // color: Colors.grey,
                      child: ListView.builder(
                        itemCount: dummyUrls.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(BuildContext context,int index){
                          return  Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: CircleAvatar(
     radius: 35.0,
     
     backgroundImage: NetworkImage(dummyUrls[index]),
     backgroundColor: Colors.grey[200],
     )
                            
        //                     Container(
        //                 height: 61,
        //                 width: 61,
        //                 decoration: BoxDecoration(
        //                     border: Border.all(color: Color(0xff620BDC),width: 2.0),
        //                     shape: BoxShape.circle,
        //                 //     image: new DecorationImage(
        //                 //       fit: BoxFit.fill,
        //                 //     image: new NetworkImage(
        //                 //         "${dummyUrls[index]}",)
        //                 // ),
                    
        //                 ),

                        
        //                 child:ClipRRect(
        //                                               borderRadius: new BorderRadius.all(Radius.circular(61)),
        //                                               child: CachedNetworkImage(imageUrl: '${dummyUrls[index]}',fit: BoxFit.cover,
        //                                                         placeholder: (context, url) => Padding(
        //                                                           padding: const EdgeInsets.all(10.0),
        //                                                           child: SizedBox(
        //                                                             height: 25,
        //                                                             width: 25,
        //                                                             child: CircularProgressIndicator(valueColor:
        //                                                               new AlwaysStoppedAnimation<Color>(Colors.white),)),
        //                                                         ),
        //                                                           errorWidget: (context, url, error) => Icon(Icons.error),
  
                                                              
        //                                                             ),
        // )
                        
               
                        
        //                 // child: ClipRRect(
        //                 //   borderRadius: BorderRadius.circular(61.0),
        //                 //   child: Image.network('${dummyUrls[index]}',fit: BoxFit.cover,))
                        
        //                 // ClipRRect(
        //                 //                           child: Container(
        //                 //         child: CachedNetworkImage(
                                    
        //                 //             imageUrl: '${dummyUrls[index]}',
        //                 //             fit: BoxFit.cover,
        //                 //             placeholder: (context, url) => Shimmer.fromColors(
        //                 //                 baseColor: Colors.grey[200],
        //                 //                 highlightColor: Colors.grey[300],
        //                 //                 child: Container(
        //                 //                   height: 61,
        //                 //                   width: 61,
        //                 //                   decoration: BoxDecoration(
        //                 //                       border: Border.all(color: Color(0xff620BDC),width: 2.0),
        //                 //                       shape: BoxShape.circle,
        //                 //                       // borderRadius: BorderRadius.circular(61)
        //                 //                   ),
        //                 //                 )),
        //                 //             height: 61,
        //                 //             width: 61.0,
        //                 //             errorWidget: (context, url, error) => Icon(Icons.error),
        //                 //           ),
                                
                   
        //                 //   ),
        //                 // ),
        //               ),


                          );
                        } 
                      ),
                    ),
                  )


                ],
              ) ,
            ),
          ),
        ),

        map(),
      ],
    );
}

changemapmode()
{
  getjsonpath('assets/light.json').then(setmapStyle);
}
Future<String> getjsonpath(String path)async
{
   return await rootBundle.loadString(path);
}

void setmapStyle(String mapstyle)
{
  mapController.setMapStyle(mapstyle);
}
map()
{
  return Column(
    children: <Widget>[
      SizedBox(
            height:(MediaQuery.of(context).size.height >= 812.0 ||
                                MediaQuery.of(context).size.height == 812.0 ||
                                (MediaQuery.of(context).size.height >= 812.0 &&
                                    MediaQuery.of(context).size.height <=
                                        896.0)) &&
                            Platform.isIOS ? MediaQuery.of(context).size.height -295:
            
            
            
             MediaQuery.of(context).size.height -260,
      width: MediaQuery.of(context).size.width,
            child: GoogleMap( 
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                new Factory<OneSequenceGestureRecognizer>(
                  () => new EagerGestureRecognizer(),
                ),
              ].toSet(),
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: true,
              mapType: MapType.normal,
              
              onMapCreated: (GoogleMapController controller) async {
                mapController = controller;
                changemapmode();
                setState(() {});
// mapController.moveCamera(cameraUpdate)
//-----------marker1

                
                  var markerIdVal = generateIds();
                  final MarkerId markerId = MarkerId(markerIdVal.toString());
                  final Marker marker = Marker(
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                    markerId: markerId,
                    onTap: () {},
                    position: LatLng(21.1702,72.8311),
                    infoWindow:
                        InfoWindow(title: 'Surat', snippet: 'Adajan area'),
                    visible: true,
                  );
                  _markers.add(marker);

//--------------------
                setState(() {
                  mapController.moveCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(21.1702,72.8311),
                        zoom: 8.0),
                  ));
                });
              },
              mapToolbarEnabled: true,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(21.1702,72.8311),
                zoom: 10.0,
              ),
            ),
          )
    ],
  );
}
  int generateIds() {
    var rng = new Random();
    var randomInt;
    randomInt = rng.nextInt(100);
    return randomInt;
  }
}