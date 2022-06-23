import 'package:basic_flutter/model/movie.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "I Am Legend",
    "300",
    "Avatar",
    "Game Of Thrones",
    "Viking",
    "Interstellar"
  ];
  // const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10.0, child: movieImage(movieList[index].images[0])),
            ]);
            // return Card(
            //   elevation: 4.5,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: NetworkImage(movieList[index].images[0]),
            //               fit: BoxFit.cover),
            //           borderRadius: BorderRadius.circular(13.9),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text("...."),
            //     title: Text(movieList[index].title),
            //     subtitle: Text("${movieList[index].title}"),
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(
            //                     movieName: movieList.elementAt(index).title,
            //                     movie: movieList[index],
            //                   )));
            //     },
            //   ),
            // );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 35.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(child: 
                      Text(
                        movie.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white),
                      ),
                      ),
                      Text(
                        "Rating: ${movie.imdbRating} / 10",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(child: 
                      Text("Released: ${movie.relesed}",style: mainTextStyle(),),),
                      Text(
                        movie.runtime,
                        style: mainTextStyle()
                     
                        
                      ),
                      
                      Text(
                        movie.rated,
                        style: mainTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieListViewDetails(movieName: movie.title, movie: movie)))
      },
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      color: Colors.grey
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                imageUrl ??
                    'https://images-na.ssl-images-amazon.com/images/M/MV5BMTI0NTI4NjE3NV5BMl5BanBnXkFtZTYwMDA0Nzc4._V1_.jpg',
              ),
              fit: BoxFit.cover)),
    );
  }
}

// new route (screen or page)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails(
      {super.key, required this.movieName, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back ${this.movie.director}"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

// class BillSplitter extends StatefulWidget {
//   const BillSplitter({Key? key}) : super(key: key);

//   @override
//   State<BillSplitter> createState() => _BillSplitterState();
// }

// class _BillSplitterState extends State<BillSplitter> {
//   int _tipPercentage = 0;
//   int _personCounter = 1;
//   double _billAmount = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           padding: EdgeInsets.all(20.5),
//           children: <Widget>[
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 color: Colors.purpleAccent.shade100,
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Total Per Person",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           fontSize: 15.0),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Text(
//                         "\$ 123",
//                         style: TextStyle(
//                             fontWeight: FontWeight.normal,
//                             fontSize: 34.9,
//                             color: Colors.white),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20.0),
//               padding: EdgeInsets.all(12.0),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 border: Border.all(
//                   color: Colors.blueGrey.shade100,
//                   style: BorderStyle.solid,
//                 ),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     keyboardType:
//                         TextInputType.numberWithOptions(decimal: true),
//                     style: TextStyle(color: Colors.grey),
//                     decoration: InputDecoration(
//                       prefixText: "Bill Amount",
//                       prefixIcon: Icon(Icons.money_off),
//                     ),
//                     onChanged: (String value) {
//                       try {
//                         _billAmount = double.parse(value);
//                       } catch (exception) {
//                         _billAmount = 0.0;
//                       }
//                     },
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "Split",
//                         style: TextStyle(
//                           color: Colors.grey.shade700,
//                         ),
//                       ),
//                       Row(
//                         children: <Widget>[
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 if (_personCounter > 1) {
//                                   _personCounter--;
//                                 } else {
//                                   // do nothing
//                                 }
//                               });
//                             },
//                             child: Container(
//                               width: 40.0,
//                               height: 40.0,
//                               margin: EdgeInsets.all(10.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(7.0),
//                                 color: Colors.grey,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "-",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 17.0),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "$_personCounter",
//                             style: TextStyle(
//                                 color: Colors.purpleAccent,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12.0),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               setState(() {
//                                 _personCounter++;
//                               });
//                             },
//                             child: Container(
//                               width: 40.0,
//                               height: 40.0,
//                               margin: EdgeInsets.all(10.0),
//                               decoration: BoxDecoration(
//                                 color: Colors.grey,
//                                 borderRadius: BorderRadius.circular(7.0),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "+",
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 17.0,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   //tip
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         "Tip",
//                         style: TextStyle(color: Colors.grey.shade700),
//                       ),
//                       Text(
//                         "\$ ${calculate}",
//                         style: TextStyle(
//                           color: Colors.purpleAccent,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17.0,
//                         ),
//                       )
//                     ],
//                   ),
//                   //slider
//                   Column(
//                     children: <Widget>[
//                       Text(
//                         "$_tipPercentage%",
//                         style: TextStyle(
//                           color: Colors.greenAccent,
//                           fontSize: 17.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Slider(
//                           min: 0,
//                           max: 100,
//                           activeColor: Colors.purple,
//                           inactiveColor: Colors.grey,
//                           divisions: 10,
//                           value: _tipPercentage.toDouble(),
//                           onChanged: (double newValue) {
//                             setState(() {
//                               _tipPercentage = newValue.round();
//                             });
//                           }),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     calculateTotalPerPerson(double totalTip, double billAmount, int splitBy) {
//       var totalPerPerson = (totalTip + billAmount) / splitBy;
//       return totalPerPerson;
//     }

//     calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
//       double totalTip = 0.0;

//       if (billAmount < 0 ||
//           billAmount.toString().isEmpty ||
//           billAmount == null) {
//         // no go !
//       } else {
//         totalTip = (billAmount + tipPercentage) / 100;
//       }
//       return totalTip;
//     }
//   }
// }

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Your time is Limited, so don't waste it Living someone else's Life.",
    "Life is 10% what happens to me and 90 % of how i react to it."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(14.5)),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ))),
              ),
            ),
            Divider(
              thickness: 2.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text(
                    "Inspire Me !",
                    style: TextStyle(color: Colors.white, fontSize: 18.8),
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    //increment our index/country by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCard"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Lokendra Gharti",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text("lokendragharti3@gmail.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Twitter: @buildappswithme")
            ],
          ),
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScafefoldExample extends StatelessWidget {
  const ScafefoldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email Tapped!"))
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("First")),
      //   BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("Second"))
      // ]),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Customebutton(),
            // InkWell(
            //   child: Text(
            //     "Tap me!",
            //     style: TextStyle(fontSize: 23.4),
            //   ),
            //   onTap: () => debugPrint("tapped..."),
            // ),
          ],
        ),
      ),
    );
  }
}

class Customebutton extends StatelessWidget {
  const Customebutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text(
            "Hello Again!",
          ),
          backgroundColor: Colors.amberAccent.shade700,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
          child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 23.4,
          fontStyle: FontStyle.italic,
        ),
      )),
    );
    // return Center(
    //   child: Text("Hello world", textDirection: TextDirection.ltr,),
    // );
  }
}
