//
//  ShareViewController.swift
//  PostShareExtension
//
//  Created by Junhyeon on 2019/12/28.
//  Copyright © 2019 Junhyeon. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices
import CoreData

class ShareViewController: SLComposeServiceViewController, CategoryViewProtocol{

    var shareIdentifier = "group.com.flood.share"
    var selectedImage: UIImage!
    var maxCharacterSize = 100
    
    var item: SLComposeSheetConfigurationItem!
    var CategoryPickerVC: CategoryTableViewController!

      override func isContentValid() -> Bool {
          // Do validation of contentText and/or NSExtensionContext attachments here
          return true
      }

      override func didSelectPost() {
          // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.

          // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
          self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
      }

    override func configurationItems() -> [Any]! {
      self.item = SLComposeSheetConfigurationItem()

      self.item.title = "Category"
      self.item.value = "None"

      self.item.tapHandler = {
       // self.categoryPickerVC = CategoryTableViewController()
       // self.pushConfigurationViewController(self.categoryPickerVC)
      }

      return [self.item]
    }

    func sendingViewController(viewController: CategoryTableViewController, sentItem: String) {
      self.item.value = sentItem
      self.popConfigurationViewController()
    }


}
