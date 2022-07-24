import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeleteRecord extends LightningElement {
    recordId;

    changeHandler(event){
        this.recordId=event.target.value;
    }

    deleteRecord(){
        this.deleteRecord(this.recordId)
            .then(result => {
                console.log(result);
                this.displayToast("Success", "Your record has been deleted successfully", "success");
            })
            .catch(error => {
                console.error(error);
                this.displayToast("Error", error.body.message, "error");
            })
    }

    displayToast(title, message, variant){
        const toast = new ShowToastEvent ({
            title, message, variant
        });
        this.dispatchEvent(toast);
    }
}