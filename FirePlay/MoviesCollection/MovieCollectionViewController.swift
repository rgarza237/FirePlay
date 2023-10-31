//
//  MovieCollectionViewController.swift
//  FirePlay
//
//  Created by Roberto Garza on 07/07/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    var imageMovie : UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.backgroundColor = .black
        imageMovie = UIImageView(frame: CGRect(x: 6, y: 8, width: Constants.width/7, height: Constants.height/9))
        imageMovie?.backgroundColor = UIColor.white
        imageMovie?.contentMode = .scaleAspectFit
        imageMovie?.image = UIImage(named  : "")
        self.addSubview(imageMovie!)
    }
    
    func setData(movieImage : MoviesImage){
        imageMovie?.image = UIImage(named: movieImage.image ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
