const url = window.location.href

rege = /\d{11}/
teste = rege.test(url)

if(!teste) window.location.href = '/';

let cpf_cliente ;

url.replace(rege , (a)=>{

     cpf_cliente = a
    

})

// requisição




