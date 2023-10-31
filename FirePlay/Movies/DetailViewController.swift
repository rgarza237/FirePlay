
import UIKit

class DetailViewController: UIViewController {
    
    var movieContent: UIView?
    var movieName : UILabel?
    var movieDirector: UILabel?
    var movieYear: UILabel?
    var movieCover: UIImageView?
    var movieDescription: UILabel?
    var movieDuration: UILabel?
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        initUI()
    }
    
    init(movie: Movie?) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        
        movieContent = UIView(frame: CGRect(x: 10, y: 100, width: Constants.width - 20 , height: Constants.height - 200))
        movieContent?.backgroundColor = .white
        movieContent?.layer.cornerRadius = 10
        view.addSubview(movieContent!)
        
        
        movieName = UILabel(frame: CGRect(x: 0, y: 240, width: Constants.width - 20, height: 20))
        movieName?.text = movie?.name
        movieName?.textAlignment = .center
        movieName?.font = .boldSystemFont(ofSize: 18)
        movieContent?.addSubview(movieName!)
        
        movieDescription = UILabel(frame: CGRect(x: 30, y: 270, width: Constants.width - 90, height: 200))
        movieDescription?.text = movie?.description
        movieDescription?.numberOfLines = 0
        movieDescription?.textAlignment = .justified
        movieDescription?.font = .boldSystemFont(ofSize: 18)
        movieContent?.addSubview(movieDescription!)
        
        movieDirector = UILabel(frame: CGRect(x: 30, y: 500, width: Constants.width/2 , height: 20))
        movieDirector?.text = movie?.director
        movieDirector?.textAlignment = .left
        movieDirector?.font = .systemFont(ofSize: 18)
        movieContent?.addSubview(movieDirector!)
        
        movieYear = UILabel(frame: CGRect(x: 30, y: 540, width: Constants.width/2 , height: 20))
        movieYear?.text = String(movie?.year ?? 0)
        movieYear?.textAlignment = .left
        movieYear?.font = .systemFont(ofSize: 18)
        movieContent?.addSubview(movieYear!)
        
        movieDuration = UILabel(frame: CGRect(x: 30, y: 580, width: Constants.width/2 , height: 20))
        movieDuration?.text = "Duration: \(movie?.duration ?? 0) min"
        movieDuration?.textAlignment = .left
        movieDuration?.font = .systemFont(ofSize: 18)
        movieContent?.addSubview(movieDuration!)
        
        movieCover = UIImageView(frame: CGRect(x: Constants.width/2 - 65, y: 20, width: 120, height: 200))
        movieCover?.image = UIImage(named: movie?.cover ?? "logo")
        movieCover?.layer.cornerRadius = 10
        movieCover?.layer.masksToBounds = true
        movieContent?.addSubview(movieCover!)
    }
    

}
