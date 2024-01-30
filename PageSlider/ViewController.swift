//
//  ViewController.swift
//  PageSlider
//
//  Created by Tùng on 23/01/2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var pageControl: SpecificDotPageControl!
    
    var datas = [
        PageData(name: "One"),
        PageData(name: "Two"),
        PageData(name: "Three"),
        PageData(name: "Four"),
        PageData(name: "Five"),
        PageData(name: "Six"),
        PageData(name: "Seven")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "PagerCell", bundle: nil), forCellWithReuseIdentifier: "PagerCell")
        collectionView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = datas.count
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.currentPageChanged = { page in
            print("currentpage: \(page)")

            self.collectionView.scrollToItem(
                at: IndexPath(item: page, section: 0),
                at: .centeredHorizontally,
                animated: true
            )
            
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                self.pageControl.currentPage = page
            })
        }
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PagerCell", for: indexPath) as! PagerCell
        cell.pageData = datas[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
