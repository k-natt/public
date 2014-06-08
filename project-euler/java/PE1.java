public class PE1 extends PE
{
	// Find the sum of all the multiples of 3 or 5 below 1000.
	public static void main(String[] args)
	{
		int N = getN(args, 1000);
		//int N = 1000;
		//if(args.length > 0) {
		//	try {
		//		N = Integer.parseInt(args[0]);
		//	} catch(Exception e) {
		//		System.err.printf("Could not parse '%s'\n",
		//			       			args[0]);
		//	}
		//}
		int sum = 0;
		for(int i = 0; i < N; i++) {
			if(i % 3 == 0 || i % 5 == 0) {
				sum += i;
			}
		}
		System.out.println(sum);
	}
}
