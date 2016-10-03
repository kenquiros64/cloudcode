//stack using templates
#include<iostream.h>
#include<iomanip.h>
template<class s>                                ///templats classclass stack
{
      private:
          int top;
          s item;
          s array[5];
      public:
          stack()
          {
              top=-1;
          }
          void getdata()
          {
                  cout<<"enter item to push in stack"<<endl;
                cin>>item;
              
          }
          void push()
          {
              if(top==5)
                  cout<<"overflow"<<endl;
              else
              {
                  top++;
                  array[top]=item;
              }
          }
          void pop()
          {
              if(top==-1)
                  cout<<"underflow"<<endl;
              else
              {
                  array[top]=NULL;
                  
                  top--;
              }
          }
          void disp()
          {
               for(int i=0;i<=top;i++)
               {
                     cout<<array[i]<<'\t';
               }
                cout<<endl;
          }
};
int main()
{
    stack<int>stacki;
    stack<char>stackc;
    int r;
    char ch;
    do
    {
        cout<<"integer array"<<endl;
        cout<<"press 1 to push element in stack & 2 to pop it"<<endl;  
        cout<<"    3 to display stack"<<endl;
        cin>>r;
        switch (r)
        {
          case 1:
               stacki.getdata();
               stacki.push(); 
               break;
          case 2:
                stacki.pop();
                break;
          case 3:
                stacki.disp();
                break;
          default:
            cout<<"bad input"<<endl;
            break;
        }
        cout<<"do you want to process more y/n"<<endl;
        cin>>ch;
    }
    while(ch!='n');
do
{    
    cout<<"character array"<<endl;
        cout<<"press 1 to push element in stack & 2 to pop it"<<endl;  
        cout<<"    3 to display stack"<<endl;
        cin>>r;
        switch (r)
        {
          case 1:
               stackc.getdata();
               stackc.push(); 
               break;
          case 2:
                stackc.pop();
                break;
          case 3:
                stackc.disp();
                break;
          default:
            cout<<"bad input"<<endl;
            break;
        }
        cout<<"do you want to process more y/n"<<endl;
        cin>>ch;
    }
    while(ch!='n');

    return 0;
}
