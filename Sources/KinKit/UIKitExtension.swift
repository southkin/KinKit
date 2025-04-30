//
//  UIKitExtension.swift
//  KinKit
//
//  Created by kin on 4/30/25.
//
#if canImport(UIKit)
import UIKit
extension UIView {
    static func fileName() -> String {
        return String(describing: self)
    }
    @discardableResult
    func loadNib(nibName:String? = nil) -> UIView? {
        let nibName = nibName ?? type(of: self).fileName()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
        guard let view = view else { return nil }
        view.frame = self.bounds
        self.addSubview(view)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return view
    }
}
extension UIViewController {
    static func fileName() -> String {
        return String(describing: self)
    }
    static func makeVC(nibName:String? = nil) -> Self {
        let nibName = nibName ?? fileName()
        return Self.init(nibName: nibName, bundle: nil)
    }
}

#endif
