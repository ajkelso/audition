let auditionsCards = document.querySelectorAll(".audition-card")

const handleClick = (id) => {
    location.href = `/auditions/${id}`
}

auditionsCards.forEach(card => {
    card.addEventListener("click", () => handleClick(card.getAttribute("audition_id")))
})