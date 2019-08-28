//
//  ExtViewController.swift
//  Views
//
//  Created by Anofienam Isioma on 23/10/2018.
//  Copyright © 2018 com.chuck. All rights reserved.
//

import Foundation

extension UIViewController{
    final func setBackgroundImage(img: UIImage) {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = img
        backgroundImage.backgroundColor = UIColor.white
        backgroundImage.contentMode = .scaleAspectFill
        view.backgroundColor = UIColor.clear
    }
}

extension UIImageView{
    func addImageToView(img: UIImage) {
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: 20, height: 20 ))
        imageView.image = img
        imageView.contentMode = .scaleAspectFill
    }
}

extension UIImage {
    func resized(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
