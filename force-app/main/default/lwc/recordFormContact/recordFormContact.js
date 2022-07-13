import { LightningElement } from 'lwc';
//imposrt toast event to display success, error, info messages 
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
//we cannot use the global var in the HTML so we create a local property below and use name convensions NAME_FIELD to not confuse the imported fields
import NAME_FIELD from '@salesforce/schema/Contact.Name';
//I did not import other fields because I chose to display the compact layout

//with the fields below create an array
export default class RecordFormContact extends LightningElement {
    recordId = "0038c00002nwtH2AAI"; //we are hardcoding id here, later we will learn to fetch
    objectName = CONTACT_OBJECT;
    fields = [NAME_FIELD];

    successHandler(){
        //method displays success message, 3 manditatory attributes
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "The contact has been saved successfully",
            variant: "success"
    });
        this.dispatchEvent(successToast);
    }
    errorHandler(){
        const errorToast = new ShowToastEvent({
            title: "Error",
            message:"There has been an error",
            variant: "error"
    });
        this.dispatchEvent(errorToast);
}
}