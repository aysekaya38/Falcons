import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.Account.Name';
import OWNER_FIELD from '@salesforce/schema/Opportunity.Owner.Name';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';


export default class GetRecordOpp extends LightningElement {
    recordId = "0068c00000pWRT8AAO";
    amount;
    name;
    account;
    owner;
    closeDate;

    //no need to import fields since we use compactlayout
    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Compact'], modes: ['View']})
    oppHandler({data, error}){
        if(data){
            console.log(data);
                // this.amount = data.fields.Amount.displayValue;
                // this.name = data.fields.Name.value;
                // this.account = data.fields.Account.displayValue;
                // this.owner = data.fields.Owner.displayValue;
                // this.closeDate = data.fields.CloseDate.displayValue;
                
                this.name = getFieldValue(data, NAME_FIELD);
                this.amount = getFieldDisplayValue(data, AMOUNT_FIELD);
                this.owner = getFieldValue(data, OWNER_FIELD);
                this.closeDate = getFieldDisplayValue(data, CLOSEDATE_FIELD);
                this.account = getFieldValue(data, ACCOUNT_FIELD);
        }
        if(error){
            console.error(error);
            //chose display values over values to fetch
            
        }
    }

}