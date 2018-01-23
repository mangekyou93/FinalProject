//������ �Լ��� �̿��ؼ� Arraylist �����
 ArrayList = function arrayList(){
  
  this.list=[]; //�����͸� ������ �� �ִ� �迭�� ����ʵ�� �����Ѵ�.
  //���ڷ� ���޵Ǵ� �����͸� �����ϴ� �Լ�
  
  this.add = function(item){
   //���ڷ� ���޵� �����͸� �ڱ� �ڽ��� �ʵ忡 ����
   this.list.push(item);
  };
  
  //���ڷ� ���޵Ǵ� �ش� �ε����� ���� ���� �ϴ� �Լ�
  this.get = function(index){
   return this.list[index];
  };
  
  //���ڷ� ���޵Ǵ� �ش� �ε����� ���� �����ϴ� �Լ�
  this.removeAll = function(){
   this.list=[]; //�� �迭�� �����ؼ� �����ϴ� ȿ���� �ش�
  };
  
  //���� ����� ũ�⸦ �����ϴ� �޼ҵ�
  this.size = function(){
   return this.list.length;
  };
   
  this.remove = function(index){
   //���ο� �迭�� ����
   var newList=[];
   //�ݺ����� ���鼭 ���ڷ� ���޵� �ε����� ������ ��� ��Ҹ� �� �迭�� ��´�.
   for(var i=0;i<this.list.length;i++){
    if(i!=index){ //������ �ε����� �ƴ϶��
     newList.push(this.list[i]);
    };
   };
   //���� ���� �迭�� ��� �ʵ忡 �����Ѵ�.
   this.list = newList;
  };
 };