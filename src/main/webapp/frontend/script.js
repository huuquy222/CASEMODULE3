const addressbtn = document.querySelector('#address-form')
const addressclose = document.querySelector('#address-close')
const addressacept = document.querySelector('#address-acept')

addressbtn.addEventListener("click",function(){
    document.querySelector('.address-form').style.display = "flex"
})
addressclose.addEventListener("click",function(){
    document.querySelector('.address-form').style.display = "none"
})
addressacept.addEventListener("click",function(){
    document.querySelector('.address-form').style.display = "none"
})








