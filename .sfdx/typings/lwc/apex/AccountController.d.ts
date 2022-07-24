declare module "@salesforce/apex/AccountController.getBiotechAccounts" {
  export default function getBiotechAccounts(): Promise<any>;
}
declare module "@salesforce/apex/AccountController.getAccsByType" {
  export default function getAccsByType(param: {type: any}): Promise<any>;
}
declare module "@salesforce/apex/AccountController.getAccountsByIndustry" {
  export default function getAccountsByIndustry(param: {industry: any}): Promise<any>;
}
