// ---call
// -> Beispiel 1
function func(){
    console.log(`prob1: ${this.prob1}, prob2: ${this.prob2}`)
}

let obj1 = {
    prob1: "Hello",
    prob2: "there"
};

func.call(obj1) // output: prob1: hello, prob2: there

//  -> Jedes Objekt oder Variable das als erstes Argument an call übergeben wird, wird an das Objekt 
//      gebunden von dem call aufgerufen wird.
//      -> Im Beispiel wird obj1 and das Objekt func gebunden (auch Funktionen in JavaScript sind Objekte).

// -> Beispiel 2 (Vererbung)

function Person(name, age, gender){
    this.name = name;
    this.age = age;
    Gender.call(this, gender) // Das neu erstellte Objekt person wird mit this an die Konstruktorfunktion Gender
};                            // gebunden. Dann wird die Variable gender in dem neu erstellten Objekt (person)
                              // deklariert und definiert (this.gender = gender;).
function Gender(gender){
    this.gender = gender;
};

let person = new Person("tom", 80, "male")


