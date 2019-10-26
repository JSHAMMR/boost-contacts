//
//  GeneralRoute.swift
//  Contacts
//
//  Created by Gamil Ali Qaid Shamar on 27/10/2019.


import Foundation
import UIKit

enum GeneralRoute: IRouter {
    /*
     If you want passing with parameters
     you just add like this:
     
     case sample
     case sample(parameter: [String: Any])
     
     you can use: String, Int, [String: Any], etc..
     */
    
    
    case contacts
    case detail(parameter:[String:Any])
}

extension GeneralRoute {
    var module: UIViewController? {
        /*
         Setup module with parameters like:
         
         switch self {
         case .sample:
         return SampleConfiguration.setup()
         case .sample(let parameters):
         return SampleConfiguration.setup(parameters: parameters)
         }
         
         */
        
        switch self {
        case .contacts:
            return ContactsConfiguration.setup()
        case .detail(let parameter):
            return DetailsConfiguration.setup(parameters:parameter)
        }
        
    }
}

