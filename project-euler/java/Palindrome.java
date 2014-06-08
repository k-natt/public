public class Palindrome
{
	public static boolean is(String s)
	{
		//int max = s.length() - 1;
		//for(int i = 0; i < max; i++) {
		//	if(s.charAt(i) != s.charAt(max - i)) {
		//		return false;
		//	}
		//}
		//return true;
		int l = 0, r = s.length() - 1;
		while(l < r) {
			if(s.charAt(l++) != s.charAt(r--)) {
				return false;
			}
		}
		return true;
	}

	public static void main(String[] args) {
		if(args.length > 0) {
			System.out.println(is(args[0]));
		}
	}
}
