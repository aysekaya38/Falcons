import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';

const FIELDS = [SUBJECT_FIELD, DESCRIPTION_FIELD, PRIORITY_FIELD]

export default class UpdateRecordCase extends LightningElement {
    //first get some record info to update
    recordId = '5008c00001HvDypAAF';
    subject;
    description;
    priority;
    fields = {};


    @wire(getRecord, {recordId: '$recordId', fields: FIELDS })

    caseHandler({data, error}){
        if(data){
            console.log(data);
            this.subject = getFieldValue(data, SUBJECT_FIELD);
            this.description = getFieldValue(data, DESCRIPTION_FIELD)
            this.priority = getFieldValue(data, PRIORITY_FIELD)
        }
        if(error){
            console.error(error);
        }
    }

    get priorityChange(){
        return [
            {label: "Low", value: "Low"},
            {label: "Medium", value: "Medium"},
            {label: "High", value: "High"}

        ]
    }

    changeHandler(event){
        //this.priority = event.target.value;
        const {name, value} = event.target;
        this.formdata[name] = value;
        this.formdata['Id'] = this.recordId;

    }

    updateCase(){
        const recordInput = {fields: this.formdata};
        updateRecord(recordInput)
            .then(result => {
                console.log(result);
                this.displayToast("Success", "Your case is saved successfully!", "success");
            })
            .catch(error => {
                console.error(error);
                this.displayToast("Error", error.body.message, "error")
            })
    }

 displayToast(title, message, variant){
        const toast = new ShowToastEvent({title, message, variant}) //in JS NO NEED TO WRITE title= title because the assigned value is the same
        this.dispatchEvent(toast);
    }
}

