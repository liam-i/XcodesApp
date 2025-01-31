//
//  InfoPaneControls.swift
//  Xcodes
//
//  Created by Duong Thai on 14/10/2023.
//  Copyright © 2023 Robots and Pencils. All rights reserved.
//

import SwiftUI

struct InfoPaneControls: View {
    let xcode: Xcode

    var body: some View {
        VStack (alignment: .leading) {
            switch xcode.installState {
            case .notInstalled:
                NotInstalledStateButtons(
                    downloadFileSizeString: xcode.downloadFileSizeString,
                    id: xcode.id)
            case .installing(let installationStep):
                InstallationStepDetailView(installationStep: installationStep)
                CancelInstallButton(xcode: xcode)
            case .installed(_):
                InstalledStateButtons(xcode: xcode)
            }
        }
    }
}

#Preview(PreviewName.allCases[0].rawValue) { makePreviewContent(for: 0) }
#Preview(PreviewName.allCases[1].rawValue) { makePreviewContent(for: 1) }
#Preview(PreviewName.allCases[2].rawValue) { makePreviewContent(for: 2) }
#Preview(PreviewName.allCases[3].rawValue) { makePreviewContent(for: 3) }
#Preview(PreviewName.allCases[4].rawValue) { makePreviewContent(for: 4) }

private func makePreviewContent(for index: Int) -> some View {
  let name = PreviewName.allCases[index]

  return InfoPaneControls(xcode: xcodeDict[name]!)
    .environmentObject(configure(AppState()) {
      $0.allXcodes = [xcodeDict[name]!]
    })
    .frame(width: 300)
    .padding()
}
