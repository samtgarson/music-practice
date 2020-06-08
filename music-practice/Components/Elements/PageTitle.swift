//
//  PageTitle.swift
//  music-practice
//
//  Created by Sam Garson on 05/06/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct PageTitle: View {
  var content: String
  var showBack: Bool
  var onBack: () -> Void
  
  init(_ content: String, showBack: Bool = false, onBack: (() -> Void)? = nil) {
    self.content = content
    self.showBack = showBack
    self.onBack = onBack ?? {}
  }
  
  var body: some View {
//    Sticky { _ in
    HStack {
      if self.showBack { self.backButton }
      Text(self.content)
        .font(Fonts.large)
    }
      //    }
      .padding(.bottom, Spacing.medium)
  }
  
  private var backButton: some View {
    Icon(iconName: .chevronLeft)
      .onTapGesture(perform: onBack)
  }
}

struct PageTitle_Previews: PreviewProvider {
  static var previews: some View {
    PageView() {
      PageTitle("Theory")
      SectionTitle(text: "Testing")
      RoundedRectangle(cornerRadius: CornerRadius).stroke(Colors.primary).frame(height: 1200)
    }
  }
}