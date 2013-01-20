package br.com.pub.test.collection;

import java.util.ArrayList;
import java.util.List;

public class TesteCollection {
	
	public static void main(String[] args) {
		
		List<Integer> intList = new ArrayList<Integer>();
		intList.add(1);
		intList.add(2);
		intList.add(3);
		
		List<Integer> newIntList = intList;
		newIntList.add(4);
		newIntList.add(5);
		
		for (Integer integer : newIntList) {
			System.out.println(integer);
		}
	}
}
