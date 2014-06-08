public class PE
{
	static int getN(String[] args, int dfl)
	{
		int N = dfl;
		if(args.length > 0) {
			try {
				N = Integer.parseInt(args[0]);
			} catch(Exception e) {
				System.err.printf("Could not parse '%s'\n",
					       			args[0]);
			}
		}
		return N;
	}

	static long getN(String[] args, long dfl)
	{
		long N = dfl;
		if(args.length > 0) {
			try {
				N = Long.parseLong(args[0]);
			} catch(Exception e) {
				System.err.printf("Could not parse '%s'\n",
					       			args[0]);
			}
		}
		return N;
	}
}
