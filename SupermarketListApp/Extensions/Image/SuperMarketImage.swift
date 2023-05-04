//
//  SuperMarketImage.swift
//  CineFlix
//
//  Created by Rodrigo Ventura on 29/03/2023.
//

import UIKit

fileprivate let bundle: Bundle = Bundle(for: SuperMarketImage.self)
public class SuperMarketImage {
    
    public static let openEyeIcon: UIImage? = UIImage(named: "openEyeIcon", in: bundle, compatibleWith: nil)
    public static let closedEyeIcon: UIImage? = UIImage(named: "closedEyeIcon", in: bundle, compatibleWith: nil)
    public static let userIcon: UIImage? = UIImage(named: "userIcon", in: bundle, compatibleWith: nil)
}
