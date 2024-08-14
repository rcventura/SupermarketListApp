//
//  SuperMarketImage.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

fileprivate let bundle: Bundle = Bundle(for: SMImage.self)
public class SMImage {
    public static let openEyeIcon: UIImage? = UIImage(named: "openEyeIcon", in: bundle, compatibleWith: nil)
    public static let closedEyeIcon: UIImage? = UIImage(named: "closedEyeIcon", in: bundle, compatibleWith: nil)
    public static let userIcon: UIImage? = UIImage(named: "userIcon", in: bundle, compatibleWith: nil)
    public static let closeIcon: UIImage? = UIImage(systemName: "xmark.circle")
    public static let addIcon: UIImage? = UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate)
    public static let deleteIcon: UIImage? = UIImage(systemName: "trash")?.withRenderingMode(.alwaysTemplate)
    public static let unSelectedIcon: UIImage? = UIImage(named: "RadioButtonIcon", in: bundle, compatibleWith: nil)
    public static let selectedIcon: UIImage? = UIImage(named: "RadioButtonIconSelected", in: bundle, compatibleWith: nil)
    
    //MARK: Add Shopping List
    public static let addShoppingImage: UIImage? = UIImage(named: "compras2", in: bundle, compatibleWith: nil)
}
