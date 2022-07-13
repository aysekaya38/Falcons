import { LightningElement } from 'lwc';

export default class CustomerTypesCombobox extends LightningElement {

    selectedType;

    changeHandler(event){
        //passing the target selected value to the selected value
        this.selectedType = event.target.value;
    }

    get customerTypes(){
        //TO PASS the options in HTML, returns an array of objects each with a label(what we see) and value(what is stored in the backend)
        return [
            {label: "Existing Customer", value: "Existing Customer"},
            {label: "New Customer - Marketing", value: "New Customer - Marketing"},
            {label: "New Customer - Marketing", value: "New Customer - Referral"}
        ];
    }

}