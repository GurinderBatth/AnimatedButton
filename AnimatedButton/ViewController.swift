//
//  ViewController.swift
//  AnimatedButton
//
//  Created by Apple on 11/08/18.
//  Copyright © 2018 Batth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
    @IBOutlet weak var constraint1: NSLayoutConstraint!
    @IBOutlet weak var constraint2: NSLayoutConstraint!
    @IBOutlet weak var constraint3: NSLayoutConstraint!
    @IBOutlet weak var constraint4: NSLayoutConstraint!
    
    @IBOutlet weak var vw1: UIView!
    @IBOutlet weak var vw2: UIView!
    @IBOutlet weak var vw3: UIView!
    @IBOutlet weak var vw4: UIView!
    
    var selectedIndexPath: IndexPath! = IndexPath(item: 0, section: 0)
    var oldPosition : CGFloat = 0
    var scroll: Bool = true
    var viewX: CGFloat = 0
    var vw2Frame : CGRect!
    var vw3Frame : CGRect!
    var vw4Frame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewX = vw1.frame.origin.x - 5
        vw2Frame = vw2.frame
        vw3Frame = vw3.frame
        vw4Frame = vw4.frame

    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.backgroundColor = .gray
        case 1:
            cell.backgroundColor = .darkGray
        case 2:
            cell.backgroundColor = .black
        case 3:
            cell.backgroundColor = .brown
        default:
            cell.backgroundColor = .darkGray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        switch selectedIndexPath.row {
        case 0:
            viewX = vw1.frame.origin.x - 5
        case 1:
            viewX = vw2.frame.origin.x - (vw1.frame.origin.x + vw1.frame.size.width + 5)
        case 2:
            viewX = vw3.frame.origin.x - (vw2.frame.origin.x + vw2.frame.size.width + 5)
        case 3:
            viewX = vw4.frame.origin.x - (vw3.frame.origin.x + vw3.frame.size.width + 5)
        default:
            break
        }
        
        
        print(viewX)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if oldPosition < scrollView.contentOffset.x{
            scroll = false
        }else{
            scroll = true
        }
        
        oldPosition = scrollView.contentOffset.x
        let value = UIScreen.main.bounds.width
        let contentOffSet = scrollView.contentOffset.x + 5
        switch selectedIndexPath.row {
        case 0:
            if vw1.frame.origin.x <= 10{
                if scroll == true{
                    constraint1.constant = viewX/value * contentOffSet
                }
            }else{
                if scroll == true{
                    constraint1.constant = viewX/value * contentOffSet
                }else{
                    constraint1.constant = viewX/value * contentOffSet
                }
            }
        case 1:
            let scrollValue = contentOffSet - value
            if vw2.frame.origin.x <= (vw1.frame.origin.x + vw1.frame.width + 10){
                if scroll == true{
                    constraint2.constant = viewX/value * scrollValue
                }
            }else{
                if scroll == true{
                    constraint2.constant = viewX/value * scrollValue
                }else{
                    constraint2.constant = viewX/value * scrollValue
                }
            }
        case 2:
            let scrollValue = contentOffSet - (value * 2)
            if vw3.frame.origin.x <= (vw2.frame.origin.x + vw2.frame.width + 5){
                if scroll == true{
                    constraint3.constant = viewX/value * scrollValue
                }
            }else{
                if scroll == true{
                    constraint3.constant = viewX/value * scrollValue
                }else{
                    constraint3.constant = viewX/value * scrollValue
                }
            }
        case 3:
            let scrollValue = contentOffSet - (value * 3)
            if vw4.frame.origin.x <= (vw3.frame.origin.x + vw3.frame.width + 5){
                if scroll == true{
                    constraint3.constant = viewX/value * scrollValue
                }
            }else{
                if scroll == true{
                    constraint3.constant = viewX/value * scrollValue
                }else{
                    constraint4.constant = viewX/value * scrollValue
                }
            }
        default:
            break
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        switch selectedIndexPath.row {
        case 0:
            self.constraint1.isActive = false
            self.constraint1 = self.vw1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 5)
            self.constraint1.isActive = true
        case 1:
            self.constraint2.isActive = false
            self.constraint2 = self.vw2.leadingAnchor.constraint(equalTo: self.vw1.trailingAnchor, constant: 5)
            self.constraint2.isActive = true
        case 2:
            self.constraint3.isActive = false
            self.constraint3 = self.vw3.leadingAnchor.constraint(equalTo: self.vw2.trailingAnchor, constant: 5)
            self.constraint3.isActive = true
        case 3:
            self.constraint4.isActive = false
            self.constraint4 = self.vw4.leadingAnchor.constraint(equalTo: self.vw3.trailingAnchor, constant: 5)
            self.constraint4.isActive = true
        default:
            break
        }
    }
}

