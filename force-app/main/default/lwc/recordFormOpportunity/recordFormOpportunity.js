import { LightningElement, api } from 'lwc';
//api decorator makes the property public so we can pass values to this prop from outside
import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';

import OPPORTUNITY_NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNTID_FIELD from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import LEAD_SOURCE_FIELD from '@salesforce/schema/Opportunity.LeadSource';


export default class RecordFormOpportunity extends LightningElement {
    //@api recordId;
    recordId = "0068c00000pWRSrAAO";
    objectName = OPPORTUNITY_OBJECT;
    fields = [OPPORTUNITY_NAME_FIELD, ACCOUNTID_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, LEAD_SOURCE_FIELD];

successHandler(){
    const successEvent= new ShowToastEvent({
        title: "Sucess",
        message: "The opportunity has been saved sucessfully!",
        variant:"success",
    });
        this.dispatchEvent(successEvent);
}

errorHandler(){
    const errorEvent = new ShowToastEvent({
        title: "Error",
        message: "An error occured and the opportunity is not saved",
        variant: "error"
    });
    this.dispatchEvent(errorEvent);
}
}