import 'package:flutter/material.dart';
import 'food_entity.dart';
import 'package:elenna_delivery/detail.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.view_headline,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          'El Resto',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Pacifico',
            fontSize: 24,
            //     fontWeight: FontWeight.bold
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Filter')
                    ],
                  ),
                  Text('List menu pilihan terbaik'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              children: foodEntity.map((food) {
                return FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(foodEntity: food);
                    }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          child: Image.asset(
                            food.imageAsset,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    food.nama,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\Rp ' + food.harga,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    food.rating,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          color: Colors.greenAccent,
                                          child: Text(
                                            'Gratis Antar',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                  Bookmark()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isBookmark ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}

var foodEntity = [
  FoodEntity(
      imageAsset: 'assets/images/burger.jpg',
      nama: 'Hamburger',
      harga: '250.000',
      rating: '4.9',
      deskripsi:
      ' '),

  FoodEntity(
      imageAsset: 'assets/images/lemon.jpg',
      nama: 'Es Lemonie',
      harga: '150.000',
      rating: '4.4',
      deskripsi:
      ' '),

  FoodEntity(
      imageAsset: 'assets/images/esteh.jpg',
      nama: 'Ice Tea',
      harga: '100.000',
      rating: '4.9',
      deskripsi:
      ' '),

  FoodEntity(
      imageAsset: 'assets/images/pasta.jpg',
      nama: 'Pasta',
      harga: '300.000',
      rating: '4.4',
      deskripsi:
      ' '),

  FoodEntity(
      imageAsset: 'assets/images/pizza.jpg',
      nama: 'Pizza',
      harga: '350.000',
      rating: '4.4',
      deskripsi:
      ' '),
];
