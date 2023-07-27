//
//  DisciplinesTVCell.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class DisciplineTVCell: UITableViewCell {
    static let identifier = "DisciplineTVCell"
    static let preferredHeight: CGFloat = 80
    
    struct Hours {
        let plannedHours: String
        let realHours: String
    }
    
    struct ViewModel {
        let disciplineName: String
        let lectureHours: Hours?
        let seminarHours: Hours?
        let labHours: Hours?
        
        init(disciplineName: String, lectureHours: Hours? = nil, seminarHours: Hours? = nil, labHours: Hours? = nil) {
            self.disciplineName = disciplineName
            self.lectureHours = lectureHours
            self.seminarHours = seminarHours
            self.labHours = labHours
        }
    }
    
    
    let leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let disciplineNameLabel = TableLabel(font: UIFont.systemFont(ofSize: 14, weight: .bold), color: .label, linesNumber: 0)

    func configure(with viewModel: ViewModel) {
        disciplineNameLabel.text = viewModel.disciplineName
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(leftView, rightView)
        leftView.addSubview(disciplineNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disciplineNameLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
        
        disciplineNameLabel.anchor(left: self.leftAnchor, right: leftView.rightAnchor, paddingLeft: 10)
        disciplineNameLabel.centerY(in: self)
    }
}
