import UIKit

class GridViewController: UIViewController {
    
    var logoutButton : UIButton?
    var moviesCollectionView: UICollectionView?
    var moviesData = MoviesData()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:114/255, green: 47/255, blue: 55/255, alpha: 1)
        initUI()
        moviesData.getImage()
        setContrains()
    }
    
    func initUI(){

        moviesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = Constants.width/15
            layout.minimumInteritemSpacing = Constants.width/10
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collection.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            collection.isPagingEnabled = true
            collection.translatesAutoresizingMaskIntoConstraints = false
            collection.backgroundColor = .clear
            collection.showsVerticalScrollIndicator = true
            collection.showsHorizontalScrollIndicator = true
            return collection
        }()
        let logoutButton = UIButton(frame: .zero)
        logoutButton.backgroundColor = UIColor(red:222/255, green: 184/255, blue: 135/255, alpha: 1)
        logoutButton.setTitle("Back", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.addTarget(self, action: #selector(logout),for:
                .touchUpInside)
        view.addSubview(logoutButton)
        self.logoutButton = logoutButton
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            logoutButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    func setContrains() {
        guard let moviesCollectionView = moviesCollectionView else { return }
        
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource =  self
        view.addSubview(moviesCollectionView)
        
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            moviesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            moviesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
    @objc func logout(){
        let logout = ViewController()
        logout.modalPresentationStyle = .fullScreen
        present(logout, animated: true, completion: nil)
    }

}

//MARK: - CollectionView Extensions

extension GridViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesData.imageSource?.movieCategory?[section].moviesImage?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moviesCollectionView?.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        let moviesImage = moviesData.imageSource?.movieCategory?[indexPath.section].moviesImage?[indexPath.item]
        cell.setData(movieImage: moviesImage!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.width/5 - 10 , height: Constants.height/6 - 40)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
