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
        
        static var cell_X1: CGFloat = sectionSpacing
        static var cell_X2: CGFloat = sectionSpacing + cellWidth + sectionSpacing
        static var cell_Y: CGFloat = sectionSpacing + spacing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        scrollView.addSubview(textField)
        
        func setCellLayout() {
            for i in 1...10 {
                let bigCell = UIView()
                bigCell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
                bigCell.clipsToBounds = true
                scrollView.addSubview(bigCell)
               // scrollView.addSubview(randonApp)
                if (i % 2 != 0){
                    bigCell.frame = CGRect(x: UIConstant.cell_X1, y: UIConstant.cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                    
                    
                    
                    //bigCell.addSubview(randonApp)
                } else {
                    bigCell.frame = CGRect(x: UIConstant.cell_X2, y: UIConstant.cell_Y, width: UIConstant.cellWidth, height: UIConstant.cellWidth)
                    bigCell.clipsToBounds = true
                    bigCell.layer.cornerRadius = bigCell.frame.height / 5
                    UIConstant.cell_Y = UIConstant.cell_Y + UIConstant.cellWidth + UIConstant.sectionSpacing
                }
            }
        }
        
        setCellLayout()
        
        view.addSubview(scrollView)
        
        setupScrollView()
        setupSearchBarTextField()
        
    }
    
    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bgblur"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    func setupScrollView() {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: bgImageView.bounds.size.height)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            //FIXME:
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

//        let magnifyingImage = UIImage(named: "magnifyingglass")
//        searchBarTextField.leftView = UIImageView(image: magnifyingImage)

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

    
    let randonApp: UIView = {
        let imagesName = ["1","2","3","4","5","6","7"]
        let bgView = UIView()
        let appCount = Int.random(in: 1...4)
        let iconsRandom = Int.random(in: 1...7)
    
        bgView.backgroundColor = .blue
        bgView.frame = CGRect(x: UIConstant.cell_X1 * 1.5 , y: UIConstant.cell_Y * 1.5, width: 50, height: 50)
        
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
        
        switch appCount {
        case 1:
            firstAppItem.isHidden = false
            secondAppItem.isHidden = false
            thirdAppItem.isHidden = false
            fourAppItem.isHidden = false
            bgView.addSubview(firstAppItem)
            bgView.addSubview(secondAppItem)
            bgView.addSubview(thirdAppItem)
            bgView.addSubview(fourAppItem)
            
        case 2:
            firstAppItem.isHidden = false
            secondAppItem.isHidden = false
            thirdAppItem.isHidden = false
            bgView.addSubview(firstAppItem)
            bgView.addSubview(secondAppItem)
            bgView.addSubview(thirdAppItem)
        case 3:
            firstAppItem.isHidden = false
            secondAppItem.isHidden = false
            bgView.addSubview(firstAppItem)
            bgView.addSubview(secondAppItem)
            
        default:
            firstAppItem.isHidden = false
            bgView.addSubview(firstAppItem)
        }
        
       return bgView
    }()
    
}

