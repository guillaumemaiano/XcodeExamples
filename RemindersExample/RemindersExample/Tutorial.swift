//
//  Tutorial.swift
//  RemindersExample
//
//  Created by guillaume MAIANO on 19/09/2019.
//  Copyright © 2019 guillaume MAIANO. All rights reserved.
//

import SwiftUI

enum TutorialSteps {
    case permissions
}
struct Tutorial: View {
    @State var isRemindersAccessible: Bool = false
    var step: TutorialSteps
    var body: some View {
        VStack {
            Spacer()
            Text("I need access to stuff").font(.headline)
            Spacer()
        Button (action: {
//            EventManager.askPermissions(handler: {isSuccess, error in
//                self.isRemindersAccessible = isSuccess
//                if let e = error {
//                    print("Permission set failure: \(e)")
//                }
//            })
        }) {
            Text("allow").font(.largeTitle)
        }
        }
    }
}

struct Tutorial_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial(step: .permissions)
    }
}
