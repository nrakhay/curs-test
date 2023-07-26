//
//  TableLabel.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class TableLabel: UILabel {
    var labelText: String? {
        didSet {
            self.text = labelText
        }
    }
    
    var labelFont: UIFont? {
        didSet {
            self.font = labelFont
        }
    }
    
    var labelColor: UIColor? {
        didSet {
            self.textColor = labelColor
        }
    }
    
    private func setupLabel() {
        self.text = labelText
        self.font = labelFont
        self.textColor = labelColor
    }
    
    init(text: String? = nil, font: UIFont? = nil, color: UIColor? = nil, linesNumber: Int? = 1) {
        super.init(frame: .zero)
        
        self.labelText = text
        self.labelFont = font
        self.labelColor = color
        
        if let num = linesNumber {
            self.numberOfLines = num
        }
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
