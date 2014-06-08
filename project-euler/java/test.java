public class test
{
	public static int unbox(Integer i)
	{
		return i;
	}

	public static void main(String[] args)
	{
		int i = unbox(null);
		System.out.println(i);
	}
}
