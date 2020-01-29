//
//  UIImageView+Extensions.swift
//  NSUtils
//
//  Created by Jack Colley on 01/02/2018.
//  Copyright © 2018 Netsells. All rights reserved.
//

import Foundation
import UIKit

/// Image resizer. This uses CoreGraphics which is the most effiecent way to resize an image. Find more info here https://nshipster.com/image-resizing/.
///
/// - Parameters:
///   - image: image to resize
///   - size: size to resize the image to
/// - Returns: returns a resized image for use.
func resizeImage(image: UIImage, for size: CGSize) -> UIImage? {

    let render = UIGraphicsImageRenderer(size: size)
    return render.image(actions: { (context) in
        image.draw(in: CGRect(origin: .zero, size: size))
    })
}

extension UIImageView {

    /// Download image from url
    ///
    /// - Parameters:
    ///   - url: URL for the required image
    ///   - mode: Content mode for the final downloaded image
    public func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse,
                200...399 ~= httpURLResponse.statusCode,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    print("Error setting image - \(url)")
                    return
            }
            
            DispatchQueue.main.async() {
                self.image = image
                self.contentMode = mode
            }
        }.resume()
    }

    /// Convience helper to download image and resize from a specified url
    ///
    /// - Parameters:
    ///   - link: Url the download image from
    ///   - mode: Content mode for the downloaded image
    public func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }

}
