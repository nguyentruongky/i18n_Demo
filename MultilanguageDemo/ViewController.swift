//
//  ViewController.swift
//  MultilanguageDemo
//
//  Created by Ky Nguyen Coinhako on 3/29/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var vietnameseButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vietnameseButton.addTarget(self, action: #selector(handleChangeToVi), for: .touchUpInside)
        englishButton.addTarget(self, action: #selector(handleChangeToEn), for: .touchUpInside)
        
        handleChangeToEn()
    }
    
    @objc func handleChangeToEn() {
        knI18n.shared.setLanguage("en")
        refreshUI()
    }
    
    @objc func handleChangeToVi() {
        knI18n.shared.setLanguage("vi")
        refreshUI()
    }
    
    func refreshUI() {
        languageLabel.text = "lang".i18n
        helloLabel.text = "hello".i18n
        vietnameseButton.setTitle("change_vi".i18n, for: .normal)
        englishButton.setTitle("change_en".i18n, for: .normal)
    }

}

