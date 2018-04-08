//
//  i18nCenter.swift
//  MultilanguageDemo
//
//  Created by Ky Nguyen Coinhako on 3/29/18.
//  Copyright © 2018 kynguyen. All rights reserved.
//

import Foundation

class knI18n {
    static let shared = knI18n()
    
    private let knCurrentLanguageKey = "knCurrentLanguageKey"
    private let fileNameBase = "Lang_"
    lazy var localizableDictionary: NSDictionary! = self.getLanguageFile()
    func getLanguageFile() -> NSDictionary {
        let language = currentLanguage ?? "en"
        if let path = Bundle.main.path(forResource: fileNameBase + language, ofType: "plist") {
            return NSDictionary(contentsOfFile: path)!
        }
        fatalError("Localizable file NOT found")
    }
    
    func localize(string: String) -> String {
        guard let localizedString = localizableDictionary.value(forKeyPath: string) as? String else { return string }
        return localizedString
    }
    
    func setLanguage(_ language: String) {
        currentLanguage = language
        localizableDictionary = getLanguageFile()
    }
    
    private var currentLanguage: String? {
        get { return UserDefaults.standard.value(forKeyPath: knCurrentLanguageKey) as? String }
        set { UserDefaults.standard.setValue(newValue, forKeyPath: knCurrentLanguageKey) }
    }
}

extension String {
    var i18n: String {
        return knI18n.shared.localize(string: self)
    }
}





