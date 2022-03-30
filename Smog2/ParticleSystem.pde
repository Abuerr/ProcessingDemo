import java.util.Iterator;

class ParticleSystem {
  ArrayList<Particle> particles;//声明粒子数组列表
  PVector origin;
  ParticleSystem(PVector l) {
    origin = l.get();
    particles = new ArrayList<Particle>();//初始化粒子数组列表
  }

  //增加粒子数组列表的粒子
  void addParticle() {
    particles.add(new Particle(origin));
  }

  //
  void run() {
    Iterator<Particle> it = particles.iterator(); 
    /*自己的理解：粒子类型的迭代器声明为it，初始化为particles.iterator(),
     *即列表中每个粒子对象都调用iterator()方法
     */
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();//除去消亡的粒子对象
      }
    }
  }
  //给粒子系统增加风力
  void applyForce(PVector dir) {
    //不知道什么意思，感觉是遍历数组列表里面的粒子对象
    for (Particle p : particles) {
      p.applyForce(dir);
    }
  }
}
