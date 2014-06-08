public class PE3 extends PE
{
	public static void main(String[] args)
	{
		long N = getN(args, 600851475143l);

		long[] facts = Factors.of(N);

		if(facts.length > 0) {
			System.out.println(facts[facts.length-1]);
		}
	}
}
