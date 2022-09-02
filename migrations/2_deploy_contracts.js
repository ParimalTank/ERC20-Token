// var Parimal_19IT141 = artifacts.require('./parimal_19IT141.sol');

// module.exports = function (deployer) {
//   deployer.deploy(Parimal_19IT141, 1000000);
//   deployer.deploy();

//   //   .then(function() {
//   //     // Token price is 0.001 Ether
//   //     var tokenPrice = 1000000000000000;
//   //     return deployer.deploy(DappTokenSale, DappToken.address, tokenPrice);
//   //   });
// };

const Parimal_19IT141 = artifacts.require('./Parimal_19IT141.sol');
const TokenSale = artifacts.require('./TokenSale.sol');
const tokenPrice = 1000000000000000;

module.exports = function (deployer) {
  deployer.deploy(Parimal_19IT141, 1000000).then(() => {
    return deployer.deploy(TokenSale, Parimal_19IT141.address, tokenPrice);
  });
};
