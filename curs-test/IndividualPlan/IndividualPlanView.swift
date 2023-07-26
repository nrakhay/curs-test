//
//  IndividualPlanView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

final class IndividualPlanView: UIView {
    
    let backBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: SFConstants.backButton), style: .plain, target: nil, action: nil)
        button.tintColor = .label
        return button
    }()
    
    let downloadBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: SFConstants.downloadButton), style: .plain, target: nil, action: nil)
        button.tintColor = .label
        return button
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
    }
}
