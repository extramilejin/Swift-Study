//
//  main.cpp
//  barn painting
//
//  Created by 오현식 on 2021/01/16.
//
#include <iostream>
#include <vector>

#define MODULO (1000000000+7)

using namespace std;

int N, K;
vector<int> tree[100001];
int dp[100001][4];
int alreadyPainted[100001];

int go(int prev, int now, int color)    // 루트노드 now를 color로 칠할 때, 해당 트리를 칠할 수 있는 경우의 수
{
    if(dp[now][color]!=0)   return dp[now][color];  //  다른 큰 문제를 풀면서 이미 구했던 경우: memoization
    for(int i=0;i<tree[now].size();i++) // 자식노드가 이미 칠해져 있는 경우
    {
        if(alreadyPainted[tree[now][i]]!=0 && alreadyPainted[tree[now][i]]==color)  return 0;
    }
    if(alreadyPainted[now]!=0 && alreadyPainted[now]!=color)    return 0;  // 루트노드가 다른 색으로 이미 칠해져 있는 경우
    if(now!=1 && tree[now].size()<=1 && alreadyPainted[now]==0)// 가장 작은 크기의 문제, 즉 리프 노드인 경우 *** 루트 노드가 포함되어서는 안된다 ***
    {
        dp[now][color]=1;
        return  dp[now][color];
    }
    
    long long mul=1;
    for(int i=0;i<tree[now].size();i++)
    {
        int sum=0;
        if(tree[now][i]==prev)  continue;   // 자식 서브트리에 대해서 부분문제 설정
        for(int c=1;c<=3;c++)   // 서브트리의 루트노드를 3가지 방법으로 칠하는 부분문제
        {
            if(c!=color)    sum+=go(now,tree[now][i],c);    //  서브트이의 루트를 루트노드와 다른 색으로 칠함
            sum%=MODULO;
        }
        mul*=sum;
        mul%=MODULO;
    }
    dp[now][color]=(int)mul;
    return dp[now][color];
}

int main(int argc, const char * argv[]) {
    int answer=0;
    int u, v;
    int b, c;
    cin>>N>>K;
    for(int i=1;i<=N-1;i++)
    {
        cin>>u>>v;
        tree[u].push_back(v);
        tree[v].push_back(u);
    }
    for(int i=1;i<=K;i++)
    {
        cin>>b>>c;
        alreadyPainted[b]=c;
    }
    for(int c=1;c<=3;c++)
    {
        answer+=go(0,1,c);
        answer%=MODULO;
    }
    cout<<answer;
    return 0;
}
