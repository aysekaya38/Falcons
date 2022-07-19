import { LightningElement } from 'lwc';

export default class CalculatorAddition extends LightningElement {
    num1;  //dynamic values
    num2;
    total = 0;
   
changeHandler(event){
    if(event.target.name === "Number 1"){ //we need to name each input for js to know which input value to process 
    this.num1 = event.target.value;
    }else{
    this.num2 = event.target.value;
    } 
    if(this.num1 ===undefined){
        this.num1 = 0;
    }

    if(this.num2 ===undefined){
        this.num2 = 0;
    }
    this.total = Number(this.num1)+Number(this.num2);
}
// get sum(){ //get values needs to be static not dynamic we need additional set to cahnge get values
//     this.total= Number(this.num1)+Number(this.num2);
//     return this.total;    
//}
// get product(){
//     this.total= Number(this.num1)*Number(this.num2);
//     return this.total;
// }
    
}
