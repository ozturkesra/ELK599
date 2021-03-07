//
//  Extension+UITableView.swift
//  Maksmart
//
//  Created by Uygar İŞİÇELİK on 26.08.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func setEmptyView(viewController: UIViewController) {
        var emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: viewController.view.bounds.width, height: viewController.view.bounds.height))
        emptyLabel.text = "no_record".localized()
        emptyLabel.font = UIFont(name: "Roboto-Regular", size: 17)
        emptyLabel.textColor = UIColor(named: "primaryColor")
        emptyLabel.textAlignment = NSTextAlignment.center
        self.backgroundView = emptyLabel
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.alwaysBounceVertical = false;
    }
}

