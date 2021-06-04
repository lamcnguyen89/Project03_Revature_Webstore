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
    let prodData: Product?

  func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerAsUIView>) -> UIViewController {

    //Load the storyboard
    let loadedStoryboard = UIStoryboard(name: storyboard, bundle: nil)

    //Load the ViewController based on passed in string
    let controller = loadedStoryboard.instantiateViewController(withIdentifier: VC)

    //attempt downcast
    if let controller = controller as? ProductDetailViewController{
        let viewModel = ProductViewModel(product: prodData!)
        controller.prodViewModel = viewModel
    }
    return controller

  }

  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewControllerAsUIView>) {
  }
}
