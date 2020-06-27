//
//  ThemeController.swift
//  Theme
//
//  Created by Abdulla Alsahli on 06/11/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import UIKit

class ThemeController: UIViewController {
//MARK: creat View companant :-
    let firstLable : UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "The Theem :"
        lable.textColor = Theme.current.lableTextColor
        lable.font = UIFont(name: "AvenirNext-DemiBold", size: SizeTheem.current.textSize)
        return lable
    }()
    
    let secondLable : UILabel = {
           let lable = UILabel()
           lable.translatesAutoresizingMaskIntoConstraints = false
           lable.text = "The Size Font:"
           lable.textColor = Theme.current.lableTextColor
           lable.font = UIFont(name: "AvenirNext-DemiBold", size: SizeTheem.current.textSize)
           return lable
       }()
    
    var  themeSegmention : UISegmentedControl = {
         let segmention = UISegmentedControl(items: ["Theme1","Theme2","Theme3"])
        segmention.selectedSegmentIndex = 0
        segmention.layer.borderColor = Theme.current.segmentionColor.cgColor
        segmention.layer.borderWidth = 2
        segmention.selectedSegmentTintColor = Theme.current.segmentionColor
        segmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Theme.current.segmentionTextColor , NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.textSize)], for: .normal)
        segmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:Theme.current.segmentionSelectTextColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.selctedTextSize)], for: .selected)
        segmention.translatesAutoresizingMaskIntoConstraints = false
        segmention.addTarget(self, action: #selector(handleTheem(_:)), for: .valueChanged)
        return segmention
    }()
    
    var  sizeSegmention : UISegmentedControl = {
            let segmention = UISegmentedControl(items: ["Large","Medium","Small"])
        segmention.selectedSegmentIndex = 0
        segmention.layer.borderColor = Theme.current.segmentionColor.cgColor
        segmention.layer.borderWidth = 2
        segmention.selectedSegmentTintColor = Theme.current.segmentionColor
    
        segmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Theme.current.segmentionTextColor , NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        segmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Theme.current.segmentionSelectTextColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)], for: .selected)
           segmention.translatesAutoresizingMaskIntoConstraints = false
        segmention.addTarget(self, action: #selector(handleSize(_:)), for: .valueChanged)
           return segmention
       }()
    
    var imageView :UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Theme.current.imageName)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
        
        
    }


    func setUpView(){
        view.backgroundColor = Theme.current.viewColor
        let firstStack = UIStackView(arrangedSubviews:  [firstLable , themeSegmention])
        let secondStack = UIStackView(arrangedSubviews: [secondLable , sizeSegmention])
        view.translatesAutoresizingMaskIntoConstraints = false
        //TODO:- set up first stack :-
        firstStack.axis       = .vertical
        firstStack.alignment  = .fill
        firstStack.spacing    = 20
        view.addSubview(firstStack)
        
        firstStack.translatesAutoresizingMaskIntoConstraints
                                           = false
        firstStack.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 15).isActive                                 = true
        firstStack.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -15).isActive                  = true
        firstStack.topAnchor.constraint(equalTo: view.topAnchor , constant: 90).isActive                                         = true
        
        //TODO:- set up seconde stack :-
        secondStack.axis       = .vertical
        secondStack.alignment  = .fill
        secondStack.spacing    = 20
        view.addSubview(secondStack)
        
        
        secondStack.translatesAutoresizingMaskIntoConstraints
                                           = false
        secondStack.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 15).isActive                                = true
        secondStack.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -15).isActive                  = true
        secondStack.topAnchor.constraint(equalTo: firstStack.bottomAnchor , constant: 40).isActive                   = true
        
        //TODO:- set up ImageView stack :-
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: 130).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 370).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 610).isActive = true
    }
    
    
    @objc func handleTheem(_ sender : UISegmentedControl){
        
        
      if self.themeSegmention.selectedSegmentIndex == 0 {
        Theme.current = BlueTheme()
        } else if self.themeSegmention.selectedSegmentIndex == 1 {
            Theme.current = DarkTheme()
        
            
      } else if self.themeSegmention.selectedSegmentIndex == 2 {
        Theme.current = YallowTheme()
        }
       
      applyTheme()
    }
    
    @objc func handleSize(_ sender : UISegmentedControl){
        if self.sizeSegmention.selectedSegmentIndex == 0 {
            SizeTheem.current = LargeSize()
          } else if self.sizeSegmention.selectedSegmentIndex == 1 {
              SizeTheem.current = MediumSize()
          
              
        } else {
          SizeTheem.current = SmallSize()
          }
        applyTheme()
    }
    
}

