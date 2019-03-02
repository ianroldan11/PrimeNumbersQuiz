<%@ WebService Language="C#" Class="PrimeNumbersQuiz.GenericWebService" %>
using System;
using System.Web.Services;
using System.Collections.Generic;
using System.Text;

namespace PrimeNumbersQuiz
{
	class GenericWebService
	{
    [WebMethod]
        public List<int> getPrimeNumbers(int maxNumber){
            // Step 1
            List<int> listOfAllNumbers = new List<int>();
            for (int i = 2; i <= maxNumber; i++){
                listOfAllNumbers.Add(i);
            }
            List<int> listOfPrimeNumbers = new List<int>(listOfAllNumbers);
            
            foreach (int number in listOfAllNumbers){
                if (listOfPrimeNumbers.Contains(number)){
                    // Step 2
                    int primeNumber = number;
                    
                    // Step 3
                    List<int> listOfAllMultiples = new List<int>();
                    for (int i = 2; i*primeNumber <= maxNumber; i++){
                        listOfAllMultiples.Add(i*primeNumber);
                    }
                    
                    foreach (int multiple in listOfAllMultiples){
                        listOfPrimeNumbers.Remove(multiple);
                    }
                }
            }
        
            return listOfPrimeNumbers;
        }
        
        [WebMethod]
            public List<string> performPermutation(string stringtoPermutate){
                 List<string> listToReturn = new List<string>();
                 listToReturn.Add(stringtoPermutate);
                 listToReturn.AddRange(getPermutations("", stringtoPermutate));
                 return listToReturn;
            }
        
            private static List<string> getPermutations(string firstLetters, string str)
            {
                List<string> listToReturn = new List<string>();

                for (int x = 0; x < str.Length; x++)
                {
                    StringBuilder stringBuilder = new StringBuilder(str);
                    char tempChar = stringBuilder[0];
                    stringBuilder[0] = stringBuilder[x];
                    stringBuilder[x] = tempChar;
                    string resultString = firstLetters + stringBuilder;

                    if (!resultString.Equals(firstLetters + str))
                    {
                        listToReturn.Add(resultString);
                    }

                    string newfirstChar = firstLetters + stringBuilder[0];

                    string substr = resultString.Substring(newfirstChar.Length);
                    listToReturn.AddRange(getPermutations(newfirstChar, substr));

                }

                return listToReturn;
            }
	}
}
