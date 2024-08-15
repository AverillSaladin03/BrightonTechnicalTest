//
//  ScreenInformation.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct ScreenInformation {
    
    static let shared  = ScreenInformation()
    
    private var screenHeight = UIScreen.main.bounds.height
    private var screenWidth = UIScreen.main.bounds.width
    
    func getScreenHeight() -> CGFloat {
        return screenHeight
    }
    
    func getScreenWidth() -> CGFloat {
        return screenWidth
    }
    
}
