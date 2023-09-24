import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue : Float = 300;
  //currentValue := 300;
  //Debug.print(debug_show (currentValue));

  let id = 546546;
  //Debug.print(debug_show (id));

  stable var startTime = Time.now();
  Debug.print(debug_show (startTime));
  Debug.print("Hello");

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawl(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("you dont have that much amount of money");
    };
  };

  public func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedS = Float.fromInt(currentTime - startTime) / 1_000_000_000; // Convert nanoseconds to seconds

    // Calculate 1% interest per second (compounded continuously)
    let interestRatePerSecond = 0.01 / 1.0; // 1% per second
    currentValue := currentValue * (1.0 + interestRatePerSecond) ** timeElapsedS;

    startTime := currentTime;
  };
};
