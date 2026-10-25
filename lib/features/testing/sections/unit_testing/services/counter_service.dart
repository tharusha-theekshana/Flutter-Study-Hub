class CounterService {
  int _count = 0;

  // Getter
  int get count => _count;

  // Increment count by 1
  void incrementCount() {
    _count++;
  }

  // Decrement count by 1
  void decrementCount() {
    _count--;
  }
}