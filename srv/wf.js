const cds = require('@sap/cds');
const constants = require('./constants');

module.exports = {
    approveBook: approveBook
}

const { BookOrders } = cds.entities('epam.sap.dev.orderbook')

async function approveBook(req) {
    try {
        const { orderUUID } = req.params[0];
        let query = cds.read(BookOrders).where({ orderUUID: orderUUID })
        let instance = await cds.run(query)
        let status_ID = instance[0].status_ID;
        if (status_ID == "1" || status_ID == "4") {
            let price = parseFloat(instance[0].price)
            let totalPrice = parseFloat(instance[0].totalPrice)
            let totalLocal = parseFloat(instance[0].totalLocal)
            const workflow = await cds.connect.to('workflowService')
            await workflow.tx(req).post(
                '/rest/v1/workflow-instances',
                {
                    "definitionId": "approvebookorder",
                    "context": {
                        "WorkflowDetails": {
                            "title": "Book(s) in order",
                            "comment": "Please Approve"
                        },
                        "BookOrder": {
                            "orderUUID": orderUUID,
                            "bookName": instance[0].bookName,
                            "authorfirstName": instance[0].authorfirstName,
                            "authorlastName": instance[0].authorlastName,
                            "CurrencyCode_code": instance[0].CurrencyCode_code,
                            "LocalCurrencyCode_code": instance[0].LocalCurrencyCode_code,
                            "price": price,
                            "quantity": instance[0].quantity,
                            "status_ID": status_ID,
                            "totalPrice": totalPrice,
                            "totalLocal": totalLocal
                        }
                    }
                }
            )
            return UPDATE(BookOrders, orderUUID).with({ status_ID: "5" })
        }
        else if (status_ID == "5") {
            req.error(400, constants.genericErrors.processingOrder)
        }
        else req.error(400, constants.genericErrors.orderApproved)

    }
    catch (error) {
        console.log("Error of the WF instance creation: ", error)
    }
}