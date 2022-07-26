var Parimal_19IT141 = artifacts.require('./parimal_19IT141.sol');

module.exports = function (deployer) {
  deployer.deploy(Parimal_19IT141, 1000000);

  //   .then(function() {
  //     // Token price is 0.001 Ether
  //     var tokenPrice = 1000000000000000;
  //     return deployer.deploy(DappTokenSale, DappToken.address, tokenPrice);
  //   });
};
