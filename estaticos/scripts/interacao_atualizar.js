
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

const url = window.location.href

rege = /\d{11}/
teste = rege.test(url)

if(!teste) window.location.href = '/';

let cpf_cliente ;

url.replace(rege , (a)=>{

     cpf_cliente = a
    

})

$(window).on("load" , ()=>{

     let modal = document.getElementById('load')
     let modal_status = document.getElementById('requisicao')
     modal.showModal()

     $('#confirma').click(()=>{
          window.location.href = '/'
     })

     $.ajax({
          url : `/cliente/${cpf_cliente}`,
          type : 'GET',
          statusCode : {
               200 : (data)=>{
                    modal.close()
                    
                    $('#cpf').val(data.cpf)
                    $('#email').val(data.email)
                    $('#nome').val(data.nome)
                    
                    $('#nascimento').val(data.nascimento)
                    $('#telefone').val(data.telefone)

                    

               }, 

               404 : ()=>{
                    modal.close()
                    $('#status').attr('src' , 'estaticos/visuais/erro.gif')
                    $('#aviso_requisicao').text('Algo saiu errado.')
                    modal_status.showModal()


               },

               500 : ()=>{
                    modal.close()
                    $('#status').attr('src' , 'estaticos/visuais/erro.gif')
                    $('#aviso_requisicao').text('Algo saiu errado.')
                    modal_status.showModal()

               }
          }
     
     })

     

})


$('#atualizar').click(()=>{
     if(!verifica_campos()){
          alert('verifique os campos em vermelho!')
          return
     }
     
     let modal = document.getElementById('load')
     let modal_status = document.getElementById('requisicao')
     modal.showModal()
     
     let dados = {
          cpf : $('#cpf').val(),
          nome : $('#nome').val(),
          email : $('#email').val(),
          data_nascimento : $('#nascimento').val(),
          genero : $('#genero').val(),
          telefone : $('#telefone').val()


     }

     let erro = ()=>{
          modal.close()
          $('#status').attr('src' , 'estaticos/visuais/erro.gif')
          $('#aviso_requisicao').text('Algo saiu errado.')
          modal_status.showModal()

     }

     $.ajax({
          url : `/cliente/${cpf_cliente}`,
          type : 'PATCH',
          contentType : 'application/json',
          data : JSON.stringify(dados),
          statusCode : {
               201 : ()=>{
                    modal.close()
                    modal_status.showModal()


               },

               400 : ()=>{
                    erro()
               },

               404 : ()=>{
                    erro()
               },

               500 : ()=>{
                    erro()
               }
          }
     })
})




