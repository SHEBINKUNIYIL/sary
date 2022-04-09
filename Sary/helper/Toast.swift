//
//  Toast.swift
//  Sary
//
//  Created by EdfaPay on 09/04/2022.
//

import Foundation
import UIKit
class Toast {

    func show(message: String, font: UIFont = .boldSystemFont(ofSize: 15)) {
     
        
    DispatchQueue.main.async {
        if let viewcontroller = self.getController(){
    let toastLabel = UILabel()
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = .white
    toastLabel.font = font
    toastLabel.textAlignment = .center
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10
    toastLabel.clipsToBounds = true
    
    let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: viewcontroller.view.bounds.size.width * maxWidthPercentage, height: viewcontroller.view.bounds.size.height * maxWidthPercentage)
    var titleSize = toastLabel.sizeThatFits(maxTitleSize)
    titleSize.width += 20
    titleSize.height += 10
        toastLabel.frame = CGRect(x: viewcontroller.view.frame.size.width / 2 - titleSize.width / 2, y: viewcontroller.view.frame.size.height - 50, width: titleSize.width, height: titleSize.height)
    
            viewcontroller.view.addSubview(toastLabel)

    UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: { _ in
        toastLabel.removeFromSuperview()
    })
        }
    }
        
}
    func getController()->UIViewController?{
        if #available(iOS 13.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as! UIWindowScene
            let sharedAppDelegate = windowScene.delegate as! SceneDelegate
            if let viewController = sharedAppDelegate.window?.rootViewController as? UIViewController{
                return viewController

            }
        } else {
            if let sharedAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            if let viewController = sharedAppDelegate.window?.rootViewController as? UIViewController{
                return viewController
            }
            }
        }
        return nil
    
    }
}
