document.addEventListener('turbolinks:load', () => {

    function popupRequestCheckForm(e) {
        var e = e || window.event;
        var elem = e.currentTarget || e.srcElement;
        var index = elem.getAttribute("data-index");
        var title = elem.getAttribute("data-title");
        var message = elem.getAttribute("data-message");

        temp = document.getElementById('task_request_id');
        temp.value = index;
        document.getElementById('requestCheckFormTitle').innerHTML = title;
        document.getElementById('requestCheckFormMessage').innerHTML = message;

        console.log(temp);

        let checkForm = document.getElementById('popupRequestForm');
        checkForm.classList.remove("hidden");
    }

    function hideRequestCheckForm() {
        let checkForm = document.getElementById('popupRequestForm');

        checkForm.classList.add("hidden");
    }

    function acceptingRequestForm() {
        console.log("accepted");
        document.getElementById('task_isAccepted').value = '1';

        // submitRequestCheckForm();
        // hideRequestCheckForm();
    }

    function rejectingRequestForm() {
        console.log("rejected");

        document.getElementById('task_isAccepted').value = '0';

        // submitRequestCheckForm();
        // hideRequestCheckForm();
    }

    function submitRequestCheckForm() { //Ruby側で全部終えてありそう
        var index = document.getElementById('task_request_id').value;
        console.log(index);
    }


    // カードのクリックをpopupに対応させる
    let requestCards = document.getElementsByClassName('requestCardButton');
    for (var i = 0; i < requestCards.length; i++) {
        requestCards[i].onclick = popupRequestCheckForm;
    }


    // let cardButton = document.getElementById('cardButton');
    // cardButton.onclick = popupRequestCheckForm(1);

    let hideCheckForm = document.getElementById('hideCheckPopup');
    hideCheckForm.onclick = hideRequestCheckForm;

    let acceptButton = document.getElementById('acceptButton');
    acceptButton.onclick = acceptingRequestForm;

    let rejectButton = document.getElementById('rejectButton');
    rejectButton.onclick = rejectingRequestForm;

})

