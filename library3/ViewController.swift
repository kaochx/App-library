//
//  ViewController.swift
//  library3
//
//  Created by White Kao on 2022/3/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    enum UIConstant {
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        static let sectionSpacing: CGFloat = 25
        static let spacing: CGFloat = sectionSpacing * 3
        static let spacingPad: CGFloat = sectionSpacing * 5
        static let cellWidth: CGFloat = (screenWidth - spacing) / 2
        static let cellWidthPad: CGFloat = (screenWidth - spacingPad) / 4
        
        static let iconSectionSpacing: CGFloat = sectionSpacing / 2
        static let iconWidth : CGFloat = UIConstant.cellWidth / 2.5
    }
    
    var cell_Y: CGFloat = UIConstant.screenHeight / 10 + UIConstant.sectionSpacing
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        scrollView.addSubview(searchBarLabelUI)
        view.addSubview(scrollView)
        
        setupBGView()
        setCellLayout()
        setupScrollView()
        setupSearchBarTextField()
    }
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bgblur"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private func setupBGView(){
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: cell_Y + UIConstant.cellWidth )
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private let searchBarLabelUI: UILabel = {
        let barUILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        barUILabel.layer.cornerRadius = barUILabel.frame.height * 0.3
        barUILabel.layer.masksToBounds = true
        barUILabel.textAlignment = .center
        barUILabel.textColor = .darkGray
        barUILabel.font = UIFont.systemFont(ofSize: 20)
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.darkGray)

        let fullString = NSMutableAttributedString(attachment: imageAttachment)
        fullString.append(NSAttributedString(string: " App Library"))
        barUILabel.attributedText = fullString
        
        
        barUILabel.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        barUILabel.translatesAutoresizingMaskIntoConstraints = false
        return barUILabel
    }()
        
    private func setupSearchBarTextField() {
        NSLayoutConstraint.activate([
            searchBarLabelUI.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBarLabelUI.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchBarLabelUI.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            searchBarLabelUI.heightAnchor.constraint(equalToConstant: searchBarLabelUI.frame.height)
        ])
    }
    
    private func setCellLayout() {
        
        let cell_X1: CGFloat = UIConstant.sectionSpacing
        let cell_X2: CGFloat = UIConstant.sectionSpacing + UIConstant.cellWidth + UIConstant.sectionSpacing
        
        let cell_PadX1: CGFloat = UIConstant.sectionSpacing
        let cell_PadX2: CGFloat = UIConstant.sectionSpacing * 2 + UIConstant.cellWidthPad
        let cell_PadX3: CGFloat = UIConstant.sectionSpacing * 3 + UIConstant.cellWidthPad * 2
        let cell_PadX4: CGFloat = UIConstant.sectionSpacing * 4 + UIConstant.cellWidthPad * 3
    
        let appWidth: CGFloat = UIConstant.screenWidth / 3
        print (UIConstant.screenWidth)
        for i in 1...24 {
            let bigCell = UIView()
            bigCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
            bigCell.clipsToBounds = true
         
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
            label.text = "Other"
            label.textColor = UIColor.white
            //label.font = UIFont.boldSystemFont(ofSize: CGFloat(17))
            label.font = UIFont(name:"Helvetica Neue", size: 18)
            
            //icons random
            let imagesName = ["1","2","3","4","5","6","7"]
            let iconsView = UIView()
            let appCount = Int.random(in: 1...4)
            iconsView.backgroundColor = .clear
            
            let getRandom = randomSequenceGenerator(min: 0, max: 6)
            
            let firstAppItem = UIImageView()
            firstAppItem.image = UIImage(named: imagesName[getRandom()])
            let secondAppItem = UIImageView()
            secondAppItem.image = UIImage(named: imagesName[getRandom()])
            let thirdAppItem = UIImageView()
            thirdAppItem.image = UIImage(named: imagesName[getRandom()])
            let fourAppItem = UIImageView()
            fourAppItem.image = UIImage(named: imagesName[getRandom()])
            
            firstAppItem.isHidden = true
            secondAppItem.isHidden = true
            thirdAppItem.isHidden = true
            fourAppItem.isHidden = true
            
            firstAppItem.frame = CGRect(x: 0, y: 0, width: UIConstant.iconWidth , height:  UIConstant.iconWidth)
            secondAppItem.frame = CGRect(x: 0, y: 0, width: UIConstant.iconWidth , height:  UIConstant.iconWidth)
            thirdAppItem.frame = CGRect(x: 0, y: 0, width: UIConstant.iconWidth , height:  UIConstant.iconWidth)
            fourAppItem.frame = CGRect(x: 0 , y: 0 , width: UIConstant.iconWidth , height:  UIConstant.iconWidth)
            
            switch appCount {
            case 1:
                firstAppItem.isHidden = false
                secondAppItem.isHidden = false
                thirdAppItem.isHidden = false
                fourAppItem.isHidden = false
            case 2:
                firstAppItem.isHidden = false
                secondAppItem.isHidden = false
                thirdAppItem.isHidden = false
            case 3:
                firstAppItem.isHidden = false
                secondAppItem.isHidden = false
            case 4:
                firstAppItem.isHidden = false
            default:
                print("noooo way")
            }
            
            iconsView.addSubview(firstAppItem)
            iconsView.addSubview(secondAppItem)
            iconsView.addSubview(thirdAppItem)
            iconsView.addSubview(fourAppItem)
            
            scrollView.addSubview(bigCell)
            bigCell.addSubview(iconsView)
            scrollView.addSubview(label)
            iconsView.center = bigCell.center
            iconsView.translatesAutoresizingMaskIntoConstraints = false
            firstAppItem.translatesAutoresizingMaskIntoConstraints = false
            secondAppItem.translatesAutoresizingMaskIntoConstraints = false
            thirdAppItem.translatesAutoresizingMaskIntoConstraints = false
            fourAppItem.translatesAutoresizingMaskIntoConstraints = false
            label.translatesAutoresizingMaskIntoConstraints = false
            
            switch UIConstant.screenWidth {
            case  0...600:
                if (i % 2 != 0){
                    bigCell.frame = CGRect(x: cell_X1, y: cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing , y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                } else {
                    bigCell.frame = CGRect(x: cell_X2, y: cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing, y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                    
                    cell_Y = cell_Y + UIConstant.cellWidth + UIConstant.sectionSpacing * 1.5
                }
            default:
                if (i % 4 == 1){
                    bigCell.frame = CGRect(x: cell_PadX1, y: cell_Y, width: UIConstant.cellWidthPad, height: UIConstant.cellWidthPad)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing , y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                } else if (i % 4 == 2){
                    bigCell.frame = CGRect(x: cell_PadX2, y: cell_Y, width: UIConstant.cellWidthPad, height: UIConstant.cellWidthPad)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing , y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                } else if (i % 4 == 3){
                    bigCell.frame = CGRect(x: cell_PadX3, y: cell_Y, width: UIConstant.cellWidthPad, height: UIConstant.cellWidthPad)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing , y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                } else {
                    bigCell.frame = CGRect(x: cell_PadX4, y: cell_Y, width: UIConstant.cellWidthPad, height: UIConstant.cellWidthPad)
                    iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing, y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                    
                    cell_Y = cell_Y + UIConstant.cellWidthPad + UIConstant.sectionSpacing * 2
                }
            }
                        
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: bigCell.bottomAnchor),
                label.centerXAnchor.constraint(equalTo: bigCell.centerXAnchor),
                
                iconsView.topAnchor.constraint(equalTo: bigCell.topAnchor, constant: 15),
                iconsView.leadingAnchor.constraint(equalTo: bigCell.leadingAnchor, constant: 15),
                iconsView.trailingAnchor.constraint(equalTo: bigCell.trailingAnchor, constant: -15),
                iconsView.bottomAnchor.constraint(equalTo: bigCell.bottomAnchor, constant: -15),
                
                firstAppItem.topAnchor.constraint(equalTo: iconsView.topAnchor),
                firstAppItem.leadingAnchor.constraint(equalTo: iconsView.leadingAnchor),
                firstAppItem.trailingAnchor.constraint(equalTo: secondAppItem.leadingAnchor, constant: -10),
                firstAppItem.bottomAnchor.constraint(equalTo: thirdAppItem.topAnchor, constant: -10),
                
                secondAppItem.topAnchor.constraint(equalTo: iconsView.topAnchor),
                secondAppItem.trailingAnchor.constraint(equalTo: iconsView.trailingAnchor),
                secondAppItem.bottomAnchor.constraint(equalTo: fourAppItem.topAnchor, constant: -10),
                
                thirdAppItem.leadingAnchor.constraint(equalTo: iconsView.leadingAnchor),
                thirdAppItem.trailingAnchor.constraint(equalTo: fourAppItem.leadingAnchor, constant: -10),
                thirdAppItem.bottomAnchor.constraint(equalTo: iconsView.bottomAnchor),
                
                fourAppItem.trailingAnchor.constraint(equalTo: iconsView.trailingAnchor),
                fourAppItem.bottomAnchor.constraint(equalTo: iconsView.bottomAnchor),
                
                firstAppItem.heightAnchor.constraint(equalTo: secondAppItem.heightAnchor),
                secondAppItem.heightAnchor.constraint(equalTo: thirdAppItem.heightAnchor),
                thirdAppItem.heightAnchor.constraint(equalTo: fourAppItem.heightAnchor),
                firstAppItem.widthAnchor.constraint(equalTo: secondAppItem.widthAnchor),
                secondAppItem.widthAnchor.constraint(equalTo: thirdAppItem.widthAnchor),
                thirdAppItem.widthAnchor.constraint(equalTo: fourAppItem.widthAnchor),
                
            ])
        }
    }
    
    private func randomSequenceGenerator(min: Int, max: Int) -> () -> Int {
        var numbers: [Int] = []
        return {
            if numbers.isEmpty {
                numbers = Array(min ... max)
            }

            let index = Int(arc4random_uniform(UInt32(numbers.count)))
            return numbers.remove(at: index)
        }
    }
}

