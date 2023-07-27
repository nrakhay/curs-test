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
    
    let topHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = NSLocalizedString("individualPlan", comment: "Individual Plan Strings")
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    let bottomHeaderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        
        addSubviews(topHeaderLabel, bottomHeaderLabel, bottomView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        topHeaderLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 25)
        topHeaderLabel.centerX(in: self)
        
        bottomHeaderLabel.anchor(top: topHeaderLabel.bottomAnchor)
        bottomHeaderLabel.centerX(in: self)
        
        bottomView.anchor(top: bottomHeaderLabel.bottomAnchor, bottom: self.bottomAnchor, paddingTop: 25)
        bottomView.centerX(in: self, width: self.width)
    }
}
