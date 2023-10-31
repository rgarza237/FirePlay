
import Foundation

class MoviesData {
    
    var imageSource: CollectionMoviesObject?
    var dataSource: MovieObj?
    
    func getImage(){
        let pepeToro = MoviesImage(image: "pepeToro")
        let chuky = MoviesImage(image: "chuky")
        let orfanato = MoviesImage(image: "orfanato")
        let rescatando = MoviesImage(image: "rescueRyan")
        let fury = MoviesImage(image: "fury")
        let castillo = MoviesImage(image: "castillo")
        let yourName = MoviesImage(image: "yourName")
        let fastFurious = MoviesImage(image: "fast")
        let extraction = MoviesImage(image: "extraction")
        
        let recent = MovieCategory(name: "Recent", moviesImage: [pepeToro, chuky, orfanato, rescatando, fury, castillo, yourName, fastFurious, extraction])
        
        let Image = CollectionMoviesObject(movieCategory: [recent])
        
        imageSource = Image
        
    }
    
    func getData(){
        
        let movie1 = Movie(name: "Pepe el Toro", description: "a lovely true history", cover: "pepeToro", director: "Mel Gipson", year: 2000, duration: 60.3)
        
        let movie2 = Movie(name: "Chuky", description: "a terror history", cover: "chuky", director: "Mel Gup 2 ", year: 2001, duration: 59.0)
        
        let movie3 = Movie(name: "El Horfanato", description: "a history of special need childs", cover: "orfanato", director: "Gillermo del toro ", year: 2006, duration: 90.04)
        
        let warMovi = Movie(name: "Rescatando al soldado Ryan", description: "Es una película bélica épica estadounidense estrenada en 1998 y ambientada en la invasión de Normandía durante la Segunda Guerra Mundial. Dirigido por Steven Spielberg y escrito por Robert Rodat", cover: "rescueRyan", director: "Mark Panigua", year: 2005, duration: 120.8)
        
        let warMovi2 = Movie(name: "Fury", description: "Un comandante de tanque deberá tomar decisiones muy difíciles mientras él y su equipo luchan en Alemania en 1945.", cover: "fury", director: "Phil Harvey", year: 2014, duration: 130)
        
        let movie5 = Movie(
            name: "El Castillo Ambulante",
            description: "Es una película bélica épica estadounidense estrenada en 1998 y ambientada en la invasión de Normandía durante la Segunda Guerra Mundial. Dirigido por Steven Spielberg y escrito por Robert Rodat",
            cover: "castillo",
            director: "Hayao Miyazaki",
            year: 1999,
            duration: 119)
        
        let movie6 = Movie(name: "Your Name", description: "Dos adolescentes comparten una profunda y mágica conexión al descubrir que están intercambiando cuerpos”", cover: "yourName", director: "Makoto Shinkai", year: 2018, duration: 107)
        
        
        let actionMovie1 = Movie(
            name: "Fast and furious",
            description: "Dominic Toretto to bring down a heroin importer by infiltrating his operation.",
            cover: "fast",
            director: "Justin Lin",
            year: 2009,
            duration: 107)
        
        let actionMovie2 = Movie(
            name: "Extraction",
            description: "Black market mercenary embarks on the most deadly extraction of his career ",
            cover: "extraction",
            director: "Sam Hargrave",
            year: 2020,
            duration: 116)
        
        
        let categoryTerror = Category(name: "Terror", movies: [movie1,movie2, movie3])
        let categoryAction = Category(name: "Action", movies: [warMovi, warMovi2,actionMovie1, actionMovie2])
        let animation = Category(name: "Animation", movies: [movie5, movie6])
        
        let moviesBD = MovieObj(category: [categoryAction, categoryTerror, animation])
        
        dataSource = moviesBD
    }
    
    
}
