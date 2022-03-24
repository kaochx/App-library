//
//  ViewController.swift
//  library3
//
//  Created by White Kao on 2022/3/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgImageView)
        //view.addSubview(bgImageView)
        view.addSubview(blurredEffectView)

        blurredEffectView.contentView.addSubview(scrollView)
        
        scrollView.addSubview(textField)
        scrollView.addSubview(bigCellView_1)
        scrollView.addSubview(bigCellView_2)
        scrollView.addSubview(bigCellView_3)
        scrollView.addSubview(bigCellView_4)
        scrollView.addSubview(bigCellView_5)
        scrollView.addSubview(bigCellView_6)
        scrollView.addSubview(bigCellView_7)
        scrollView.addSubview(bigCellView_8)
        scrollView.addSubview(bigCellView_9)
        scrollView.addSubview(bigCellView_10)
        
        setupBlurredView()
        setupScrollView()
        setupSearchBarTextField()
        
    }
    
    //var imageView = UIImageView()
    let bgImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bg"))
        //imageView.frame = imageView.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let blurredEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        //blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurredEffectView
    }()
    
    func setupBlurredView() {
        bgImageView.frame = view.bounds
        blurredEffectView.frame = bgImageView.bounds
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    func setupScrollView() {
        scrollView.contentSize = CGSize(width: blurredEffectView.frame.width, height: blurredEffectView.frame.height)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
        searchBarTextField.textAlignment = .center
//        searchBarTextField.leftView = UIImageView(image: UIImage(named: "clip"))
//        searchBarTextField.leftViewMode = .always
        searchBarTextField.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTextField
    }()
    
    func setupSearchBarTextField() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: blurredEffectView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: blurredEffectView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: textField.frame.height)
        ])
    }
    
    var bigCellView_1: UIView = {
        let bigCell = UIView(frame: CGRect(x: 30, y: 150, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()
    
    var bigCellView_2: UIView = {
       let bigCell = UIView(frame: CGRect(x: 230, y: 150, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()
    
    var bigCellView_3: UIView = {
        let bigCell = UIView(frame: CGRect(x: 30, y: 360, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()
    
    var bigCellView_4: UIView = {
        let bigCell = UIView(frame: CGRect(x: 230, y: 360, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_5: UIView = {
        let bigCell = UIView(frame: CGRect(x: 30, y: 570, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_6: UIView = {
        let bigCell = UIView(frame: CGRect(x: 230, y: 570, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_7: UIView = {
        let bigCell = UIView(frame: CGRect(x: 30, y: 780, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_8: UIView = {
        let bigCell = UIView(frame: CGRect(x: 230, y: 780, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_9: UIView = {
        let bigCell = UIView(frame: CGRect(x: 30, y: 990, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    var bigCellView_10: UIView = {
        let bigCell = UIView(frame: CGRect(x: 230, y: 990, width: 180, height: 180))
        bigCell.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        bigCell.clipsToBounds = true
        bigCell.layer.cornerRadius = bigCell.frame.height / 5
       return bigCell
    }()

    
    func setBigCellLayout() {
        
    }
    
}

