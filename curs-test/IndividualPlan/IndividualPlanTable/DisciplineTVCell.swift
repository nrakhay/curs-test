//
//  DisciplinesTVCell.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import UIKit

class DisciplineTVCell: UITableViewCell {
    static let identifier = "DisciplineTVCell"
    static let preferredHeight: CGFloat = 60
    
//    struct ViewModel {
//        let disciplineName: String
//        let plannedHoursLecture: Int?
//        let realHoursLecture: Int?
//        let plannedHoursSeminar: Int?
//        let realHoursSeminar: Int?
//        let plannedHoursLab: Int?
//        let realHoursLab: Int?
//
//        init(disciplineName: String,
//             plannedLecture: Int? = nil,
//             realLecture: Int? = nil,
//             plannedSeminar: Int? = nil,
//             realSeminar: Int? = nil,
//             plannedLab: Int? = nil,
//             plann
//        ) {
//
//        }
//    }
    
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
//
//    func configure(with viewModel: ViewModel) {
//        disciplineNameLabel.text = viewModel.disciplineName
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(leftView, rightView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        leftView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.4)
        
        rightView.anchor(top: self.topAnchor, left: leftView.rightAnchor, bottom: self.bottomAnchor, width: WindowDimensions.width * 0.6)
    }
}
