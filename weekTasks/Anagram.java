package weekTasks;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Anagram {
	public static List<Integer> findAnagrams(String s, String p) {
		List<Integer> result = new ArrayList<>();
		if (s.length() < p.length()) {
			return result;
		}
		int[] pCount = new int[26]; // Frequency count for string p
		int[] sCount = new int[26]; // Frequency count for the current window in s

		for (char c : p.toCharArray()) {
			pCount[c - 'a']++;
		}
		int pLen = p.length();

		// Populate sCount for the first window
		for (int i = 0; i < pLen; i++) {
			sCount[s.charAt(i) - 'a']++;
		}

		// Check the first window
		if (Arrays.equals(pCount, sCount)) {
			result.add(0);
		}

		// Sliding window process
		for (int i = pLen; i < s.length(); i++) {
			// Remove the leftmost character from the window
			sCount[s.charAt(i - pLen) - 'a']--;

			// Add the new character to the window
			sCount[s.charAt(i) - 'a']++;

			// Compare frequency arrays
			if (Arrays.equals(pCount, sCount)) {
				result.add(i - pLen + 1);
			}
		}

		return result;
	}

	public static void main(String[] args) {
		String s = "cbaebabacd";
		String p = "abc";
		System.out.println(findAnagrams(s, p)); // Output: [0, 6]
	}

}
