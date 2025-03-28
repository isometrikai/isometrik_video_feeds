//
//  IVSPreviewManager.swift
//  Isometrik_Video_Feeds
//
//  Created by 3embed on 07/01/25.
//

import Foundation
import SwiftUI
import UIKit

struct IVSPreviewViewcontrollers : UIViewControllerRepresentable {
    let viewBuilder: () -> UIViewController
    
    init(viewBuilder: @escaping () -> UIViewController) {
        self.viewBuilder = viewBuilder
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        viewBuilder()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        //
    }
}

struct IVSPreviewViews : UIViewRepresentable {
    let viewBuilder: () -> UIView
    
    init(viewBuilder: @escaping () -> UIView) {
        self.viewBuilder = viewBuilder
    }
  
    func makeUIView(context: Context) -> some UIView {
        viewBuilder()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
}
