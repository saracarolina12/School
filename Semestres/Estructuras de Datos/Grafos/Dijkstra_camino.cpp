#include<bits/stdc++.h>
using namespace std;
#define inf 10000000
#define N 101

int main(){
		int n, m, a, b, k, x, z; //num escuelas y caminos
		long long visited[N], D[N], P[N];
		cin>>n>>m;
		for(int i=0; i<n; i++)
			D[i]=inf;	
		memset(P,-1,sizeof(P));
		memset(visited, 0,sizeof(visited));
		int mat[N][N];
		for(int i=0; i<n; i++){
			for(int j=0; j<n; j++)
				mat[i][j] = inf;
		}
		for(int i=0; i<m; i++){
			cin>>a>>b>>k;  //costo k entre a->b
			mat[a][b] = k;
			mat[b][a] = k;
		}
		cin>>x>>z;
		D[x] = 0;
		
		int c=0, mn=100000;
		for(int i=0; i<n; i++){
			mn=100000;
			for(int j=0; j<n; j++){
				if(visited[j] == 0 && D[j] < mn){
					mn = D[j];
					c = j;
				}
			}
			visited[c] = 1;
			for(int j=0; j<n; j++){
				if(visited[j] == 0 && D[c] + mat[c][j] < D[j]){
					D[j] = D[c] + mat[c][j];
					P[j] = c;
				}
			}
			
		}
		cout<<D[z]<<endl;
		int num=z;
		vector<int> v;
		for(int i=0; i<n; i++){
			if(P[num] != -1){
				v.push_back(num);
				num = P[num];
			}else break;
		}
		cout<<x<<" ";
		reverse(v.begin(),v.end());
		for(int i=0; i<int(v.size()); i++){
			cout<<v[i]<<" ";

		}
		
	return 0;
}
