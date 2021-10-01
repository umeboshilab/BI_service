document.addEventListener('turbolinks:load', () => {

    function popupRequestCheckForm(e) {
        var e = e || window.event;
        var elem = e.currentTarget || e.srcElement;
        var index = elem.getAttribute("request-index");
        var title = elem.getAttribute("request-title");
        var message = elem.getAttribute("request-message");
        var imagePath = elem.children[0].children[0].children[0].src;
        var imageInForm = document.getElementById('requestCheckFormImg');

        temp = document.getElementById('checkFormRequest_id');
        temp.value = String(index);

        document.getElementById('requestCheckFormTitle').innerHTML = title;
        document.getElementById('requestCheckFormMessage').innerHTML = message;

        // console.log(imagePath + "/request_images/no_image.png");
        if (~imagePath.indexOf("/request_images/no_image.png")) {
            imageInForm.classList.add("hidden");
        } else {
            imageInForm.classList.remove("hidden");
            imageInForm.src = imagePath;
        }

        let checkForm = document.getElementById('popupRequestForm');
        checkForm.classList.remove("hidden");
    }

    function hideRequestCheckForm() {
        let checkForm = document.getElementById('popupRequestForm');

        checkForm.classList.add("hidden");
    }

    function acceptingRequestForm() {
        console.log("accepted");
        document.getElementById('task_isAccepted').value = "1";

        submitRequestCheckForm();
    }

    function rejectingRequestForm() {
        console.log("rejected");
        document.getElementById('task_isAccepted').value = "0";

        submitRequestCheckForm();
    }

    function submitRequestCheckForm() { //入力内容の監視
        // hideRequestCheckForm();
        // console.log(document.getElementById('task_isAccepted').value);
        // console.log(document.getElementById('task_request_id').value);
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





    // Done側のpopupの実装
    function popupTaskDoneForm(e) {
        var e = e || window.event;
        var elem = e.currentTarget || e.srcElement;
        var index = elem.getAttribute("task-index");
        var title = elem.getAttribute("task-title");
        var message = elem.getAttribute("task-message");
        var imagePath = elem.parentElement.parentElement.children[0].children[0].children[0].children[0].src;
        var imageInForm = document.getElementById('taskDoneFormImg');

        temp = document.getElementById('doneForm_id');
        temp.value = String(index);

        document.getElementById('complete_form').action = '/tasks/' + index;

        document.getElementById('taskDoneFormTitle').innerHTML = title;
        document.getElementById('taskDoneFormMessage').innerHTML = message;

        // console.log(imagePath + "/request_images/no_image.png");
        if (~imagePath.indexOf("/request_images/no_image.png")) {
            imageInForm.classList.add("hidden");
        } else {
            imageInForm.classList.remove("hidden");
            imageInForm.src = imagePath;
        }

        let checkForm = document.getElementById('popupDoneForm');
        checkForm.classList.remove("hidden");
    }
    function hideDoneCheckForm() {
        let checkForm = document.getElementById('popupDoneForm');
        checkForm.classList.add("hidden");
    }
    // カードのクリックをpopupに対応させる
    let taskCards = document.getElementsByClassName('taskDoneButton');
    for (var i = 0; i < taskCards.length; i++) {
        taskCards[i].onclick = popupTaskDoneForm;
    }
    function doneForm() {
        document.getElementById('task_isDone').value = "1";
        console.log("done");
    }
    let hideDoneForm = document.getElementById('hideDonePopup');
    hideDoneForm.onclick = hideDoneCheckForm;

    let doneButton = document.getElementById('doneButton');
    doneButton.onclick = doneForm;




})

