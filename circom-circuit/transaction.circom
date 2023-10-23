pragma circom 2.0.0;

template Transaction () {
  signal input balanceInSender;
  signal input balanceInReceiver;
  signal input amount;

  signal output balanceOutSender;
  signal output balanceOutReceiver;

  assert(balanceInSender >= amount);

  balanceOutSender <== balanceInSender - amount;
  balanceOutReceiver <== balanceInReceiver + amount;
}

// component main {public [balanceInSender, balanceInReceiver, amount]} = Transaction();
component main = Transaction();
