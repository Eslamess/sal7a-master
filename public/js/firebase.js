

'use strict';

const firebaseConfig = {
    apiKey: "AIzaSyAITOAgzU6j5iJNuYzwN_nZS-SAZLWVmGk",
    authDomain: "sal7a-321b4.firebaseapp.com",
    databaseURL: "https://sal7a-321b4.firebaseio.com",
    projectId: "sal7a-321b4",
    storageBucket: "sal7a-321b4.appspot.com",
    messagingSenderId: "269433537029",
    appId: "1:269433537029:web:5f93bc7180dad7447d526c",
    measurementId: "G-PZD91C4HHP"
};


firebase.initializeApp(firebaseConfig);


const messaging =firebase.messaging();

console.log(messaging)

console.log(messaging)
messaging.requestPermission()
        .then(function () {
            console.log("notification permission generated 1 khaleds .");
              self.registration;
                return messaging.getToken();
        }).then(function (token){
            console.log('Notification permission granted 2 .');
           // var x=token.getToken();
//alert(token)

            $('#web_token').val(token);
            //console.log($('#web_token').val());
        }).catch(function (err) {
            console.log("unable to.",err);
});

messaging.onMessage((payload)=>{
    console.log("khaleds")
    $.notify("Hello World");
    console.log(payload);
});

