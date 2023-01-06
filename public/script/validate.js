function Validator(formObj) {
    let selectorRules = {};
    function Validate(inputElement, rule) {
        let setFn = selectorRules[rule.selector]
        for (let fn of setFn) {
            let message = fn(inputElement.value)
            if (message) {
                inputElement.parentNode.classList.add("error")
                inputElement.parentNode.querySelector(`${formObj.error_message}`).innerText = message; 
                return false;
            }
        }
        return true
    }
    let form = document.querySelector(formObj.form);
    if (form) {
        formObj.rules.forEach((rule) => {
            if (Array.isArray(selectorRules[rule.selector])) {
                selectorRules[rule.selector].push(rule.test);
            } else {
                selectorRules[rule.selector] = [rule.test];
            }
            let selectors = document.querySelectorAll(`${formObj.form} ${rule.selector}`);
            Array.from(selectors).forEach(selector=>{
                selector.onblur = (e) => {
                    Validate(selector, rule)
                }
                selector.onfocus = (e) => {
                    selector.parentNode.classList.remove("error")
                }
            })
           
        })
        form.onsubmit = (e) => {
            e.preventDefault();
            let flag = true;
            formObj.rules.forEach((rule) => {
                let selectors = document.querySelectorAll(`${formObj.form} ${rule.selector}`);
                Array.from(selectors).forEach(selector=>{
                    if (!Validate(selector, rule))
                    flag = false;
                })
                
            })
            if (flag === true) {
                let inputElement = document.querySelectorAll('input[name]');
                let formValue = Array.from(inputElement).reduce((previous, current) => {
                    return { ...previous, [current.name]: current.value };
                }, {})
                formObj.onSubmit(formValue)
            }

        }
    }
}
Validator.isRequire = function (selector) {
    return {
        selector,
        test: function (value) {
            return value.trim() ? undefined : "Please not leave this field blank";
        }
    }
}
Validator.isEmail = function (selector) {
    return {
        selector,
        test: function (value) {
            const regex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/g;
            return value.match(regex) ? undefined : "Email format not correct!"
        }
    }
}
Validator.minLength = function (selector, length) {
    return {
        selector,
        test: function (value) {
            return value.length >= length ? undefined : `Minimun characters is ${length}`
        }
    }
}
Validator.isConfirm = function (selector, getValue) {
    return {
        selector,
        test: function (value) {
            return value == getValue() ? undefined : `Not match`
        }
    }
}