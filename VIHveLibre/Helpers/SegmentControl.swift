//
//  SegmentControl.swift
//  VIHveLibre
//
//  Created by Ariel Merino on 27/02/24.

import SwiftUI

/// This is a custom view
struct SegmentedControl<Indicator: View>: View {
	
	var tabs: [Tab]
	var height: CGFloat = 35.0
	
	@Binding var activeTab: Tab
	
	/// Customization Properties
	var displayAsText: Bool = false
	var font: Font = .title3
	var activeTint: Color 
	var inactiveTint: Color
	
	/// Indicator View
	@ViewBuilder var indicatorView: (CGSize) -> Indicator
	
	/// View Properties
	@State private var minX: CGFloat = .zero
	@State private var excessTabWidth: CGFloat = .zero
	
	var body: some View {
		GeometryReader{
			let size = $0.size
//			let containerWidthForEachTab = size.width / CGFloat(tabs.count)
			
			HStack(spacing: 0){
				ForEach(tabs, id: \.rawValue){ tab in
					Group{
						if displayAsText {
							Text(tab.rawValue)
						} else {
							Label(tab.rawValue, systemImage: tab.systemImage )
								.font(.caption)
						}
					}
					.font(font)
					.foregroundStyle(activeTab == tab ? .white : inactiveTint)
					.animation(.snappy, value: activeTab)
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.background( activeTab  == tab ? activeTint : .clear)
					.clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
					.contentShape(.rect)
					.onTapGesture {
						activeTab = tab
//						if let index = tabs.firstIndex(of: tab), let activeIndex = tabs.firstIndex(of: activeTab){
//							activeTab = tab
//							excessTabWidth = containerWidthForEachTab * CGFloat(index - activeIndex)
//						}
					}
				}
			}
		}
		.frame(height: height)
	}
}

#Preview {
	ContentView()
}
