//
//  ChatCell.swift
//  WhaleTalk
//
//  Created by Jorge Casariego on 16/3/16.
//  Copyright © 2016 Jorge Casariego. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    let messageLabel: UILabel = UILabel()
    private let bubbleImageView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(bubbleImageView)
        bubbleImageView.addSubview(messageLabel)
        
        messageLabel.centerXAnchor.constraintEqualToAnchor(bubbleImageView.centerXAnchor).active = true
        messageLabel.centerYAnchor.constraintEqualToAnchor(bubbleImageView.centerYAnchor).active = true
        
        bubbleImageView.widthAnchor.constraintEqualToAnchor(messageLabel.widthAnchor, constant: 50).active = true
        bubbleImageView.heightAnchor.constraintEqualToAnchor(messageLabel.heightAnchor).active = true
        
        bubbleImageView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true
        bubbleImageView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
        
        messageLabel.textAlignment = .Center
        messageLabel.numberOfLines = 0
        
        let image = UIImage(named: "MessageBubble")?.imageWithRenderingMode(.AlwaysTemplate)
        bubbleImageView.tintColor = UIColor.blueColor()
        bubbleImageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
