//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Lenny Cheng on 2021/1/5.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumView(scrums: DailyScrum.data)
            }
        }
    }
}
