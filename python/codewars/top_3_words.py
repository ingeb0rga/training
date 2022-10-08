import re
from collections import Counter

# text = "  ''''   "
text = "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"
# text = "  //wont won't won't"

def top_3_words(text):
    text = text.lower()
    if re.findall(r'[a-z]+', text) == []:
        return []
    
    # else:
    #     words = re.findall(r'[a-z\']+', text)
    #     dict = {}
    #     for word in words:
    #         if word in dict:
    #             dict[word] += 1
    #         else:
    #             dict[word] = 1    
    #     return [y for y in sorted(dict, key=dict.get, reverse=True)[:3]]
    
    else:
        words = re.findall(r'[a-z\']+', text)
        result = Counter(words)
        return [k for k,v in result.most_common(3)]


print(top_3_words(text))