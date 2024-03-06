function onloadToast(){
    iziToast.warning({
        title: 'NH카드사 타임아웃 발생',
        message: '카드사측 장애로 발생',
        position: 'topRight'
    });
}


function dashboardToast(user_name){
    date = new Date();
    let userRole;
    event.preventDefault();
    iziToast.show({
        id: 'support',
        theme: 'dark',
        icon: 'fa fa-user',
        title: user_name+'님! 환영합니다.',
        displayMode: 2,
        message: '*접속기록 : ['+date.toLocaleString()+']',
        position: 'topCenter',
        transitionIn: 'flipInX',
        transitionOut: 'flipOutX',
        progressBarColor: 'rgb(0, 255, 184)',
        image: '/static/favicon.ico',
        imageWidth: 70,
        layout: 2,
        onClosing: function(){
            console.info('onClosing');
        },
        onClosed: function(instance, toast, closedBy){
            console.info('Closed | closedBy: ' + closedBy);
        },
        iconColor: 'rgb(0, 255, 184)'
    });
}
