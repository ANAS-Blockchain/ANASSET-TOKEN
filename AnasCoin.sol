pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract MyToken is IERC20 {
    using SafeMath for uint256;

    string private _name;
    string private _symbol;
    uint8 private _decimals;
    uint256 private _totalSupply;

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    constructor() {
        _name = "AnasCoin";
        _symbol = "ANAS";
        _decimals = 18;
        _totalSupply = 10000000000 * (10**uint256(_decimals));
        _balances[msg.sender] = _totalSupply;
    }

    contract MyContract {
    using SafeMath for uint256;

    uint256 public myNumber;

    function safeAdd(uint256 a, uint256 b) public {
        myNumber = a.add(b);
    }

    function safeSub(uint256 a, uint256 b) public {
        myNumber = a.sub(b);
    }

    function safeMul(uint256 a, uint256 b) public {
        myNumber = a.mul(b);
    }

    function safeDiv(uint256 a, uint256 b) public {
        myNumber = a.div(b);
    }
}


    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);

        emit Transfer(sender, recipient, amount);
    }

    // Other ERC20 functions like allowance, approve, and transferFrom can be implemented here
}
