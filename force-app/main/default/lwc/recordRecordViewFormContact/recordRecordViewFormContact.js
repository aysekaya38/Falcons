import { LightningElement } from 'lwc';

import CONTACT_OBJECT from '@salesforce/schema/Contact';
//import all fields needed from account
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import MOBILEPHONE_FIELD from '@salesforce/schema/Contact.MobilePhone';
import OWNER_FIELD from '@salesforce/schema/Contact.OwnerId';

export default class LightningRecordViewFormAccount extends LightningElement {
    objectName = CONTACT_OBJECT;
    recordId="0038c00002nwtH2AAI";
    //we cannot use array since we cannot call them sperately in HTML, using getter ofr each would be lenght, so instaed prep an onject and use name as key
    fields = {
        name: NAME_FIELD,
        accountId: ACCOUNTID_FIELD,
        email: EMAIL_FIELD,
        title: TITLE_FIELD,
        phone: PHONE_FIELD,
        mobile: MOBILEPHONE_FIELD,
        ownerId: OWNER_FIELD
    }
}