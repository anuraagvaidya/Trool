/**
 * Ticket class.
 *
 * created by Sean Maxwell Mar 2, 2019
 */

export type ticketOpts = 'Regular' | 'Season' | null;

class Ticket {

    private _option: ticketOpts;
    private _price: number;
    private _freeTshirt: boolean;


    constructor(option: ticketOpts) {
        this._option = option;
        this._price = 0;
        this._freeTshirt = false;
    }

    set option(option: ticketOpts) {
        this._option = option;
    }

    get option(): ticketOpts {
        return this._option;
    }

    set price(price: number) {
        this._price = price;
    }

    get price(): number {
        return this._price;
    }

    set freeTshirt(freeTshirt: boolean) {
        this._freeTshirt = freeTshirt;
    }

    get freeTshirt(): boolean {
        return this._freeTshirt;
    }


    public toString(): string {

        return `Ticket Option: ${this.option} | ` +
             `Ticket Price: ${this.price} | ` +
             `Free T-Shirt: ${this.freeTshirt}`;
    }
}

export default Ticket;
