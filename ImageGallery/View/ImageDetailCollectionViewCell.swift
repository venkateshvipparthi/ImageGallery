//
//  ImageDetailCollectionViewCell.swift
//  ImageGallery
//
//  Created by Admin on 28/04/2022.
//

import UIKit

class ImageDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgDesc: UILabel!
    @IBOutlet weak var imageCollectionCell: UIImageView!
    
    override func prepareForReuse() {
        self.imageCollectionCell.image = nil
    }
    
    func setData(_ photoDetail: ImageDetail) {
        imgDesc.text = photoDetail.title
    }
    
}
