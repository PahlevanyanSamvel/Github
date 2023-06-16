//
//  BaseVC.swift
//  Github
//
//  Created by Samvel Pahlevanyan on 14.06.23.
//

import UIKit

class BaseVC: UIViewController {
  var baseVM: BaseViewModeling!

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  init(viewModel: BaseViewModeling? = nil) {
    super.init(nibName: Self.className, bundle: nil)
    if let viewModel = viewModel {
      baseVM = viewModel
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupBindings()
  }

  func setupBindings() {}
}
