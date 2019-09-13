//
//  DemoView+VerticalAlignment.swift
//  WWDC_2019_237_Example
//
//  Created by guillaume MAIANO on 13/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

extension VerticalAlignment {
    private enum MidAlienAndTitle : AlignmentID {
        // Type changed since WWDC from Length to CGFloat
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.bottom]
        }
        }
        static let midAlienAndTitle = VerticalAlignment(MidAlienAndTitle.self)
}
