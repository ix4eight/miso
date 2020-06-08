function twitterApp() {
  var IOS_SCHEME = 'twitter';
  var IOS_STORE = 'itms-apps://search.itunes.apple.com/WebObjects/MZSearch.woa/wa/search?media=software&term=twitter';
  var PC_SITE = 'https://itunes.apple.com/jp/app/twitter/id333903271?mt=8';

  var userAgent = navigator.userAgent.toLowerCase();
  // iPhone端末ならアプリを開くかApp Storeを開く。
  if (userAgent.search(/iphone|ipad|ipod|mac/) > -1) {
    location.href = IOS_SCHEME + '://';
      setTimeout(function() {
          location.href = IOS_STORE;
      }, 10000);
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

$(function() {
  $("#id_twitter").click(function() {
    twitterApp();
  })
})