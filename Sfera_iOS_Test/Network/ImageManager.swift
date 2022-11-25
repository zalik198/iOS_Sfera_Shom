//
//  ImageManager.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 25.11.2022.
//

import Foundation


class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    
    func fetchData(from url: URL?) -> Data? {
            guard let url = url else { return nil}
            guard let imageData = try? Data(contentsOf: url) else { return nil}

            return imageData
        
          

    }
}
