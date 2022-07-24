import { LightningElement } from 'lwc';
import getAccsByType from '@salesforce/apex/AccountController.getAccsByType';

const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type: "text"},
    {label: "Account Type", fieldName: "Type", type: "text"},
    {label: "Industry", fieldName: "Industry", type: "text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type: "currency"}
];

export default class ImperrativeApexSearchAccounts extends LightningElement {
    columns = COLUMNS;
    selectedIndustry;
    accounts;
    errors;

    get industryOptions(){
        return [
            {label:"Agriculture", value:"Agriculture"},
            {label:"Banking", value:"Banking"},
            {label:"Biotectnology", value:"Biotectnology"},
            {label:"Consulting", value:"Consulting"},
        ];
    }

    changeHandler(event){
        this.selectedIndustry = event.target.value;

       getAccsByType({industry: this.selectedIndustry})
        .then(result => {
            this.accounts = result;
            if(this.accounts.length == 0){
                this.error = "No account for searched type."
            } else {
                this.error;
            }

        })
        .catch(error => {
            this.error = error.body.message;
            this.accounts = undefined;
        })


    }
}