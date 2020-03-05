//
//  Storyboard+initViewController.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import UIKit

public enum StoryboardInstantiateType {
    case initial
    case identifier(String)
}

public protocol StoryboardInstantiatable {
    static var storyboardName: UIStoryboard.Name { get }
    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryboardInstantiateType { get }
}

public extension StoryboardInstantiatable where Self: NSObject {
    static var storyboardName: UIStoryboard.Name {
        if let storyboard = UIStoryboard.Name(rawValue: className){
            return storyboard
        }
        else { fatalError("\(#function) has not stroyboard with name \(className)")}
    }

     static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }

    private static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName.rawValue, bundle: storyboardBundle)
    }

     static var instantiateType: StoryboardInstantiateType {
        return .identifier(className)
    }
}


public extension StoryboardInstantiatable where Self: UIViewController {
     static func instantiate() -> Self {
        switch instantiateType {
        case .initial:
            return storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
    }
}
