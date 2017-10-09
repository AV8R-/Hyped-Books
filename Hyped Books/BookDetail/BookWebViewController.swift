//
//  BookWebViewControllr.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import WebKit

class BookWebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    let uuid: String
    weak var output: BookDetailOutput?
    
    init(uuid: String) {
        self.uuid = uuid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://bookmate.com/books/\(uuid)")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let close = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(exit)
        )
        
        navigationItem.setRightBarButton(close, animated: false)
    }
    
    @objc func exit() {
        output?.extit()
    }
}

protocol BookDetailOutput: class {
    func extit()
}
