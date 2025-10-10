
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

