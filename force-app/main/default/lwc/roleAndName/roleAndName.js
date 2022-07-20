
import { LightningElement } from 'lwc';


export default class RoleAndName extends LightningElement {
    name;
    role;


handleChange(event) {
    this.name = event.target.value;
}

changeHandler(event) {
    this.role = event.target.value;
    
}

get roleChange(){
    return [
        {label: "Admin", value: "Admin"},
        {label: "Developer", value: "Developer"},
        {label: "Architect", value: "Architect"}
    ];
}
}