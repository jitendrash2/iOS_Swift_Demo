//
//  Extensions.swift
//  Swift iOS Demo
//
//  Created by Jitendra on 01/07/25.
//
import UIKit
import Foundation

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor.flatMap { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var isExclusiveTouch: Bool {
        get {
            return self.isExclusiveTouch
        }
        set {
            self.isExclusiveTouch = newValue
        }
    }
    
    func isHiddenFromUserInterface() -> Bool {
        return !isHidden && alpha == 0
    }
    
    func delay(delay:Double, closer:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closer()
        }
    }
}


extension UILabel {
    func setLineSpacing(_ spacing: CGFloat) {
        guard let text = text else { return }
        
        let attributedText = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
    }
    
    func addCheckMark(color: UIColor = .black) {
        let attrString = NSMutableAttributedString(string: "◯")
        attrString.addAttributes([
            .font: UIFont.systemFont(ofSize: 12),
            .foregroundColor: color
        ], range: NSRange(location: 0, length: 1))
        
        attributedText = attrString
    }
    
    func addCharacterSpacing(value:Double = 1.15) {
        if let text = text {
            
        }
    }
    
}


