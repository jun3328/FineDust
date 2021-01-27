//
//  ViewController.swift
//  FineDust
//
//  Created by lee on 2021/01/27.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var dustInfo: UILabel = { () -> UILabel in
        let label = UILabel()
        label.text = "asdasdf"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(dustInfo)
        
        NSLayoutConstraint.activate([
            dustInfo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            dustInfo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            dustInfo.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            dustInfo.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
        
        viewModel.getFineDust(versionCode: 1, lat: 37.566536, lon: 126.977966)
    }
}

