
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.Collection;

public class NonUniqueSet <T> implements Collection<T>
{
	int size = 0;
	private Map<T, Integer> counts = new HashMap<T, Integer>();

	ArrayList<T> al;
	boolean dirty;

	public boolean add(T el)
	{
		int count = 0;
		if(counts.containsKey(el)) {
			count = this.counts.get(el);
		}
		this.counts.put(el, count+1);
		this.size++;
		dirty = true;
		return true;
	}

	public boolean addAll(Collection<? extends T>c) 
	{
		for(T x : c) {
			this.add(x);
		}
		return c.size() > 0;
	}

	public void clear() 
	{
		this.counts.clear();
	}

	public boolean contains(Object o) 
	{
		return this.counts.containsKey(o);
	}
	public int countOf(T o)
	{
		if(this.counts.containsKey(o)) {
			return this.counts.get(o);
		} else {
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	public boolean containsAll(Collection<?> c)
	{
		Map<T,Integer> that = new HashMap<T,Integer>();
		for(Object obj : c) {
			int count = 0;
			if(that.containsKey(obj)) {
				count = that.get(obj);
			}
			that.put((T)obj, count+1);
		}
		for(Object obj : c) {
			int thisn = this.countOf((T)obj);
			int thatn = that.get(obj);
			if(thatn > thisn) {
				return false;
			}
		}
		return true;
	}

	public boolean equals(Object o)
	{
		return this.counts.equals(o);
	}

	public int hashCode()
	{
		return this.counts.hashCode();
	}

	public boolean isEmpty()
	{
		return this.counts.isEmpty();
	}

	public Iterator<T> iterator()
	{
		return this.asAL().iterator();
	}

	@SuppressWarnings("unchecked")
	public boolean remove(Object o)
	{
		int count = 0;
		if(this.counts.containsKey(o)) {
			count = this.counts.get(o);
			if(count > 1) {
				this.counts.put((T)o, count - 1);
			} else {
				assert count == 1;
				this.counts.remove(o);
			}
			this.size--;
			dirty = true;
		}
		return count > 0;
	}

	public boolean removeAll(Collection<?> c)
	{
		boolean changed = false;
		for(Object x : c) {
			if(this.remove(x)) {
				changed = true;
			}
		}
		return changed;
	}

	public boolean retainAll(Collection<?> c)
	{
		Map<T, Integer> newc = new HashMap<T, Integer>();
		for(Map.Entry<T,Integer> ent : counts.entrySet()) {
			T obj = ent.getKey();
			int rem = ent.getValue();
			int add = 0;
			while(rem > 0 && c.contains(obj)) {
				c.remove(obj);
				add++;
				rem--;
			}
			newc.put(obj, add);
		}
		boolean diff = !this.counts.equals(newc);
		this.counts = newc;
		return diff;
	}

	public int size()
	{
		return this.size;
	}

	public Object[] toArray()
	{
		return this.asAL().toArray();
	}

	public <T> T[] toArray(T[]x)
	{
		return this.asAL().toArray(x);
	}

	private ArrayList<T> asAL()
	{
		if(this.dirty) {
			this.al = new ArrayList<T>();
			for(Map.Entry<T,Integer> ent : counts.entrySet()) {
				T obj = ent.getKey();
				int c = ent.getValue();
				for(int i = 0; i < c; i++) {
					al.add(obj);
				}
			}
			this.dirty = false;
		}
		return al;
	}

	public boolean intersect(Collection<?> c)
	{
		return this.retainAll(c);
	}

	//public boolean union(Collection<?> c)
	//{
	//	// ?
	//}
}

