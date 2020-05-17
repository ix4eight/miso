function launchApp() {
  var IOS_SCHEME = 'https://line.me/R/';
  var IOS_STORE = 'https://liff.line.me/';

  var userAgent = navigator.userAgent.toLowerCase();
  // iPhone端末ならアプリを開くかApp Storeを開く。
  if (userAgent.search(/iphone|ipad|ipod/) > -1) {
    location.href = IOS_SCHEME + '://';
      setTimeout(function() {
          location.href = IOS_STORE;
      }, 500);
  }
  // Android端末ならアプリを開くかGoogle Playを開く。
  else if (userAgent.search(/android/) > -1) {
      document.location = 'intent://#Intent;scheme=' + ANDROID_SCHEME
              + ';package=' + ANDROID_PACKAGE + ';end';
  }
  // その他・不明・PCなどの場合はサイトを開く。
  else {
      document.location = PC_SITE;
  }
}

// ページ読み込み時に実行
window.onload = function() {
  launchApp();
}