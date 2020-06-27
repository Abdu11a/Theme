//
//  ThemeRecolor.swift
//  Theme
//
//  Created by Abdulla Alsahli on 06/11/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import UIKit

extension ThemeController{
     func applyTheme(){
       view.backgroundColor = Theme.current.viewColor
        firstLable.textColor = Theme.current.lableTextColor
        firstLable.font = UIFont(name: "AvenirNext-DemiBold", size: SizeTheem.current.textSize)
        secondLable.textColor = Theme.current.lableTextColor
        secondLable.font = UIFont(name: "AvenirNext-DemiBold", size: SizeTheem.current.textSize)
        
        themeSegmention.layer.borderColor = Theme.current.segmentionColor.cgColor
        themeSegmention.selectedSegmentTintColor = Theme.current.segmentionColor
        themeSegmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Theme.current.segmentionTextColor , NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.textSize)], for: .normal)
        
       themeSegmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:Theme.current.segmentionSelectTextColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.selctedTextSize)], for: .selected)
        
        sizeSegmention.layer.borderColor = Theme.current.segmentionColor.cgColor
         sizeSegmention.selectedSegmentTintColor = Theme.current.segmentionColor
         sizeSegmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Theme.current.segmentionTextColor , NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.textSize)], for: .normal)
         
        sizeSegmention.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:Theme.current.segmentionSelectTextColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: SizeTheem.current.selctedTextSize)], for: .selected)
        
        imageView.image = UIImage(named: Theme.current.imageName)
         
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        applyTheme()
    }
     
}
