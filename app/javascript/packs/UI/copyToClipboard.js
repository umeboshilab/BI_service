function copyToClipboard() {
    // コピー対象をJavaScript上で変数として定義する
    var copyTarget = document.getElementById("copyTarget");
    // 選択しているテキストをクリップボードにコピーする
    navigator.clipboard.writeText(copyTarget.innerHTML);
    // コピーをお知らせする
    console.log(copyTarget.innerHTML)
    alert("クリップボードにコピーしました。");
}

let ct = document.getElementsById("copyTarget");
ct.onclick = copyToClipboard;
