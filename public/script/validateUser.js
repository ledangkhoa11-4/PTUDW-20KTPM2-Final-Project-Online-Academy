let form2 = document.querySelector('.form-2');
function isRequire(variable){
    return variable.trim() ? true : false;
}

function isEmail(variable){
    if(variable.match(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g) == null) return false;
    return true;
}

function isNew(v1, v2){
    if(v1.localcompare(v2) == 0) return false;
    return true;
}

function ValidatorName(formObj){
    let form = document.querySelector(formObj);
    if(form){
        form.onsubmit = (e) => {
            e.preventDefault();
            if(!isRequire(form['new-name'].value)){
                form['new-name'].parentNode.classList.add("error");
                form['new-name'].parentNode.querySelector(`.form__group-message`).innerText = "Please not leave this field blank";
            }
            if(isRequire(form['new-name'].value)){
                document.querySelector(`.form__group-message`).innerText = undefined;
                form.submit();
            }
        }
    }
}