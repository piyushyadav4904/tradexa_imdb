class object {
  String image;
  String name;
  String type;
   String rating;

  object(this.image, this.name,this.type,this.rating);
}

List<object> list = movielist
    .map((item) => object(item['image'], item['name'],item['type'],item['rating']))
    .toList();

var movielist = [
  {
    "image" : "assets/image/tenet.png",
    "name" : "Tent",
    "type" :"Science|Fiction|Action",
    "rating" :"9.6"
  },

  {
    "image" : "assets/image/maze.png",
    "name" : "Maze runner",
    "type" :"Science|Fiction|Action",
    "rating" :"7.6"
  },
  {
    "image" : "assets/image/invisiable.png",
    "name" : "The invisible man",
    "type" :"Science|Fiction|Action",
    "rating" :"6.6"
  },

  {
    "image" : "assets/image/ava.png",
    "name" : "ava",
    "type" :"Crime|triller",
    "rating" :"7.9"
  },
  {
    "image" : "assets/image/parasite.png",
    "name" : "Paras",
    "type" :"Comedy|triller",
    "rating" :"8.9"
  },
  {
    "image" : "assets/image/joker.png",
    "name" : "Joker",
    "type" :"Psychological|Thriler",
    "rating" :"8.4"
  },
  {
    "image" : "assets/image/irishman.png",
    "name" : "The irishman",
    "type" :"Crime|Action",
    "rating" :"7.8"
  },

];