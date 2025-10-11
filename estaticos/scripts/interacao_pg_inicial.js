
let get_dados = new Promise((resolve, reject) => {

    $(window).on('load',()=>{
        
  
        let load = document.getElementById('load')
        load.showModal()
    
        $.ajax({
            url : '/clientes',
            type : 'GET',
            statusCode: {
                200 : (dados)=>{
                    
    
                    dados = JSON.parse(dados)
    
                    
                    dados.map((e)=>{
                        let tr = $('<tr/>')
    
                        for(const key in e){
                            let td = $('<td/>').text(e[key])
                            tr.append(td)
                            
                            
                        }
    
                        $('#corpo').append(tr)
    
    
    
    
    
    
    
                    })
    
                    load.close()
                    resolve(true)
                    
    
    
                },
    
                500: (erro)=>{
                    
                    $('#aviso').attr('src' , "estaticos/visuais/erro.gif")
                    alert('Algo saiu errado! por favor reinicie a página.')
                    reject(false)
                }
            }
    
            
        })

        
    
    
    
    
    })
    

    
})



let selecao = async()=>{

    await get_dados

    $('tr').click(function(){
        if($(this).parent()[0].tagName === 'THEAD'){
            return
        }
        
        $('.selecionado').removeClass('selecionado')
        $(this).addClass('selecionado')

        let cpf_cliente = $(this).find('td:first').text()
        

        $('#editar').find('a:first').attr('href', `/pg_atualizar_cliente?cpf=${encodeURIComponent(cpf_cliente)}`);

    })
    

}

$(window).on('load', ()=>{
    selecao()
})


$(document).keydown((tecla)=>{
    if(tecla.key == 'Escape'){
        tecla.preventDefault()

    }

})




$('#editar').click(()=>{
    if(($('.selecionado')).length == 0) alert('Selecione um registro! ');
})



$('#confirma').click(()=>{
    let modal_status = document.getElementById('requisicao')
    modal_status.close()
    window.location.reload()
})



$('#excluir').click(()=>{
    if($('.selecionado').length == 0){
        alert('Selecione um registro!') 
        return
    }

    let regist = $('.selecionado').find('td:first').text()

    modal = document.getElementById('requisicao')
    

    let erro  = ()=>{

            let status = $('#status')
            $('#aviso_requisicao').text('Algo saiu errado!')
            status.attr('src' , 'estaticos/visuais/erro.gif')

        }
    

    $.ajax({
        url: `cliente/${regist}`,
        type : 'DELETE',

        
        statusCode : {
            204 : (data)=>{
                modal.showModal()
                
                
            },

            404 : ()=>{
                erro()
                modal.showModal()

            },

            400 : ()=>{
                erro()
                modal.showModal()

            },

            500 : ()=>{
                erro()
                modal.showModal()

            }


        }
    })

    




})