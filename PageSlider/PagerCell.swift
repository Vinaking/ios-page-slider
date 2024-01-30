//
//  PagerCell.swift
//  PageSlider
//
//  Created by Tùng on 23/01/2024.
//

import UIKit

class PagerCell: UICollectionViewCell {
    @IBOutlet private var lblName: UILabel!
    private let colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.gray]
    
    var pageData: PageData? {
        didSet {
            if let pageData = pageData {
                lblName.text = pageData.name
                contentView.backgroundColor = getColor()
            }
        }
    }
    
    private func getColor() -> UIColor {
        let randomInt = Int.random(in: 0..<4)
        return colors[randomInt]
    }

}

class PageData {
    var name = ""
    init(name: String = "") {
        self.name = name
    }
}
