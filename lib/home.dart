 import 'package:flutter/material.dart';
import 'package:movieappdemo/Model/movie.dart';

import 'movie_ui/movie_ui.dart';
class MovieListView  extends StatelessWidget  {
  final List<Movie>movieList=Movie.getMovies();
  final List movies=[
    "Titanic",
    "Taxi Driver",
    "Rambo",
    "The Avengers",
    "300",
    "The Wolf Of Wall Streets",
    "Game Of Thrones",
    "Vikings",
    "Intertstellar",
    "Avatar",
    "Blade Runner",
    "Sex Eductaion ",
    "Fight Club",
    "Fury",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOVIE FLIX",
        style: TextStyle(
          color: Color(0xffE50914),
          fontWeight:FontWeight.w900,
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder:(BuildContext,int index){
          return Stack(
              children:<Widget> [
                Positioned(
                    child: movieCard(movieList[index], context)),
                Positioned(
                  top: 10.0,
                    child: movieImage(movieList[index].images[0])),

              ]);
        // return Card(
        //   elevation:4.5 ,
        //   color: Colors.white,
        //   child: ListTile(
        //     leading: CircleAvatar(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: NetworkImage(movieList[index].images[0]),
        //             fit: BoxFit.cover
        //           ),
        //           borderRadius: BorderRadius.circular(13.9)
        //         ),
        //         child: null ,
        //       ),
        //     ),
        //     trailing: Text("... "),
        //     title: Text(movieList[index].Title),
        //     subtitle: Text("${movieList[index].Title}"),
        //     onTap: (){
        //       Navigator.push(context,MaterialPageRoute(
        //           builder: (context)=>MovieListViewDetails(movieName:movieList.elementAt(index).Title,
        //           movie: movieList[index])));
        //     },
        //     //onTap: ()=>debugPrint("Movie Name: ${movies.elementAt(index)}"),
        //   ),
        // );
      }),
    );
  }
  Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
         width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.only(top:8.0,
              bottom: 8.0,
              left: 54.0,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:<Widget> [
                    Flexible(
                      child: Text(movie.Title,style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white,
                        )
                        ,),
                    ),
                    Text("Rating: ${movie.imdbRating}/10",
                      style: mainTextstyle(),
                      // style: TextStyle(
                      //   fontSize: 15.0,
                      //   color: Colors.grey,
                      // ),

                    )
                  ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Released${movie.Released}",
                      style: mainTextstyle(),),
                      Text(movie.Runtime,style: mainTextstyle(),
                      // style: TextStyle(
                      //   fontSize: 15.0,
                      //   color: Colors.grey,
                      // ),
                      ),
                      Text(movie.Rated,style: mainTextstyle()
                      // style: TextStyle(
                      //   fontSize: 15.0,
                      //   color: Colors.grey,
                      // )
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: ()=> {
      Navigator.push(context,MaterialPageRoute(
                builder: (context)=>MovieListViewDetails(movieName:movie.Title,
                  movie: movie)))
      },
    );
  }
  TextStyle mainTextstyle(){
    return TextStyle(
      fontSize: 15.0,
      color: Colors.blueGrey,
    );
  }
  Widget movieImage(String Imageurl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        //using shape
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(Imageurl ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTk0MTI0NzQ2NV5BMl5BanBnXkFtZTgwMDkxODA5NTE@._V1_SY1000_SX1500_AL_.jpg' ),
        fit: BoxFit.cover),
      ),
    );
  }

}
 // new route (screen page)//
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;
  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MoviesDetailsExtraPos(posters: movie.images,)
        ],
      ),
    );
  }
}


 






