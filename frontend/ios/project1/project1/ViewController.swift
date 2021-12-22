//
//  ViewController.swift
//  project1
//
//  Created by gh on 2021/12/21.
//

import UIKit
import WebKit
import AVFoundation
import SafariServices //safari 이용 접속시 필요 도구 툴

class ViewController: UIViewController, WKNavigationDelegate { //WKwebview 사용 델리게이트

    @IBOutlet weak var webView: WKWebView!   //선언
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewInit()
    }
    
    func webViewInit(){
        
        //웹뷰에 링크 설정
        webView.allowsBackForwardNavigationGestures = true
        if let url = URL(string: "https://gudals-kim.github.io/hotfix/") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        WKWebsiteDataStore.default().removeData(ofTypes: [WKWebsiteDataTypeDiskCache, WKWebsiteDataTypeMemoryCache], modifiedSince: Date(timeIntervalSince1970: 0)) {
    }
}
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url else {
                decisionHandler(.cancel)
                return
            }


            let urlString = url.absoluteString
            if urlString.contains("특정url") {
                decisionHandler(.cancel)
                return
            } else if urlString.contains("특정url2") {
                // 다른처리
            }
            
            decisionHandler(.allow)
        }
    
    //툴바 각 버튼 액션 추가
    @IBAction func touchBack(_ sender: Any) {
            webView.goBack()
        }
        
        @IBAction func touchForward(_ sender: Any) {
            webView.goForward()
        }
        
        @IBAction func touchRefresh(_ sender: Any) {
            webView.reload()
        }
    
        @IBAction func stop(_ sender: Any) {
            webView.stopLoading()
        }
    
    //상단 네비게이션 바 버튼별 액션 추가
    //safari 연결 및 접속링크 설정
    @IBAction func touchUpToLinkTonaver(_ sender: Any) {
        let naverUrl = NSURL(string: "https://naver.com")
        let naverSafariView: SFSafariViewController = SFSafariViewController(url: naverUrl! as URL)
        self.present(naverSafariView, animated: true, completion: nil)
    }
    @IBAction func touchUpToLinkToapple(_ sender: Any) {
        let appleUrl = NSURL(string: "https://apple.com")
        let appleSafariView: SFSafariViewController = SFSafariViewController(url: appleUrl! as URL)
        self.present(appleSafariView, animated: true, completion: nil)
    }
    @IBAction func touchUpToLinkTogoogle(_ sender: Any) {
        let googleUrl = NSURL(string: "https://google.com")
        let googleSafariView: SFSafariViewController = SFSafariViewController(url: googleUrl! as URL)
        self.present(googleSafariView, animated: true, completion: nil)
    }
    @IBAction func touchUpToLinkTodaum(_ sender: Any) {
        let daumUrl = NSURL(string: "https://daum.net")
        let daumSafariView: SFSafariViewController = SFSafariViewController(url: daumUrl! as URL)
        self.present(daumSafariView, animated: true, completion: nil)
    }
}
// 웹뷰 0, 0, 0, 0 으로 오토레이아웃 설정
