const userTypeInput = document.getElementById("user-type")
const hiddenUserInput = document.querySelector(".hidden-user-type")
const submitButtons = document.querySelectorAll(".sign-in")
const userSelect = document.querySelector(".user-select")
const form = document.querySelector(".google-form")

const setUserType = (e) => {
    hiddenUserInput.value = e.target.value
}

// const checkSelection = (e) => {
//     if(hiddenUserInput.value === ""){
//         e.preventDefault();
//         const errorDiv = document.createElement('div');
//         errorDiv.className += "text-center text-white bg-danger";
//         console.log(errorDiv)
//         errorDiv.innerHTML = "Please Select User Type";
//         form.insertBefore(errorDiv, userSelect)
//     }
// }

userTypeInput.addEventListener('change', (e) => setUserType(e))
// submitButtons.forEach( button => button.onmouseup = (e) => checkSelection(e))
