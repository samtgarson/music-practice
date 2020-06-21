//
//  TheoryScreen.swift
//  music-practice
//
//  Created by Sam Garson on 31/05/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct TheoryScreen: View {
  var body: some View {
    PageView {
      PageTitle("Theory")
      SectionTitle(text: "Scales")
        .padding(.bottom, Spacing.small)
      TheoryAction(.Scale)
      
    }
  }
}

struct TheoryScreen_Previews: PreviewProvider {
  static var previews: some View {
    TheoryScreen()
  }
}
