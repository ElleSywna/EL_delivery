import 'package:flutter/material.dart';
import 'package:elenna_delivery/food_entity.dart';

class DetailPage extends StatelessWidget {
  final FoodEntity foodEntity;

  DetailPage({required this.foodEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          foodEntity.nama,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(foodEntity.imageAsset),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            foodEntity.nama,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          IconButton(
                              icon: Icon(Icons.message), onPressed: () {}),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            foodEntity.rating,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 24.0),
                      child: Text('Deskripsi'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(foodEntity.deskripsi),
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 1,
            child: ClipRRect(
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: Container(
                color: Colors.black54,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Harga : Rp. ' + foodEntity.harga,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      BookingStatus()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookingStatus extends StatefulWidget {
  @override
  _BookingStatusState createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  bool isBooking = false;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 100,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: isBooking ? Colors.grey : Colors.green,
        child: isBooking
            ? Text('Berhasil dipesan ✓', style: TextStyle(color: Colors.white))
            : Text('Pesan', style: TextStyle(color: Colors.white)),
        onPressed: () {
          setState(() {
            isBooking = !isBooking;
          });
        },
      ),
    );
  }
}
