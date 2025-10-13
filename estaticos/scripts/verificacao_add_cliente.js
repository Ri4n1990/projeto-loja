
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

    let modal_load = document.getElementById('load')
    modal_load.showModal()

    let dados = {
        cpf : $('#cpf').val(),
        email : $('#email').val(),
        genero : $('#genero').val(),
        nome : $('#nome').val(),
        nascimento : $('#nascimento').val(),
        telefone : $('#telefone').val()
    }

    let modal_status = document.getElementById('requisicao')
    
       

    $.ajax({
    url : '/cliente',
    type : 'POST',
    contentType : 'application/json',
    data : JSON.stringify(dados),
    statusCode : {
        201 : ()=>{
            modal_load.close()
            modal_status.showModal()
            $('#status').attr('src' , 'estaticos/visuais/sucess.gif')
            $('#aviso_requisicao').text('Cliente criado.')

            $('#confirma').click(()=>{
                window.location.href = '/'
               
            })


        },

        409 : ()=>{
            modal_load.close()
            $('#aviso_requisicao').text('Esse Cliente já existe.')
            $('#status').attr('src' , 'estaticos/visuais/erro.gif')
            modal_status.showModal()

            $('#confirma').click(()=>{
                modal_status.close()
            })

        },

        500: ()=>{
            modal_load.close()
            ('#aviso_requisicao').text('Algo saiu errado.')
            $('#status').attr('src' , 'estaticos/visuais/erro.gif')
            modal_status.showModal()

            $('#confirma').click(()=>{
                window.location.href = '/'
               
            })
        }
    }
    
})


   
})

$(document).keydown((tecla)=>{
    if(tecla.key == 'Escape'){
        tecla.preventDefault()

    }

})

$('#cancela').click(()=>{
    window.location.href = '/'
    console.log('oi')
})



$('#confirma').click(()=>{
    let modal_status = document.getElementById('requisicao')
    modal_status.close()
   
})



