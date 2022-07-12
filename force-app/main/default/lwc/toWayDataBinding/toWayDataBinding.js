import { LightningElement } from 'lwc';

export default class ToWayDataBinding extends LightningElement {
    fullName = "Nursen";
    title = "Salesforce Developer";
    //event to reflect changes in html to js
    handleChange(event){
        //below meaning from the current event go to the target and get what ever value the user has typed
        this.title = event.target.value;
    }
}