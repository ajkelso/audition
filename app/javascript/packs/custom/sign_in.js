const userTypeInput = document.getElementById("user-type")
const hiddenUserInput = document.querySelector(".hidden-user-type")
const 

const setUserType = (e) => {
    hiddenUserInput.value = e.target.value
}

userTypeInput.addEventListener('change', (e) => setUserType(e))
