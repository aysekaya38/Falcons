//createRecord function in LWC - create opportunity form and save it
import { LightningElement } from 'lwc';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecordOpportunity extends LightningElement {
    //for picklist -Combobox
    stage;
    fields ={};
    //assigns the values user entered as new values
    changeHandler(event){
        //object to store fieldname and values entered
        const {name, value} = event.target;
        this.fields[name] = value;
    }

    get stageChange(){
        return [
            {label: "Prospecting", value: "Propspecting"},
            {label: "Qualiification", value: "Qualification"},
            {label: "Needs Analysis", value: "Needs Analysis"},
            {label: "Value proposition", value: "Value proposition"},
            {label: "Id. Decision Makers", value: "Id. Decision Makers"},
            {label: "Perception Analysis", value: "Perception Analysis"},
            {label: "Proposal/Price Quote", value: "Proposal/Price Quote"},
            {label: "Negotiation/Review", value: "Negotiation/Review"},
            {label: "Closed Won", value: "Closed Won"},
            {label: "Closed Lost", value: "Closed Lost"}
        ];
    }
    createOpportunity(){
        //as in Apex to insert a record we need object name and field values
        const recordInput = {apiName: OPPORTUNITY_OBJECT.apiName, 
            fields: this.fields};

            createRecord(recordInput)
            //we need to tell JS when to run the function: .then(result) means if you received data execute this
                .then(result => {
                    console.log(result);
                    this.displayToast("Success", "Your opportunity saved successfully!", "success");
                    //after saving reset the formn and make it ready again for entering value
                    //below goes to HTML template, finds opportunity form and resets it
                    this.template.querySelector('form.opportunityForm').reset();
                    this.fields ={};
                })
                //if you receive error execute this
                .catch(error => {
                    console.error(error);
                    this.displayToast("Error", error.body.message, "error")
                })
    }

    //instead of writing 2 seperate handlers 4 success and error, create one toast event and change what it displays in the event of success vs error
    displayToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant}) //in JS NO NEED TO WRITE title= title because the assigned value is the same
        this.dispatchEvent(toast);
    }
}