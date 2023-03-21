//
//  Consstants.swift
//  online_shop
//
//  Created by Nor1 on 13.03.2023.
//

import Foundation
import UIKit

enum Constants {
    enum Color {
        static var background_white: UIColor? {
            UIColor(named: "background_white")
        }
        static var black: UIColor? {
            UIColor(named: "black")
        }
        static var gray: UIColor? {
            UIColor(named: "gray")
        }
        static var light_black: UIColor? {
            UIColor(named: "light_black")
        }
        static var light_gray: UIColor? {
            UIColor(named: "light_gray")
        }
        static var violet: UIColor? {
            UIColor(named: "violet")
        }
        static var white: UIColor? {
            UIColor(named: "white")
        }
        static var red: UIColor? {
            UIColor(named: "red")
        }
        static var gray_category: UIColor? {
            UIColor(named: "gray_category")
        }
        static var gray_textfield: UIColor? {
            UIColor(named: "gray_textfield")
        }
        static var violet_button: UIColor? {
            UIColor(named: "violet_button")
        }
        static var gray_button: UIColor? {
            UIColor(named: "gray_button")
        }
    }
    enum Font {
        static var navigationTitle: UIFont? {
            UIFont(name: "Montserrat-Bold", size: 20)
        }
        static var categoriesTitle8: UIFont? {
            UIFont(name: "Poppins-Medium", size: 8)
        }
        
        static var buttonHeader9: UIFont? {
            UIFont(name: "Poppins-Medium", size: 9)
        }
        static var titleHeader15: UIFont? {
            UIFont(name: "Poppins-Medium", size: 15)
        }
        static var mainTextField: UIFont? {
            UIFont(name: "Poppins-Regular", size: 9)
        }
        
        static var latestCategory6: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 6)
        }
        static var latestTitle9: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 9)
        }
        static var latestPrice7: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 7)
        }
        
        static var flashSaleTitle13: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 13)
        }
        static var flashSalePrice10: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 10)
        }
        static var flashSaleCategory9: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 9)
        }
        static var flashSalePriceOff10: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 10)
        }
        
        static var signinTitle26: UIFont? {
            UIFont(name: "Montserrat-SemiBold", size: 26)
        }
        static var signinTextField11: UIFont? {
            UIFont(name: "Montserrat-Medium", size: 11)
        }
        static var signinButton14: UIFont? {
            UIFont(name: "Montserrat-Bold", size: 14)
        }
        static var signinText: UIFont? {
            UIFont(name: "Montserrat-Medium", size: 10)
        }
        static var signinButtonsVIA12: UIFont? {
            UIFont(name: "Montserrat-Medium", size: 12)
        }
        
        static var profileName15: UIFont? {
            UIFont(name: "Montserrat-Bold", size: 15)
        }
        static var profileButton14: UIFont? {
            UIFont(name: "Montserrat-SemiBold", size: 14)
        }
        static var profileCell14: UIFont? {
            UIFont(name: "Montserrat-Medium", size: 14)
        }
        static var profileChangeButton8: UIFont? {
            UIFont(name: "Montserrat-Medium", size: 8)
        }
        
        static var location10: UIFont? {
            UIFont(name: "Poppins-Regular", size: 10)
        }
        
        static var descriptionTitle17: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 17)
        }
        static var descriptionPrice13: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 13)
        }
        static var descriptionText9: UIFont? {
            UIFont(name: "Poppins-Regular", size: 9)
        }
        static var descriptionRaiting9: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 9)
        }
        static var descriptionViews9: UIFont? {
            UIFont(name: "Poppins-Regular", size: 9)
        }
        static var descriptionHeader10: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 10)
        }
        static var descriptionQuantity9: UIFont? {
            UIFont(name: "Poppins-Medium", size: 9)
        }
        static var descriptionButton8: UIFont? {
            UIFont(name: "Poppins-SemiBold", size: 8)
        }
        
    }
    enum Image {
        static var cars: UIImage? {
            UIImage(named: "cars")
        }
        static var cart: UIImage? {
            UIImage(named: "cart")
        }
        static var favorite: UIImage? {
            UIImage(named: "favorite")
        }
        static var furniture: UIImage? {
            UIImage(named: "furniture")
        }
        static var games: UIImage? {
            UIImage(named: "games")
        }
        static var headphones: UIImage? {
            UIImage(named: "headphones")
        }
        static var home: UIImage? {
            UIImage(named: "home")
        }
        static var kids: UIImage? {
            UIImage(named: "kids")
        }
        static var message: UIImage? {
            UIImage(named: "message")
        }
        static var phones: UIImage? {
            UIImage(named: "phones")
        }
        static var profile: UIImage? {
            UIImage(named: "profile")
        }
        
        static var background: UIImage? {
            UIImage(named: "backgroundtest")
        }
        static var background1: UIImage? {
            UIImage(named: "backgroundtest-1")
        }
        static var background2: UIImage? {
            UIImage(named: "backgroundtest-2")
        }
        static var background3: UIImage? {
            UIImage(named: "backgroundtest-3")
        }
        static var background4: UIImage? {
            UIImage(named: "backgroundtest-4")
        }
        
        static var circle_plus: UIImage? {
            UIImage(named: "circle_plus")
        }
        static var circle_fav: UIImage? {
            UIImage(named: "circle_fav")
        }
        static var brand: UIImage? {
            UIImage(named: "brand")
        }
        static var small_plus: UIImage? {
            UIImage(named: "small_plus")
        }
        
        static var google: UIImage? {
            UIImage(named: "google")
        }
        static var apple: UIImage? {
            UIImage(named: "apple")
        }
        
        static var folder: UIImage? {
            UIImage(named: "folder")
        }
        static var help: UIImage? {
            UIImage(named: "help")
        }
        static var logout: UIImage? {
            UIImage(named: "logout")
        }
        static var profileimage: UIImage? {
            UIImage(named: "profileimage")
        }
        static var recicle: UIImage? {
            UIImage(named: "recicle")
        }
        static var upload: UIImage? {
            UIImage(named: "upload")
        }
        static var vector: UIImage? {
            UIImage(named: "vector")
        }
        static var tabbar_background: UIImage? {
            UIImage(named: "tabbar_background")
        }
        
        static var lens: UIImage? {
            UIImage(named: "lens")
        }
        static var hidden: UIImage? {
            UIImage(named: "hidden")
        }
        
        static var vector_down: UIImage? {
            UIImage(named: "vector_down")
        }
        
        static var favButton: UIImage? {
            UIImage(named: "favButton")
        }
        static var shareButton: UIImage? {
            UIImage(named: "shareButton")
        }
        static var lineButton: UIImage? {
            UIImage(named: "line")
        }
        
        static var star: UIImage? {
            UIImage(named: "star")
        }
        static var vector_back: UIImage? {
            UIImage(named: "vector_back")
        }
        static var menu: UIImage? {
            UIImage(named: "menu")
        }
    }
}
