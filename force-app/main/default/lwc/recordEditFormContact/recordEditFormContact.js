import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import DEPARTMENT_FIELD from '@salesforce/schema/Contact.Department';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNTID_FIELD from '@salesforce/schema/Contract.AccountId';

export default class RecordEditFormContact extends LightningElement {
    recordId ="0038c00002iK7TZAA0";
    objectName = CONTACT_OBJECT;
    fields = {
        FirstName: FIRSTNAME_FIELD,
        LastName: LASTNAME_FIELD,
        Title: TITLE_FIELD,
        Department: DEPARTMENT_FIELD,
        Email: EMAIL_FIELD,
        AccountId: ACCOUNTID_FIELD
    }

successHandler() {
    const successToast = new ShowToastEvent({
        title: "Success",
        message: "Contact has been saved successfully!",
        variant: "success"
    });
    this.dispatchEvent(successToast);
}

errorHandler() {
    const errorToast = new ShowToastEvent({
        title: "Error",
        message: "An error has been occured!",
        variant: "error"
    });
    this.dispatchEvent(errorToast);
}

}
