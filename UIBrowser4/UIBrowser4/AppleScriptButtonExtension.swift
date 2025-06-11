//
//  AppleScriptButtonExtension.swift
//  UIBrowser3
//
//  Created by Bill Cheeseman on 2019-04-18.
//  Copyright © 2019-2020 PFiddlesoft. All rights reserved.
//

import Cocoa

/**
 The AppleScriptButtonExtension.swift file implements an extension on MasterSplitItemViewController dedicated to UI Browser's Generate AppleScript button.
 */
extension MasterSplitItemViewController {
    
    // MARK: - PRIVATE METHODS
    
    /**
     Returns the full AppleScript description of the currently selected element.
     
     - returns: The full AppleScript description as an NSAttributedString, or nil if no element is selected.
     */
    private func currentElementAppleScriptDescription() -> NSAttributedString? {
        // Get the current element from the data model
        guard let currentElement = ElementDataModel.sharedInstance.currentElement else {
            return nil
        }
        
        // Get the full AppleScript description
        return ElementDataModel.sharedInstance.fullAppleScriptDescription(ofElement: currentElement)
    }
    
    // MARK: - ACTION METHODS
    
    /**
     Generates an AppleScript statement when the user choose a menu item in the Generate AppleScript pop-up button.
     
     - note: The equivalent UI Browser 2 method is \-\[PFBrowserController generateAppleScriptAction:\].
     
     - parameter sender: The Generate AppleScript pop-up button that sent the action.
     */
    @IBAction func generateAppleScript(_ sender: NSButton) {
        // Action method connected from the Generate AppleScript pop-up button to First Responder in Main.storyboard.
        
        // Get the AppleScript description of the currently selected element
        guard let appleScriptDescription = currentElementAppleScriptDescription() else {
            // No element is currently selected
            NSBeep()
            return
        }
        
        // Copy the AppleScript description to the clipboard
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(appleScriptDescription.string, forType: .string)
    }
    
}
