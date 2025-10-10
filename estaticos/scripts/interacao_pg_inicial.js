
$('tr').click(function(){
    if($(this).parent()[0].tagName === 'THEAD'){
        return
    }
    
    $('.selecionado').removeClass('selecionado')
    $(this).addClass('selecionado')
})