
import UIKit

class MoviesTableViewCell: UITableViewCell {
    var movieContent: UIView?
    var movieName : UILabel?
    var movieDirector: UILabel?
    var movieYear: UILabel?
    var movieCover: UIImageView?
    
    var movie: Movie?
    
    init(movie: Movie) {
        super.init(style: .default, reuseIdentifier: nil)
        self.movie = movie
        self.backgroundColor = .white
        initUI()
    }
   
    func initUI(){
        
        movieContent = UIView(frame: CGRect(x: 0, y: 5, width: Constants.width - 40 , height: Constants.height/7 - 15))
        movieContent?.backgroundColor = .white
        movieContent?.layer.cornerRadius = 10
        self.addSubview(movieContent!)
        
        movieName = UILabel(frame: CGRect(x: 80, y: 10, width: 250, height: 20))
        movieName?.text = movie?.name
        movieName?.textAlignment = .left
        movieName?.font = .boldSystemFont(ofSize: 18)
        movieContent?.addSubview(movieName!)
        
        movieDirector = UILabel(frame: CGRect(x: 80, y: 40, width: 250, height: 20))
        movieDirector?.text = movie?.director
        movieDirector?.textAlignment = .left
        movieDirector?.font = .systemFont(ofSize: 18)
        movieContent?.addSubview(movieDirector!)
        
        movieYear = UILabel(frame: CGRect(x: 80, y: 70, width: 250, height: 20))
        movieYear?.text = String(movie?.year ?? 0)
        movieYear?.textAlignment = .left
        movieYear?.font = .systemFont(ofSize: 18)
        movieContent?.addSubview(movieYear!)
        
        movieCover = UIImageView(frame: CGRect(x: 10, y: 5, width: 60, height: 95))
        movieCover?.image = UIImage(named: movie?.cover ?? "logo")
        movieCover?.layer.cornerRadius = 10
        movieCover?.layer.masksToBounds = true
        movieContent?.addSubview(movieCover!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
}
