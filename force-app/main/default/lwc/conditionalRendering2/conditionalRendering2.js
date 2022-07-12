import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent = true;

    clickHandler(){
        this.showContent = !this.showContent;
        //when clicked ones it will reverse the action
    }

}