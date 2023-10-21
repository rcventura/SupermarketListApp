//
//  LoadingView.swift
//  SupermarketListApp
//
//  Created by Rodrigo Ventura on 01/08/23.
//

import UIKit

final class LoadingView: UIView {
    
    let loadingView = UIActivityIndicatorView()
    
    init() {
        super.init(frame: .zero)
        addLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addLoadingView() {
        loadingView.hidesWhenStopped = true
        loadingView.color = .red
        loadingView.center = self.center
        loadingView.style = .medium
        self.addSubview(loadingView)
    }
}

extension LoadingView {
    private func addLayout() {
        backgroundColor = SMColor.black.withAlphaComponent(0.7)
        addLoadingView()
    }
}
