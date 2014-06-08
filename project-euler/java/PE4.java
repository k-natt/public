public class PE4 extends PE
{
	public static void main(String[] args)
	{
		int N = getN(args, 1000);

		int max = 0;
		int min = N/10;
		int x = 0, y = 0;

		for(int a = N - 1; a > min; a--) {
			for(int b = a; b > N / 10; b--) {
				int p = a * b;
				if(p > max && Palindrome.is(Integer.valueOf(p).toString())) {
					max = p;
					min = (int)Math.sqrt(p);
					x = a;
					y = b;
				}
			}
		}
		System.out.printf("%d * %d = %d\n", x, y, max);
	}
}
