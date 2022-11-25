//
//  DetailViewController.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//


import UIKit
import SnapKit

protocol DetailViewInputProtocol: AnyObject {
    func displayLocation(with title: String)
    func displayAuthor(with title: String)
    func displayLikes(with title: String)
    func displayImage(with imageData: Data)
}

protocol DetailViewOutputProtocol: AnyObject {
    init(view: DetailViewInputProtocol)
    func showDetails()
}

class DetailViewController: UIViewController {
  
    var presenter: DetailViewOutputProtocol!

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var labelLocation: UILabel = {
        let labelLocation = UILabel()
        labelLocation.textAlignment = .center
        //labelLocation.text = "Location: \(textLocation)"
        return labelLocation
    }()
    
    lazy var labelAuthor: UILabel = {
        let labelAuthor = UILabel()
        labelAuthor.textAlignment = .left
        labelAuthor.font = labelAuthor.font.withSize(15)
        labelAuthor.textColor = .lightGray
        //labelAuthor.text = "Author: \(textAuthor)"
        return labelAuthor
    }()
    
    lazy var labelLikes: UILabel = {
        let labelLikes = UILabel()
        labelLikes.textAlignment = .right
        labelLikes.font = labelAuthor.font.withSize(15)
        labelLikes.textColor = .lightGray
        return labelLikes
    }()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
        
        self.view.backgroundColor = .white
        view.addSubviews(imageView, labelLocation, labelAuthor, labelLikes)

        initialLayout()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    

    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
//        if let load = selectedImage {
//            let images = load
//            configureImage(with: images, imageView: imageView)
//        }
     }
    
    //MARK: - Initial constraints Detail ViewController
    func initialLayout() {
        labelLocation.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(25)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(labelLocation.snp.bottom).offset(25)
            make.height.width.equalTo(250)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        labelAuthor.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(25)
        }
        labelLikes.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
        }
    }
    
}


// MARK: - DeailViewInputProtocol
extension DetailViewController: DetailViewInputProtocol {
   
    func displayLocation(with title: String) {
        labelLocation.text = title
    }
    func displayAuthor(with title: String) {
        labelAuthor.text = title
    }
    func displayLikes(with title: String) {
        labelLikes.text = "\(title)"
    }

    func displayImage(with imageData: Data) {
        imageView.image = UIImage(data: imageData)
        
        self.imageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                     self.imageView.transform = .identity
                 }, completion: nil)
    }
    
}

