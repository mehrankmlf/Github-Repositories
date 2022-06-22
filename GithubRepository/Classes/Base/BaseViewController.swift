//
//  BaseViewController.swift
//  GithubRepository
//
//  Created by Mehran on 3/25/1401 AP.
//

import UIKit
import Combine

protocol ShowEmptyStateProtocol : AnyObject {
    func showEmptyStateView(title: String?, errorType: EmptyStateErrorType, isShow : Bool)
}

class BaseViewController: UIViewController {
    
    var bag = Set<AnyCancellable>()
    var delegate : ShowEmptyStateProtocol?
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
}

extension BaseViewController {
    /*
        Show customized activity indicator,
        actually add activity indicator to passing view
    
        @param uiView - add activity indicator to this view
    */
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(rgbValue: 0xffffff, alpha: 0.3)
    
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(rgbValue: 0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
    
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.medium
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);

        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }

    /*
        Hide activity indicator
        Actually remove activity indicator from its super view
    
        @param uiView - remove activity indicator from this view
    */
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

    /*
        Define UIColor from hex value
        
        @param rgbValue - hex color value
        @param alpha - transparency level
    */
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}

extension BaseViewController {
     func setViewState(state : ViewModelStatus, viewContainer : UIView) {
        switch state {
        case .loadStart:
            self.self.showActivityIndicator(uiView: self.view)
        case .dismissAlert:
            self.hideActivityIndicator(uiView: self.view)
        case .emptyStateHandler(let title, let isShow):
            self.delegate?.showEmptyStateView(title: title, errorType: .serverError, isShow: isShow)
        }
    }
}
