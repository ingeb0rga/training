text = "fgjg g'sdpdrtgkhg ghsdo[kth] hdf'okhdfgh"

def generate_hashtag(s):
    hashtag = f'#{s.strip().title().replace(" ", "")}'
    return hashtag if s and len(hashtag) <= 140 else False

print(generate_hashtag(text))