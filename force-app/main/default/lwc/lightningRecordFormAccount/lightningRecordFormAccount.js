import { LightningElement } from 'lwc';
//import showtoastevent to create a success message
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import ACCOUNT_OBJECT from '@salesforce/schema/Account'; //fetch acoount details like soql in Apex
import NAME_FIELD from '@salesforce/schema/Account.Name'; //USE NAMING CONVENSIONS TO DIFFERENTIATE IMPORTED PROPERTIES
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import RATING_FIELD from '@salesforce/schema/Account.Rating';

export default class LightningRecordFormAccount extends LightningElement {
     //store the account details in local property to make them accessible in the HTML
     recordId= "0018c00002Ewf85AAB";
     objectName = ACCOUNT_OBJECT; 
     fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, ANNUALREVENUE_FIELD, PHONE_FIELD, RATING_FIELD];

     successHandler(){
         const successEvent = new ShowToastEvent({
         //has 3 mandatory attributes
         title: "Success",
         message: "The account record has been saved sucessfully!",
         variant: "success"
        });
        this.dispatchEvent(successEvent);
    }
}