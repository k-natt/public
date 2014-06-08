import java.util.List;
import java.util.Arrays;

// Any (?) interface with precisely one abstract method 
// can be implemented as a lambda.
interface Callable
{
	void foo();
}
interface Mapping<S,T>
{
	T map(S s);
}

public class Lambda
{
	// To receive a lambda, use the interface you want the lambda to follow.
	public static void call(Callable func) {
		// To call the lambda, just call the interface's function.
		func.foo();
	}
	public static <S,T> T map(S s, Mapping<S,T>mapper)
	{
		return mapper.map(s);
	}
	public static int addsome(int x)
	{
		System.out.println("Adding");
		return x + 25;
	}
	public static void main(String[] args)
	{
		Integer[] vals = {1, 2, 3, 4, 5};
		List<Integer> lst = Arrays.asList(vals);

		// To create a lambda, use (arg list) -> { body }.
		// Types may be dropped in most cases;
		// Parens may be dropped if there is only one arg;
		// Braces may be dropped if there is only one stmt.
		lst.forEach(x -> System.out.println(x));

		// A function may be passed directly using instance::method;
		// A static method uses class:method.
		lst.forEach(System.out::println);

		//call(()->System.out.println("Called"));
		//System.out.println(map(5, x-> x+1));
		//call(System.out::println);
		//System.out.println(map(5, Lambda::addsome));
	}
}
