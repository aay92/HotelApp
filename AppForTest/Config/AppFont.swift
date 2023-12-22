//
//  AppFont.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

struct AppFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "SF Pro Display", size: size) ?? .systemFont(ofSize: size)
    }
//    static func bold(ofSize size: CGFloat) -> UIFont {
//        return UIFont(name: "SF Pro Display-Bold", size: size) ?? .systemFont(ofSize: size)
//    }
}
