//
//  SwiftUIView.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import SwiftUI
import UIKit

struct ViewControllerAsUIView: UIViewControllerRepresentable {
    let storyboard: String
    let VC: String

  func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerAsUIView>) -> UIViewController {

    //Load the storyboard
    let loadedStoryboard = UIStoryboard(name: storyboard, bundle: nil)

    //Load the ViewController
    return loadedStoryboard.instantiateViewController(withIdentifier: VC)
    
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewControllerAsUIView>) {
  }
}
