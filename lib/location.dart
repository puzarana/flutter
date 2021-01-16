import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
 import 'driver_select.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.orange[700],
      ),
      
     routes: <String, WidgetBuilder>{
        '/driver_select': (BuildContext context) => new MySelectionPage(),
        
      },

      home: MyLocationPage(),
      
    );
  }
}

class MyLocationPage extends StatefulWidget {


MyLocationPage() : super();
  final String title = "City";

  @override
  _MyLocationPageState createState() => _MyLocationPageState();
}

class _MyLocationPageState extends State<MyLocationPage> {
StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
   Marker marker;
   Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(27.7172,85.3240),
    zoom: 14.4746,
  );
 
 Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/person.png");
    return byteData.buffer.asUint8List();
  }
 void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData),
          );
          circle = Circle(
          circleId: CircleId("person"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(10));
    });
  }

void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

 @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }


  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height  * 0.5,
            margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
            children: <Widget>[
         TextField(
                    decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_location, color: Colors.orange[700],),
                              labelText: "Pickup location",
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[700]),
                ),
                 ),
                ),
         SizedBox(height:10.0),
         TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add_location_alt, color: Colors.orange[700],),
                              labelText: "Destination",
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[700]),
                              ),
                              ),
                            ),
         SizedBox(height:10.0),           
         TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.opacity, color: Colors.orange[700],),
                              labelText: "Offer your fare",
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[700]),
                              ),
                              ),
                        ),
          SizedBox(height:10.0),
          TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.comment, color: Colors.orange[700],),
                              hintText: "comment and wishes",
                              focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange[700]),
                              ),
                              ),
                        ),
          SizedBox(height:20.0),
          Container(
            // ignore: missing_required_param
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
                shadowColor:  Colors.orangeAccent,
                color: Colors.orange[700],
                 child: FlatButton(
                    padding: const EdgeInsets.only(top: 5, bottom:5, left:50, right:50),
                    onPressed: () { 
                      Navigator.of(context).pushNamed('/driver_select');
                     },
                    child: Text("Request",
                    style: TextStyle(
                    color: Colors.white,
                    ),
                    ),
                ),
            ),
          ),
         ],
            ),
           );
           });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
          ),
           child: ListTile(
             leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/deer.jpg"),
                      radius: 25.0,
                     ),
              title: Text("Hari", style: TextStyle(fontSize:25)),
              subtitle: Text('From Butwal', style:TextStyle(color: Colors.blue[600],fontSize:10)),
           ),
        ),
        ListTile(
          leading: Icon(Icons.location_city),
          title: Text('City'),
           onTap: () {
       // change app state...
        Navigator.pop(context); // close the drawer
       },
        ),
        ListTile(
          leading: Icon(Icons.public_rounded),
          title: Text('Intercity'),
           onTap: () {
       // change app state...
        Navigator.pop(context); // close the drawer
       },
       ),
        ListTile(
          leading: Icon(Icons.settings),
          title:Text('Setting'),
           onTap: () {
       // change app state...
        Navigator.pop(context); // close the drawer
       },
        ),
        
       ListTile(
       leading: Icon(Icons.privacy_tip_outlined),
       title: Text('Help'),
       onTap: () {
       // change app state...
        Navigator.pop(context); // close the drawer
       },
       ),

        ListTile(
       leading: Icon(Icons.change_history),
       title: Text('History'),
       onTap: () {
       // change app state...
        Navigator.pop(context); // close the drawer
       },
       )

          ],
        ),
        // child: RaisedButton(
        //    onPressed: (){
        //    Scaffold.of(context).openDrawer();
        // }),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orange[700],
           actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            ),
         
           IconButton(
             icon: Icon(
             Icons.arrow_drop_down_circle_outlined,
             color: Colors.white,
           ), 
           onPressed:() =>  displayBottomSheet(context),
           ),

            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                //do something
              },
            )
          ],
      ),
       body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] :[]),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
 ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),   
          );
  }
}


