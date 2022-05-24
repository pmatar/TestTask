//
//  ProductCell.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    func configure(with product: Product) {
        firstLabel.text = "\(product.title) \nCategory: \(product.category)"
        secondLabel.text = product.description
        thirdLabel.text = "ID: \(product.id) price: \(product.price) rating: \(product.rating.rate) count: \(product.rating.count)"
        productImageView.sd_setImage(with: product.image, placeholderImage: UIImage(systemName: "photo"))
    }
}
