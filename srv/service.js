const csd = require('@sap/cds');
const cpi = require('./cpi');
const wf = require('./wf');

module.exports = cds.service.impl(async function() {
    let { BookOrders } = this.entities;

    this.before('CREATE', 'BookOrders', async (req) => {
        const { maxID } = await SELECT.one`max(bookOrderID) as maxID`.from(BookOrders);
        req.data.bookOrderID = maxID + 1;
    });

    this.on('approveBook', 'BookOrders', wf.approveBook);
    this.on('sendBook', 'BookOrders', cpi.sendBook);
})