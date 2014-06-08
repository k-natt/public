class FibGen
{
  var a = 0;
  var b = 1;
  def next : Int = {
    val c = a + b;
    a = b;
    b = c;
    return c;
  }
}
