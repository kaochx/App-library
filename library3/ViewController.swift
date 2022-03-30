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
        static let cellWidth: CGFloat = (screenWidth - spacing) / 2
        
        static let iconSectionSpacing: CGFloat = sectionSpacing / 2
        static let iconWidth : CGFloat = UIConstant.cellWidth / 2.5
    }
    
    var cell_Y: CGFloat = UIConstant.screenHeight / 10 + UIConstant.sectionSpacing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        scrollView.addSubview(textField)
        view.addSubview(scrollView)
        
        setCellLayout()
        setupScrollView()
        setupSearchBarTextField()
    }
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bgblur"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: cell_Y + UIConstant.cellWidth )
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    let textField: UITextField = {
        let searchBarTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        searchBarTextField.placeholder = "App Library"
        searchBarTextField.layer.cornerRadius = searchBarTextField.frame.height * 0.25
        searchBarTextField.layer.masksToBounds = true
        searchBarTextField.clearButtonMode = .whileEditing
        searchBarTextField.returnKeyType = .done
        searchBarTextField.textColor = UIColor.black
        searchBarTextField.textAlignment = .left
        searchBarTextField.leftViewMode = UITextField.ViewMode.always

        let imageView = UIImageView(image: UIImage(named: "magnifyingglass"))
        let padding = CGFloat(70)
        let imageWidth = CGFloat(12)
        imageView.frame = CGRect(x: padding, y: imageWidth, width: 30, height: 30)
        imageView.contentMode = .center

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: searchBarTextField.frame.height))
        containerView.addSubview(imageView)
        searchBarTextField.leftView = containerView
        searchBarTextField.leftViewMode = .always
        
        searchBarTextField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTextField
    }()
    
    func leftImage(_ image: UIImage?, imageWidth: CGFloat, padding: CGFloat) {
        let imageView = UIImageView(image: UIImage(named: "magnifyingglass"))
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: textField.frame.height)
        imageView.contentMode = .center
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: textField.frame.height))
        containerView.addSubview(imageView)
        textField.leftView = containerView
        textField.leftViewMode = .always
    }
    
    func setupSearchBarTextField() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: textField.frame.height)
        ])
    }
        
    func setCellLayout() {
        
        let cell_X1: CGFloat = UIConstant.sectionSpacing
        let cell_X2: CGFloat = UIConstant.sectionSpacing + UIConstant.cellWidth + UIConstant.sectionSpacing
        
        
        let appWidth: CGFloat = UIConstant.screenWidth / 3
        
        for i in 1...10 {
            let bigCell = UIView()
            bigCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
            bigCell.clipsToBounds = true
         
            //icons random
            let imagesName = ["1","2","3","4","5","6","7"]
            let iconsView = UIView()
            let appCount = Int.random(in: 1...4)
            iconsView.backgroundColor = .clear
            
            let firstAppItem = UIImageView()
            firstAppItem.image = UIImage(named: imagesName[Int.random(in: 0...6)])
            let secondAppItem = UIImageView()
            secondAppItem.image = UIImage(named: imagesName[Int.random(in: 0...6)])
            let thirdAppItem = UIImageView()
            thirdAppItem.image = UIImage(named: imagesName[Int.random(in: 0...6)])
            let fourAppItem = UIImageView()
            fourAppItem.image = UIImage(named: imagesName[Int.random(in: 0...6)])
            
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
            iconsView.center = bigCell.center
            iconsView.translatesAutoresizingMaskIntoConstraints = false
            firstAppItem.translatesAutoresizingMaskIntoConstraints = false
            secondAppItem.translatesAutoresizingMaskIntoConstraints = false
            thirdAppItem.translatesAutoresizingMaskIntoConstraints = false
            fourAppItem.translatesAutoresizingMaskIntoConstraints = false
            
            if (i % 2 != 0){
                bigCell.frame = CGRect(x: cell_X1, y: cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing , y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                bigCell.layer.cornerRadius = bigCell.frame.height / 5
            } else {
                bigCell.frame = CGRect(x: cell_X2, y: cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                iconsView.frame = CGRect(x: UIConstant.iconSectionSpacing, y: UIConstant.iconSectionSpacing, width: appWidth, height: appWidth)
                bigCell.layer.cornerRadius = bigCell.frame.height / 5
                
                cell_Y = cell_Y + UIConstant.cellWidth + UIConstant.sectionSpacing
            }
            
            NSLayoutConstraint.activate([
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
    
}

