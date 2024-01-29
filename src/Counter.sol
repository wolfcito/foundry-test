// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import '@openzeppelin/contracts/utils/Address.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol';

contract ModeSpray is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    address public constant SFS_CONTRACT =
        0xBBd707815a7F7eb6897C7686274AFabd7B579Ff6;
    event EtherDispersed(
        address indexed sender,
        address[] recipients,
        uint256[] values
    );

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) public initializer {
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();

        Register sfsContract = Register(SFS_CONTRACT);
        sfsContract.register(owner());
    }

    function disperseEther(
        address[] calldata _recipients,
        uint256[] calldata _values
    ) external payable {
        require(_recipients.length == _values.length, 'Array length mismatch');

        for (uint256 i = 0; i < _recipients.length; i++) {
            Address.sendValue(payable(_recipients[i]), _values[i]);
        }

        emit EtherDispersed(msg.sender, _recipients, _values);
    }

    function disperseToken(
        address tokenAddress,
        address payable[] calldata recipients,
        uint256[] calldata values
    ) external {
        IERC20 token = IERC20(tokenAddress);
        uint256 total = 0;
        for (uint256 i = 0; i < recipients.length; i++) total += values[i];
        require(token.transferFrom(msg.sender, address(this), total));
        for (uint256 i = 0; i < recipients.length; i++)
            require(token.transfer(recipients[i], values[i]));
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}

contract Register {
    function register(address _recipient) public returns (uint256 tokenId) {}
}
