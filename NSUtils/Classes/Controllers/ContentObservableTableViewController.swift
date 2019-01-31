//
//  ContentObservableTableViewController.swift
//  NSUtils
//
//  Created by Alex on 1/31/19.
//  Copyright © 2019 Netsells. All rights reserved.
//

import UIKit

public class ContentObservableTableViewController: UITableViewController {
    
    private var contentSizeObserver: NSKeyValueObservation?
    
    deinit {
        contentSizeObserver = nil
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        contentSizeObserver = tableView.observe(\.contentSize, changeHandler: { [unowned self] (tableView, _ ) in
            self.contentSizeDidChange(tableView.contentSize)
        })
    }
    
    public func contentSizeDidChange(_ size: CGSize) {
        fatalError("contentSizeDidChange - Default implementation must be overridden")
    }

}
