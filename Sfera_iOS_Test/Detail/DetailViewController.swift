//
//  DetailViewController.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//


import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var selectedImage: String?
    var textLocation = String()
    var textAuthor = String()
    var textLikes = Int()
    
    
    
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var labelLocation: UILabel = {
        let labelLocation = UILabel()
        labelLocation.textAlignment = .center
        labelLocation.text = "Location: \(textLocation)"
        return labelLocation
    }()
    
    lazy var labelAuthor: UILabel = {
        let labelAuthor = UILabel()
        labelAuthor.textAlignment = .left
        labelAuthor.font = labelAuthor.font.withSize(15)
        labelAuthor.textColor = .lightGray
        labelAuthor.text = "Author: \(textAuthor)"
        return labelAuthor
    }()
    
    lazy var labelLikes: UILabel = {
        let labelLikes = UILabel()
        labelLikes.textAlignment = .right
        labelLikes.font = labelAuthor.font.withSize(15)
        labelLikes.textColor = .lightGray
        labelLikes.text = "Likes: \(textLikes)"
        return labelLikes
    }()
    //    init (imageView: UIImageView) {
    //        self.image = imageView
    //        super.init(nibName: nil, bundle: nil)
    //
    //    }
    
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        view.addSubviews(imageView, labelLocation, labelAuthor, labelLikes)
        
        initialLayout()
        imageView.isHidden = true
        if let load = selectedImage {
            let images = load
            configureImage(with: images, imageView: imageView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        imageView.isHidden = false

        self.imageView.transform = CGAffineTransform(scaleX: 0, y: 0)
                 UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                     self.imageView.transform = .identity
                 }, completion: nil)
        
   
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

