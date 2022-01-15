const button = document.getElementById('menu_button')

button.onclick = function(){
    menu();
}

function menu(){
    let menu = document.getElementById('dropdown_menu')
    
    if(menu.classList.contains('close')){
        button.innerHTML = '<i class="fas fa-times"></i>'
        menu.classList.remove('close')
    }
    else{
        menu.classList.add('close')
        button.innerHTML = '<i class="fas fa-align-justify"></i>'
    }
}