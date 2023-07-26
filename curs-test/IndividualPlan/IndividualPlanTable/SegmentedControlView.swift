//
//  IndividualPlanSCView.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class SegmentedControlView: UIView {
    let selector: UISegmentedControl = {
        let control = UISegmentedControl()
        return control
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(DisciplineTVCell.self, forCellReuseIdentifier: DisciplineTVCell.identifier)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .secondarySystemBackground
        return table
    }()
    
    let topTableHeaderView = TopTableHeaderView()
    let bottomTableHeaderView = BottomTableHeaderView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .secondarySystemBackground
        addSubviews(selector, topTableHeaderView, bottomTableHeaderView, tableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selector.anchor(top: self.topAnchor, width: self.width, height: 50)
        selector.centerX(in: self)
        
        topTableHeaderView.anchor(top: selector.bottomAnchor, width: self.width, height: 40)
        topTableHeaderView.centerX(in: self)
        
        bottomTableHeaderView.anchor(top: topTableHeaderView.bottomAnchor, width: self.width, height: 60)
        bottomTableHeaderView.centerX(in: self)
        
        tableView.anchor(top: bottomTableHeaderView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, width: self.width)
    }

}
