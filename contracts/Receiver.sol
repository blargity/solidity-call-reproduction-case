pragma solidity 0.4.24;

contract Receiver {
    event TokenFallbackCalled(address from, uint amount, bytes data);

    function tokenFallback(address from, uint amount, bytes data) public {
        emit TokenFallbackCalled(from, amount, data);
    }
}