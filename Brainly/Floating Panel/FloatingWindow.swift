//
//  FloatingWindow.swift
//  Brainly
//
//  Created by Chetan Kachana on 3/2/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func floatingWindow<Content: View>(position:CGPoint, show: Binding<Bool>, @ViewBuilder content: @escaping()->Content)->some View{
        self
            .modifier(FloatingWindowModifier(windowView: content(), position: position, show: show))
    }
}

fileprivate struct FloatingWindowModifier<WindowView: View> : ViewModifier{
    var windowView: WindowView
    var position: CGPoint
    @Binding var show: Bool
    @State private var panel: FloatingPanelHelper<WindowView>?
    
    func body(content: Content)-> some View{
        content
            .onAppear{
                panel = FloatingPanelHelper(position: position, show: $show, content: {
                    windowView
                })
            }
            .onChange(of: show) {
                newValue in
                if newValue{
                    panel?.orderFront(nil)
                    panel?.makeKey()
                }
                else{
                    
                }
            }
    }
}

class FloatingPanelHelper<Content: View>: NSPanel{
    @Binding private var show:Bool
    init(position:CGPoint, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content){
        self._show = show
        super.init(contentRect:.zero, styleMask: [.resizable, .closable, .fullSizeContentView, .nonactivatingPanel, .titled ], backing: .buffered, defer: false)
        
        isFloatingPanel = true
        level = .floating
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
        contentView = NSHostingView(rootView:content())
        standardWindowButton(.closeButton)?.isHidden = true
        standardWindowButton(.miniaturizeButton)?.isHidden = true
        standardWindowButton(.zoomButton)?.isHidden = true
        isMovableByWindowBackground = true
        
        
    }
}
