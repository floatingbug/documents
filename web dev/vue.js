//- erstes beispiel
const app = Vue.createApp({
    template: '<h1>hello {{var1}}</h1>,
    data(){
        return {
            var1: 'world'
        }
    }
})

//div-id im html-dokument.
app.mount('#app')

//output im browser: hello world
////////////////////////////////////////////////////////////////////////////////////////////////////////////

//- v-bind
//v-bind "bindet" den Inhalt einer variable aus der vue-app an
//ein html-attribut.
const app = Vue.createApp({
    data(){
        return {
            adress: 'http://www.google.de'
        }
    }
})

//html
<img v-bind:src='adress' />

//-> shorthand für v-bind:attribut ist :attribut
