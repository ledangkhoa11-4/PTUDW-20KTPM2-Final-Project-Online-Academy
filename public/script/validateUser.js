function isRequire(variable){
    return variable.trim() ? true : false;
}

function isEmail(variable){
    const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
    return variable.match(regex) ? true : false;
}

function minLength(variable, length){
    return variable.length >= length ? true : false;
}

function ValidatorName(formObj){
    let form = document.querySelector(formObj.form);
    if(form){
        form['new-name'].onfocus = (e) => {
            form['new-name'].parentNode.classList.remove("error");
        }
        form.onsubmit = (e) => {
            e.preventDefault();
            if(!isRequire(form['new-name'].value)){
                form['new-name'].parentNode.classList.add("error");
                form['new-name'].parentNode.querySelector(`${formObj.error_message}`).innerText = "Please not leave this field blank"; 
            }
            else if(isRequire(form['new-name'].value)){
                form['new-name'].parentNode.querySelector(`${formObj.error_message}`).innerText = undefined;
                formObj.onSubmit(form['new-name']);
            }
        }
    }
}

function ValidatorEmail(formObj){
    let form = document.querySelector(formObj.form);
    if(form){
        form['new-email'].onfocus = (e) => {
            form['new-email'].parentNode.classList.remove("error");
        }
        form.onsubmit = (e) => {
            e.preventDefault();
            if(!isRequire(form['new-email'].value)){
                form['new-email'].parentNode.classList.add("error");
                form['new-email'].parentNode.querySelector(`.form__group-message`).innerText = "Please not leave this field blank";
            }
            if(isRequire(form['new-email'].value)){
                form['new-email'].parentNode.querySelector(`${formObj.error_message}`).innerText = undefined;
                formObj.onSubmit(form['new-email']);
            }
        }
    }
}

function ValidatorPassword(formObj){
    let form = document.querySelector(formObj.form);
    if(form){
        form['cur-password'].onfocus = (e) => {
            form['cur-password'].parentNode.classList.remove("error");
        }
        form['new-password'].onfocus = (e) => {
            form['new-password'].parentNode.classList.remove("error");
        }
        form['confirm-password'].onfocus = (e) => {
            form['confirm-password'].parentNode.classList.remove("error");
        }
        form.onsubmit = (e) => {
            e.preventDefault();
            if(!isRequire(form['cur-password'].value)){
                form['cur-password'].parentNode.classList.add("error");
                form['cur-password'].parentNode.querySelector(`.form__group-message`).innerText = "Please not leave this field blank";
            }
            if(!isRequire(form['new-password'].value)){
                form['new-password'].parentNode.classList.add("error");
                form['new-password'].parentNode.querySelector(`.form__group-message`).innerText = "Please not leave this field blank";
            }
            if(!isRequire(form['confirm-password'].value)){
                form['confirm-password'].parentNode.classList.add("error");
                form['confirm-password'].parentNode.querySelector(`.form__group-message`).innerText = "Please not leave this field blank";
            }
            if(isRequire(form['cur-password'].value) && isRequire(form['new-password'].value) && isRequire(form['confirm-password'].value)){
                form['cur-password'].parentNode.querySelector(`${formObj.error_message}`).innerText = undefined;
                form['new-password'].parentNode.querySelector(`${formObj.error_message}`).innerText = undefined;
                form['confirm-password'].parentNode.querySelector(`${formObj.error_message}`).innerText = undefined;
                if(!minLength(form['new-password'].value,8)){
                    form['new-password'].parentNode.classList.add("error");
                    form['new-password'].parentNode.querySelector(`.form__group-message`).innerText = "Minimum characters is 8";
                }
                else if(form['new-password'].value.localeCompare(form['confirm-password'].value) !== 0){
                    form['confirm-password'].parentNode.classList.add("error");
                    form['confirm-password'].parentNode.querySelector(`.form__group-message`).innerText = "Not match!";
                }
                else formObj.onSubmit(form['new-password']);
            }
        }
    }
}