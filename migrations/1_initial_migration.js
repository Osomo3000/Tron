var Migrations = artifacts.require("./VendingMachine.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
