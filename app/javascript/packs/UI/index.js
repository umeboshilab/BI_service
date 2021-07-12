document.addEventListener('turbolinks:load', () => {

    function popupImage() {
        var popup = document.getElementById('js-popup');
        if (!popup) return;

        var blackBg = document.getElementById('js-black-bg');
        var closeBtn = document.getElementById('js-close-btn');
        var closeBtn2 = document.getElementById('js-close-btn2');

        console.log("hogehoge");

        closePopUp(blackBg);
        closePopUp(closeBtn);
        closePopUp(closeBtn2);

        function closePopUp(elem) {
            if (!elem) return;
            elem.addEventListener('click', function () {
                popup.classList.toggle('is-show');
            });
        }
    }

    var showBtn = document.getElementById('js-show-popup');
    showBtn.onclick = popupImage;

    // window.onload = function () {
    //     console.log("loaded");
    //     alert("hoge");
    // }

})
