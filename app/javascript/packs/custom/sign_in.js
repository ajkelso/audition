const userTypeInput = document.getElementById("user-type")
const hiddenUserInput = document.querySelector(".hidden-user-type")

const setUserType = (e) => {
    console.log(e.target.value);
    hiddenUserInput.value = e.target.value
}
// // add function to send value to second form
userTypeInput.addEventListener('change', (e) => setUserType(e))

console.log(userTypeInput)