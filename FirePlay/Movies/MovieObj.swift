
import Foundation

class MovieObj {
    var category : [Category]?
   /// var title: String?
    
    init(category: [Category]?) {
        self.category = category
    }
    
}

class Category {
    var name : String?
    var movies : [Movie]?
    init(name: String?, movies: [Movie]?) {
        self.name = name
        self.movies = movies
    }
}

class Movie {
    var name: String?
    var description: String?
    var cover : String?
    var director: String?
    var year: Int?
    var duration : Float?
    
    init(name: String?, description: String?, cover: String?, director: String?, year: Int?, duration: Float?) {
        self.name = name
        self.description = description
        self.cover = cover
        self.director = director
        self.year = year
        self.duration = duration
    }
    
}
