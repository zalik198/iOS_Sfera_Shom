//
//  ViewController.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//
import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let networkManager = NetworkManager()
    private var collectionViews: UICollectionView?
    var imageArray: [UIImage]?
    //var favorite = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.collectionViews?.reloadData()
        }
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.title = "Photo"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2 - 8, height: view.frame.size.width/2)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
                
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionViews = collectionView
        
        
        view.addSubview(collectionView)
        
        collectionViews?.delegate = self
        collectionViews?.dataSource = self
        
        networkManager.fetchPhotos()
        self.view.backgroundColor = .white
        
        // collectionView.dataSource = self
        collectionViews?.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizer.State.began {
            let touchPoint = longPressGestureRecognizer.location(in: self.view)
            if let indexPath = collectionViews?.indexPathForItem(at: touchPoint) {
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
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViews?.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.size.width, height: view.frame.size.height - 100)
    }
    
    //MARK: CollectionViewDataSource
    
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
    
    
    //MARK: - CollectionView Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let newVC = InfoDetailViewController()
        //let cell = collectionView.cellForItem(at: indexPath)!
        
        let vc = DetailViewController()
        vc.selectedImage = networkManager.results[indexPath.row].urls.regular
        vc.textLocation = networkManager.results[indexPath.row].user.location ?? "Местоположение не указано"
        vc.textAuthor = networkManager.results[indexPath.row].user.name
        vc.textLikes = networkManager.results[indexPath.row].likes
        
        navigationController?.pushViewController(vc, animated: true)
        
        print(networkManager.results[indexPath.row].user.location ?? "Пользователь не указал место")
        print(networkManager.results[indexPath.row].user.name)
        print(networkManager.results[indexPath.row].likes)
        print(networkManager.results[indexPath.row].id)
        
        //print(networkManager.results[indexPath.row].createdAt)
        
    }
}

