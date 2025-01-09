def r(i,T,p):
    """Calculates involution changing ith index (mod 3) on Markoff triple T=(x,y,z) mod p"""
    
    (x,y,z)=(T[0],T[1],T[2])

    w0 = (3*y*z - x) % p
    w1 = (3*x*z-y) % p
    w2 = (3*x*y-z) % p
    
    if i % 3 == 0:
        return (w0,y,z)
    if i % 3 == 1:
        return (x,w1,z)
    if i % 3 == 2:
        return (x,y,w2)


def Markoff_hash(s, n=2, p=(2**127) - 1):
    """Hash function converting string to Markoff triple"""
    
    bit_line=''.join(format(ord(char), 'b') for char in s)
    point = (1,1,1)
    c=n % 3

    for i in range(len(bit_line)):
        c = ((c+int(bit_line[i])) % 3)+1
        point = r(c,point,p)

    return point