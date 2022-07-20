//fetch account details using recordId

import { LightningElement, wire } from 'lwc';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';


//We can create method level const iside method BUT 
//to create class level const, write it outside of the class
//it is good practice to use class array, in case you want to add a new field
const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, PHONE_FIELD];

export default class GetRecordAccount extends LightningElement {
    recordId = "0018c00002Ewf85AAB";
    name;
    type;
    industry;
    phone;
    //although the id is hardcoded here, good practice to use $ and make the property reactive
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS })

    //wire servive provides us with outcome => MAP THE OUTCOME TO FUNCTION
    accountHandler({data, error}){
        if(data){
            console.log(data); //print always to decide how to get the data
            // this.type= data.fields.type.value;
            // this.name= data.fields.name.value;
            // this.industry = data.fields.industry.value;
            // this.phone= data.fields.phone.value;

            //ALTERNATIVE WAY TO FECTH RECORD DETAILS we can use getFieldValues FUNCTION 
            this.name = getFieldValue(data, NAME_FIELD);
            this.type = getFieldValue(data, TYPE_FIELD);
            this.industry = getFieldValue(data, INDUSTRY_FIELD);
            this.phone = data.fields.Phone.value;
        }
        if(error){
            console.error(error)
        }
    }
}