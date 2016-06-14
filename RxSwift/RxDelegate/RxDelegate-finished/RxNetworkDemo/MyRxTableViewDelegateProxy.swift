//
//  MyRxTableViewDelegateProxy.swift
//  RxNetworkDemo
//
//  Created by Mars on 6/13/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MyRxTableViewDelegateProxy
:DelegateProxy
,UITableViewDelegate
,DelegateProxyType {
    // Methods in DelegateProxyType
    
    // How to get the native delegate object
    static func currentDelegateFor(object: AnyObject) -> AnyObject? {
        let tableView = object as! UITableView
        return tableView.delegate
    }
    
    // Set delegate proxy
    static func setCurrentDelegate(delegate: AnyObject?, toObject object: AnyObject) {
        let tableView = object as! UITableView
        tableView.delegate = delegate as? UITableViewDelegate
    }
}

private extension Selector {
    static let didSelectRowAtIndexPath = #selector(UITableViewDelegate.tableView(_:didSelectRowAtIndexPath:))
}

extension UITableView {
    var rxDelegate: MyRxTableViewDelegateProxy {
        return MyRxTableViewDelegateProxy.proxyForObject(self)
    }

    var rxDidSelectRowAtIndexPath: Observable<(UITableView, NSIndexPath)> {
        return rxDelegate.observe(.didSelectRowAtIndexPath).map{ paramArray in
            return (paramArray[0] as! UITableView, paramArray[1] as! NSIndexPath)
        }
    }
}


























