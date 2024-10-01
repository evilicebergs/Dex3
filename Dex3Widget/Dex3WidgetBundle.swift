//
//  Dex3WidgetBundle.swift
//  Dex3Widget
//
//  Created by Artem Golovchenko on 2024-10-01.
//

import WidgetKit
import SwiftUI

@main
struct Dex3WidgetBundle: WidgetBundle {
    var body: some Widget {
        Dex3Widget()
        Dex3WidgetControl()
        Dex3WidgetLiveActivity()
    }
}
