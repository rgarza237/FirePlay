
import Foundation

class CollectionMoviesObject {
    var movieCategory : [MovieCategory]?
   /// var title: String?
    
    init(movieCategory: [MovieCategory]?) {
        self.movieCategory = movieCategory
    }
    
}

class MovieCategory {
    var name : String?
    var moviesImage : [MoviesImage]?
    init(name: String?, moviesImage: [MoviesImage]?) {
        self.name = name
        self.moviesImage = moviesImage
    }
}

class MoviesImage {
    var image: String?
    
    init(image: String?) {
        self.image = image
    }
    
}
