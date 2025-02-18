//
//  UIKit+Extensions.swift
//  kkuduck
//
//  Created by 홍다희 on 2021/11/04.
//

import UIKit

extension UIColor {

    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }

    static var primary: UIColor? { return UIColor(named: "primary") }
    static var secondary: UIColor? { return UIColor(named: "secondary") }
    static var random: UIColor {
            let r:CGFloat  = .random(in: 0...1)
            let g:CGFloat  = .random(in: 0...1)
            let b:CGFloat  = .random(in: 0...1)
            return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
