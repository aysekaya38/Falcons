import { LightningElement, api } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

import OPPNAME_FIELD from '@salesforce/schema/Opportunity.Name';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class RecordEditFormContact extends LightningElement {
    //recordId ="0068c00000pWRSrAAO";
    @api recordId;
    objectName = OPPORTUNITY_OBJECT;
    fields = {
        Name: OPPNAME_FIELD,
        StageName: STAGENAME_FIELD,
        Type: TYPE_FIELD,
        Amount: AMOUNT_FIELD,
        AccountId: ACCOUNT_FIELD,
        CloseDate: CLOSEDATE_FIELD 
    }

successHandler() {
    const successToast = new ShowToastEvent({
        title: "Success",
        message: "Opportunity has been saved successfully!",
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


