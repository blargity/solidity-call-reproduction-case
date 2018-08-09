const Caller = require('Embark/contracts/Caller');
const Receiver = require('Embark/contracts/Receiver');

config({
  contracts: {
    "Caller": {
      deploy: true,
    },
    "Receiver": {
      deploy: true,
    },
  },
}, (err, theAccounts) => {
  accounts = theAccounts;
});


contract("Caller", function () {
  this.timeout(0);

  it("should call tokenFallback on receiver", async function () {
    await Caller.methods.call(Receiver.address).send();

    const events = await Receiver.getPastEvents('TokenFallbackCalled', { fromBlock: 0, toBlock: 'latest' });
    const eventParameters = events[0].returnValues;
    assert.equal(eventParameters.amount, '100', 'Amount was not correctly passed through to receiver');
  });
});
