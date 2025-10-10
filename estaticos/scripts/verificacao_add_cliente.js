
function verifica_campos(){

    let resposta = true

    $('input ,select').each((p,e)=>{

        if(e.checkValidity() && $(e).hasClass('campo_invalido')) $(e).removeClass('campo_invalido') ;

        if(!e.checkValidity()){
            
            resposta = false

            $(e).addClass('campo_invalido')

        }


        

        



    })

    return resposta



}





$('#criar').click(()=>{


    let resp = verifica_campos()

    if(!resp){
        alert('Verifique os campos em vermelho!')
        return
    
    }


    //aqui





    




   
})



$('#cancela').click(()=>{
    window.location.href = '/'
    console.log('oi')
})



