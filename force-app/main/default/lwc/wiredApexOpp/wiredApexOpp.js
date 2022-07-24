import { LightningElement, wire } from 'lwc';
import getOverMillionOpp from '@salesforce/apex/OpportunityController.getOverMillionOpp';

const COLUMNS = [
    {label: "Name", fieldName: "Name", type:"text"},
    {label: "Amount", fieldName: "Amount", type:"currency"},
    {label: "Stage", fieldName: "StageName", type:"text"},
    {label: "Type", fieldName: "Type", type:"text"}, 
]

export default class WiredApexOpp extends LightningElement {
    columns = COLUMNS;
    opps;
    @wire(getOverMillionOpp)

    oppHandler({data, error}){
        if(data){
            this.opps = data;
        }
        if(error){
            console.error(error);
        }
    }
}