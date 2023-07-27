//
//  TableHeaderView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class TopTableHeaderView: UIView {
    let leftView = UIView()
    
    let rightView = UIView()

    let rightViewLabel = TableLabel(text: NSLocalizedString("classroomClasses", comment: "Individual Plan Strings"),
                                    font: UIFont.systemFont(ofSize: 14),
                                    color: .systemGray)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        addSubviews(leftView, rightView)
        rightView.addSubview(rightViewLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
        
        rightViewLabel.center(in: rightView, in: rightView)
    }

}
