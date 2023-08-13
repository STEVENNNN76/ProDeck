//
//  StopWatchDIWidgetBundle.swift
//  StopWatchDIWidget
//
//  Created by Steven Luke on 8/13/23.
//

import WidgetKit
import SwiftUI

@main
struct StopWatchDIWidgetBundle: WidgetBundle {
    var body: some Widget {
        StopWatchDIWidget()
        StopWatchDIWidgetLiveActivity()
    }
}
