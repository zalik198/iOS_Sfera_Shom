//
//  ViewController.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//
import UIKit
import SnapKit

class PhotoViewController: UIViewController {
    
    let networkManager = NetworkManager()
    //var detail: Result!
    //var imageArray: [UIImage]?
    //var favorite = Favorite()
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.backgroundColor = .systemGray5
        return collectionView
    }()
    
//    lazy var buttonTitle: UIButton = {
//       let buttonTitle = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        //buttonTitle.titleLabel?.largeContentTitle = title
//        buttonTitle.title(for: .normal)
//        buttonTitle.backgroundColor = .blue
//        buttonTitle.titleLabel?.text = "Hello World"
//        return buttonTitle
//    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesSearchBarWhenScrolling = false
        self.view.backgroundColor = .white
        self.title = "Photo"
        //self.buttonTitle.buttonType = .custom
        //self.navigationItem.titleView = buttonTitle
        //self.navigationItem.title = "Hellow sad"

        networkManager.fetchPhotos()
        view.addSubviews(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        initialLayout()
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.collectionView.reloadData()
        }
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    //MARK: Initial constraints
    func initialLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.width.trailing.leading.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc private func duobleTapInPost() {
                print("longTap")

    }
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {

        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            //longPressGestureRecognizer.minimumPressDuration = 2
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
                print("\(networkManager.results[indexPath.row].user.name)")
                //add your code here
                //you can use 'indexPath' to find out which row is selected
            }

            print("longTap")
        }
    }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.tabBarController?.tabBar.isHidden = false
        }
    


}

//MARK: Extension CollectionViewDataSource
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = networkManager.results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
           

        }
        
        cell.configure(with: imageURLString)
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return networkManager.results.count
    }
}


//MARK: - Extension CollectionView Delegate
extension PhotoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let newVC = InfoDetailViewController()
        //let cell = collectionView.cellForItem(at: indexPath)!
        
        let vc = DetailViewController()

        let config: DetailConfiguratorInputProtocol = DetailConfigurator()
        config.configure(with: vc, and: networkManager.results[indexPath.row])
        //vc.selectedImage = networkManager.results[indexPath.row].urls.regular
        //vc.textLocation = networkManager.results[indexPath.row].user.location ?? "Местоположение не указано"
        //vc.textAuthor = networkManager.results[indexPath.row].user.name
        //vc.textLikes = networkManager.results[indexPath.row].likes
        navigationController?.pushViewController(vc, animated: true)

        
        //print(networkManager.results[indexPath.row].user.location ?? "Пользователь не указал место")
        //print(networkManager.results[indexPath.row].user.name)
        //print(networkManager.results[indexPath.row].likes)
        //print(networkManager.results[indexPath.row].id)
        
//        let tapRecog = UITapGestureRecognizer(target: self, action: #selector(duobleTapInPost))
//        tapRecog.numberOfTapsRequired = 2
//        collectionView.addGestureRecognizer(tapRecog)
            
    }
    
    
    
}


//MARK: - Extension UICollectionViewDelegateFlowLayout
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.size.width/2 - 12, height: view.frame.size.width/2)
    }
}

extension PhotoViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

