//
//  TableViewCell.swift
//  QTable
//
//  Created by Myca Miralles on 3/18/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    //@IBOutlet var questionLabel: PaddingLabel!
    @IBOutlet weak var titleLabel: PaddingLabel!
    @IBOutlet var detailsLabel: PaddingLabel!
    @IBOutlet var answerLabelHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        titleLabel.paddingLeft = 15
        titleLabel.paddingRight = 15
        titleLabel.paddingTop = 50
        titleLabel.paddingBottom = 50
        detailsLabel.paddingLeft = 15
        detailsLabel.paddingRight = 15
    }
    
    func set(content: DataModel, state: Bool) {
        //self.questionLabel.text = content.question
        titleLabel.text = "Title"
        //guard let stringHeight = content.marketPrice?.height(width: self.detailsLabel.frame.width - (self.detailsLabel.paddingLeft + self.detailsLabel.paddingRight), font: .systemFont(ofSize: 17, weight: .regular)) else { return }
        let stringHeight = 200
        if state == true {
            self.detailsLabel.text = content.answer//content.make
            detailsLabel.paddingTop = 8
            detailsLabel.paddingBottom = 8
            answerLabelHeight.constant = CGFloat(stringHeight) + detailsLabel.paddingTop + detailsLabel.paddingBottom
        } else {
            self.detailsLabel.text = ""
            detailsLabel.paddingTop = 0
            detailsLabel.paddingBottom = 0
            answerLabelHeight.constant = 0
        }
        layoutIfNeeded()
    }
}

