import java.util.ArrayList;

public class Factors extends PE
{
	public static long[] of(long N)
	{
		ArrayList<Long> facts = new ArrayList<Long>();
			long cf = 2;
			long max = (long)Math.sqrt(N) + 1;
			while(N > max) {
				if(N % cf == 0) {
					facts.add(cf);
					N /= cf;
				} else {
					cf++;
				}
			}
			if(N > 1) {
				facts.add(N);
			}
			long[] ary = new long[facts.size()];
			for(int i = 0; i < facts.size(); i++) {
				ary[i] = facts.get(i);
			}
			return ary;
	}
	public static void main(String[] args)
	{
		long N = getN(args, 1l);
		for(long f : Factors.of(N)) {
			System.out.println(f);
		}
	}
}
