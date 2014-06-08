public class Fibber
{
	int a, b;

	Fibber()
	{
		this(1, 1);
	}

	Fibber(int a, int b)
	{
		this.a = a;
		this.b = b;
	}

	int next()
	{
		int c = a + b;
		a = b;
		b = c;
		return c;
	}
}
