
# Wikipedia:
# Als Anagramm wird eine Buchstabenfolge bezeichnet, die aus einer anderen Buchstabenfolge
# allein durch Umstellung (Permutation) der Buchstaben gebildet ist, z. B. ist Erbgut ein Anagramm zu Betrug.

# Schreibe eine Python-Methode, die einen String-Parameter als Input hat und ein Dictionary mit allen Anagramm-Wörter je Wort des Input-Strings ausgibt, z.B.:

# text = 'hey restful iron rated are fluster puppet task trade cheater coronavirus tread carnivorous dater teacher'
# a = get_anagramms(text)
# print(a)
# {'cheater': {'teacher'},
#  'coronavirus': {'carnivorous'},
#  'rated': {'dater', 'tread', 'trade'},
#  'restful': {'fluster'}}

def get_anagrams(text):
    # Split the text into a list of words
    words = text.split()

    # Create an empty dictionary to store the anagrams
    anagrams = {}

    # Loop through each word in the list
    for word in words:
        # Sort the letters of the word
        sorted_word = ''.join(sorted(word))

        # If the sorted word is already in the dictionary, add the word to its set of anagrams
        if sorted_word in anagrams:
            anagrams[sorted_word].add(word)
            
        # Otherwise, create a new entry in the dictionary for the sorted word and its anagram set
        else:
            anagrams[sorted_word] = {word}

    # Filter out any sorted words that don't have more than one anagram
    anagrams = {k: v for k, v in anagrams.items() if len(v) > 1}

    # Create a new dictionary with the original words as keys and the anagram sets as values
    result = {list(v)[0]: v - {list(v)[0]} for v in anagrams.values()}

    return result
    
    
text = 'hey restful iron rated are fluster puppet task trade cheater coronavirus tread carnivorous dater teacher'
a = get_anagrams(text)
print(a)
