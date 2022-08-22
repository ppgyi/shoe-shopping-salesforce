import { api, LightningElement } from 'lwc';

export default class Filter extends LightningElement {

    @api filterBy;
    @api filterText;

    changeHandler(event) {
        this.filterText = event.target.value;

        if(this.filterText == ''){
            this.filterText = undefined;
        }
    }

    changeHandlerSelect(event) {
        this.filterBy = event.target.value;
    }

    clicked(){
        const event = new CustomEvent('clicked', {
            detail: {filterby: this.filterBy, filtertext: this.filterText}
        });
        this.dispatchEvent(event);
    }
}