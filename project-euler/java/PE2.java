public class PE2 extends PE
{
	public static void main(String[] args)
	{
		// sum of even fib's <= 4M
		int N = getN(args, 4000000);
		Fibber fib = new Fibber();
		int sum = 0;
		int x;
		while((x = fib.next()) <= N) {
			if(x % 2 == 0) {
				sum += x;
			}
		}
		System.out.println(sum);
	}
}
