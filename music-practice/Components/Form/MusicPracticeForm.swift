//
//  MusicPracticeForm.swift
//  music-practice
//
//  Created by Sam Garson on 03/06/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct MusicPracticeForm<Fields: View>: View {
  var buttonLabel: String = "Let's go"
  var onSubmit: ((FormModel) -> Void)?
  var content: Fields
  @ObservedObject var state = FormService()
  
  internal init(onSubmit: ((FormModel) -> Void)? = nil, @ViewBuilder content: () -> Fields) {
    self.content = content()
    self.onSubmit = onSubmit
  }
  
  var body: some View {
    VStack(spacing: Spacing.medium) {
      content.environmentObject(state)
      MusicPracticeButton(buttonLabel, onTap: self.onTap)
    }
  }
  
  func onTap () {
    if let handler = onSubmit { handler(state.model) }
  }
}

struct MusicPracticeForm_Previews: PreviewProvider {
  static var previews: some View {
    func onSubmit (model: FormModel) { dump(model) }
    
    return ModalView(description: "Test this form") {
      MusicPracticeForm(onSubmit: onSubmit) {
        MusicPracticeTextField(id: "test", placeholder: "This is a text field", required: true)
      }
    }
  }
}
