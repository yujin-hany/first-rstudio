# 02 Data Object in R : part2

#1.1> LIST : object chain that can have different types(similar concept as list in python)
j<-list(name='Joe', salary=5000, union=TRUE)  # length:3, consists of character vector,numeric vector, and logical vector
j              # each nodes has their names:name, salary, and union

jn<-list('JOE', 5500,TRUE) # can be defined without any name of nodes
jn

jini<-vector(mode='list', length=10) # can be defined without any data object
jini        # length=10 인 리스트 생성인데  name of nodes 없고 값 모두 NULL인 length=10

jin<-list(length=10)  # not same as jini : 이건 name of node가 length, 값이 10 인 길이 1인 리스트
jin
typeof(jin)

#1.2> call the components in the list
j$salary
j[['salary']] #use name of node to get the component, HAS TO BE ' ' 
j[[2]]  # use index to get the component

#1.3> Add component
j$history<-1:10
j$history
typeof(j$history)
j
j[[1]]<-'Yoon'
j

#2. FACTOR : an ordered integer valued vetor having a name(=level)
#2.1> factor
x<-c(5,12,13,12)
xf<-factor(x)  # 5,12,13,12  becomes factor, used in discrete data & unique value of factor&
           #  5,12,13 is level which is unique value of factor : useful for dummy codiinf in categorical data analysis

xf
#2.2> structure of factor
str(xf) # level& factor's index : 1 2 3 2
unclass(xf) # without expressing as level, print value that matches to the constant of attribute
  # 레벨 표현 없이 클래스 특징을 없애고 attribute에 따라 상수에 매칭되는 데이터값 출력 

as.numeric(xf) # 1 2 3 2 (level/factor's index)

#2.3> defining levels in factor
xff<-factor(x, levels=c(5,12,13,88)) # x is c(5,12,13,12)
xff   #make factor by defining levels as attribute  
x

#2.4> table function
x1<-c(4,2,3,3,2,2) 
table(x1) #express frequency as table : 오름차 순으로 2 3 4 의 빈도수가 각 나옴 
x2<-c('a','b','a','a','b','b')
table(x2)
x3=data.frame(x1=x1,x2=x2)
table(x3) # make table for frequency of pair between x1 and x2 

#3. CASTING :changing task of class or the type of element : 클래스나 요소의 타입 변경
#3.1> class of objects
A=data.frame(x1=rep(0,2), x2=rep('b',2))
B=data.frame(x3=rep(1,2), x2=rep('d',2))
AB=cbind(A,B)
AB=rbind(A,B) #error because names do not match previous names
head(AB)

A=data.frame(x1=rep(0,2), x2=rep('b',2))
B=data.frame(x1=rep(1,2), x2=rep('d',2))
AB=rbind(A,B)
head(AB)

#changing the typeof element
a=0L     
typeof(a)  #integer
a[2]=1
a
typeof(a[1]) # integer => double

# changing task of class
a=matrix(1:10,5,2)   
b=a[,-1]
class(a)  #"matrix"  "array"
b
class(b)   #" integer"

a=matrix(1:10, 5,2)
b=a[,-1, drop=FALSE]  # class: "matrix" "integer"
b            
b<-a[,-1] # class: integer
b
class(b)  #matrix

#from matrix to vector : c()
a=matrix(1:10,5,2)
b=c(a)  #from matrix to vector : c()
class(a)
class(b)
class(str(b))

#from vector to factor: as.factor()
a=c("tommy", "jimmy","jane")
b=as.factor(a) # levels are given in alphabetical order : jane jimmy tommy
b
c(b) # factor=> integer vector  : 3 2 1 (jane jimmy tommy in index)


#list/data.frame -> vector:unlist()
a=list()
for (i in 1:5) a[[i]]=i # 1번째 리스트 요소는 1, 5번째 리스트 요소는 5
a    #same as a=list(1,2,3,4,5)
b=unlist(a)
b
class(b)

a=list(1,2,3,4,5)
a  # 1번째 리스트 요소는 1, 5번째 리스트 요소는 5

a=list(1:5)
a  # 1번째 name of node의 요소가 1 2 3 4 5인 리스트
class(a)


#vector->matrix: as.matrix() (=column vector)
a=1:3
b=as.matrix(a)
b


#matrix->data.frame: as.data.frame()
a=matrix(1:10,5,2)  # 각 컬럼/로우이름이 [[,1]], [[1,]] 임
a
str(a) # 1 2 3 4 5 6 7 8 9 10 이 int로 나옴.
b=as.data.frame(a) #각 컬럼명은 V1,V2 이고 로우명은 1 2 3 4 5로 정수임.
b
str(b) #각 컬럼별로 나눠서 v1 : 1 2 3 4 5 v2: 6 7 8 9 10 으로 나옴.

#data.frame ->list:unclass()
a=matrix(1:10,5,2)
class(a)  # "matrix" "array"
b=as.data.frame(a)
b=unclass(b)#unclass returns (a copy of) its argument with its class information removed.
b
class(b)  # list 
### dataframe is a list object with double array indices. ( 더블 어레이 인덱스들로 이뤄진 리스트 객체 )
# 즉 데이터프레임 자체가 리스트 객체라서 unclass 해도 리스트임.

# casting function(type of elements)
dbl_var <- c(1, 2.5, 4.5)  
dbl_var 
typeof(dbl_var) #double

int_var <- c(1L, 6L, 10L)
int_var  
typeof(int_var)  #integer

as.character(dbl_var) # "1" "2.5" "4.5"
typeof(as.numeric(int_var))  # int_var 생긴건 똑같이 1 6 10 but typeof() 하면 double
typeof(as.double(int_var)) # int_var 생긴건 똑같이 1 6 10 but typeof() 하면 double
