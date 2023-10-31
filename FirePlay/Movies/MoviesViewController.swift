
import UIKit

class MoviesViewController: UIViewController {
    
    var tableView: UITableView?
    var moviesCollectionView: UICollectionView?
    var moviesData = MoviesData()
    var showMoreButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        moviesData.getData()
        moviesData.getImage()
        setConstrains()
    }
    
    func initUI(){
        tableView = UITableView(frame: CGRect(x: 10, y: 200, width: Constants.width - 50, height: Constants.height - 115))
        tableView?.delegate = self
        tableView?.dataSource = self
        view.addSubview(tableView!)
        
        
        moviesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
            let collection = UICollectionView( frame: .zero, collectionViewLayout: layout )
            collection.register(MovieCollectionViewCell.self , forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
        
        let showMoreButton = UIButton()
        showMoreButton.setTitleColor(UIColor.blue, for: .normal)
        showMoreButton.setTitle("Ver Mas", for: .normal)
        showMoreButton.backgroundColor = UIColor.white
        showMoreButton.layer.cornerRadius = 5
        showMoreButton.translatesAutoresizingMaskIntoConstraints = false
        showMoreButton.addTarget(self, action: #selector(goToGrid), for: .touchUpInside)
        self.showMoreButton = showMoreButton
        self.view.addSubview(showMoreButton)
    }
    
    @objc func goToGrid(){
        let goToGrid = GridViewController()
        goToGrid.modalPresentationStyle = .popover
        present(goToGrid, animated: true, completion: nil)
    }
    
    func setConstrains(){
        guard let moviesCollectionView = moviesCollectionView, let showMoreButton = showMoreButton else {return}
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        view.addSubview(moviesCollectionView)
        
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            moviesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            moviesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            showMoreButton.topAnchor.constraint(equalTo: moviesCollectionView.bottomAnchor, constant: 0),
            showMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMoreButton.widthAnchor.constraint(equalToConstant: 100),
            showMoreButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

//MARK: - TableView Extensions
extension MoviesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesData.dataSource?.category?[section].movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = moviesData.dataSource?.category?[indexPath.section].movies?[indexPath.row]
        let cell = MoviesTableViewCell(movie: movie!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return moviesData.dataSource?.category?.count ?? 0 // Operador de coalecensia
    }
    
   /* func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource?.category?[section].name ?? ""
    }*/
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I am in the  categoria \(indexPath.section) and the row \(indexPath.row)")
        
        let movie = moviesData.dataSource?.category?[indexPath.section].movies?[indexPath.row]
        
        let detailViewController = DetailViewController(movie: movie)
        detailViewController.modalPresentationStyle = .popover
        present(detailViewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.height/7
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        
        view.backgroundColor = .white
        let image = UIImageView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        image.image = UIImage(named: "catIcon")
        image.tintColor = .backgroundBrownColor
        view.addSubview(image)
        
        let label = UILabel(frame: CGRect(x: 40, y: 5, width: 130, height: 20))
        label.textColor = .backgroundBrownColor
        label.text = moviesData.dataSource?.category?[section].name ?? ""
        label.font = .boldSystemFont(ofSize: 25)
        view.addSubview(label)
        
        return view
    }
}
//MARK: - CollectionView Extensions

extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesData.imageSource?.movieCategory?[section].moviesImage?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        let moviesImage = moviesData.imageSource?.movieCategory?[indexPath.section].moviesImage?[indexPath.item]
        cell.setData(movieImage: moviesImage!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: Constants.width/5-10, height: Constants.height/6-30)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
