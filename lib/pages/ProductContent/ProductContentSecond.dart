import 'package:flutter/material.dart';
import 'package:model_viewer/model_viewer.dart';


//AR展示商品
class ProductContentSecond extends StatefulWidget {

  final List _productContentList;
  ProductContentSecond(this._productContentList,{Key key}) : super(key: key);

  _ProductContentSecondState createState() => _ProductContentSecondState();
}

class _ProductContentSecondState extends State<ProductContentSecond> with AutomaticKeepAliveClientMixin{

  var _id;
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();   
    this._id=widget._productContentList[0].sId;
  }

  @override
  Widget build(BuildContext context) {
    if (this._id == "59f6a2d27ac40b223cfdcf81") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/cactus.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a042682010e71123466143b") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/chair.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );

    } else if (this._id == "5a042702010e71123466143c") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/frame.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a042aa3010e71123466143d") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/mixer.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a042d30010e711234661441") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/plant.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a042eff010e711234661445") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/sheen-chair.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a07eeeaad8b300e28e2feb5") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/table.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else if (this._id == "5a07ef41ad8b300e28e2feb7") {
      return Container(
        child: ModelViewer(
          backgroundColor: Colors.teal[50],
          src: 'images/models/table-football.glb',
          alt: "A 3D model of an table soccer",
          autoPlay: true,
          autoRotate: true,
          cameraControls: true,
        ),
      );
    } else {
      return Container(
        child: Text("GOt Wrong ID"),
      );
    }
  }
}