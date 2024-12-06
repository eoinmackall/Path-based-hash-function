from sage.schemes.affine.affine_rational_point import enum_affine_finite_field

#Initializing finite field on 47 elements
k=GF(47)

#Defining solution space to polynomial, enumerating points in space
A.<x0,x1,x2>=AffineSpace(3,k)
S=A.subscheme([(x0)^2+(x1)^2+(x2)^2-3*x0*x1*x2])
print(enum_affine_finite_field(S))