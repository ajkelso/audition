const userTypeInput = document.getElementById("user-type")
const hiddenUserInput = document.querySelector(".hidden-user-type")
const submitButtons = document.querySelectorAll(".sign-in")
const userSelect = document.querySelector(".user-select")
const form = document.querySelector(".google-form")

const setUserType = (e) => {
    hiddenUserInput.value = e.target.value
}

userTypeInput.addEventListener('change', (e) => setUserType(e))
