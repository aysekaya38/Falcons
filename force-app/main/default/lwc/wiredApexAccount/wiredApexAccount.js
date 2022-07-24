import { LightningElement, wire } from 'lwc';
import getBiotechAccounts from '@salesforce/apex/AccountController.getBiotechAccounts';

//to display the data in lightining data table, so we need to store each field and value seperately
const COLUMNS = [
    {label: "Account Name", fieldName: "Name", type:"text"}, //if typs is text, no need to have
    {label: "Account Type", fieldName: "Type", type:"text"},
    {label: "Industry", fieldName: "Industry", type:"text"},
    {label: "Annual Revenue", fieldName: "AnnualRevenue", type:"currency"},
]

export default class WiredApexAccount extends LightningElement {
    accounts;
    columns = COLUMNS;

    @wire(getBiotechAccounts) //no need for input parameter for now

      accountHandler({data, error}) {
          if(data){
              this.accounts = data; //store the data here
          }
      }
    }