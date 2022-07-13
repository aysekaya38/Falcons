import { LightningElement } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
//import all fields needed from account
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class LightningRecordViewFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    recordId="0018c00002Ewf85AAB";
    //we cannot use array since we cannot call them sperately in HTML, using getter ofr each would be lenght, so instaed prep an onject and use name as key
    fields = {
        name: NAME_FIELD,
        type: TYPE_FIELD,
        industry: INDUSTRY_FIELD,
        revenue: REVENUE_FIELD,
        phone: PHONE_FIELD,
        rating: RATING_FIELD
    }
}