//
//  ConfigureImage.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 24.11.2022.
//

import UIKit

func configureImage(with urlString: String, imageView: UIImageView) {
    guard let url = URL(string: urlString) else {
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let data = data, error == nil else { return }
        DispatchQueue.main.async {
            let image = UIImage(data: data)
            imageView.image = image
        }
    }
    task.resume()
}
