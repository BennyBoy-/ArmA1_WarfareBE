//Last modified 4/16/8
Private["_fire","_smoke1","_smoke2"];

_fire = "#particlesource" CreateVehicle GetPos _this;
_fire SetParticleCircle [0,[0,0,0]];
_fire SetParticleRandom [0.2,[1,1,0],[0.5,0.5,0],1,0.5,[0,0,0,0],0,0];
_fire SetParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d",8,2,6],"","Billboard",1,1,[0,0,0],[0,0,0.5],1,1,0.9,0.3,[1.5],[[1,0.7,0.7,0.5]],[1],0,0,"","",_this];
_fire SetDropInterval 0.03;

_smoke1 = "#particlesource" CreateVehicle GetPos _this;
_smoke1 SetParticleCircle [0,[0,0,0]];
_smoke1 SetParticleRandom [0,[0,0,0],[0.33,0.33,0],0,0.25,[0.05,0.05,0.05,0.05],0,0];
_smoke1 SetParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d",8,0,1],"","Billboard",1,10,[0,0,0.5],[0,0,2.9],1,1.275,1,0.066,[4,5,10,10],[[0.3,0.3,0.3,0.33],[0.4,0.4,0.4,0.33],[0.2,0.2,0,0]],[0,1],1,0,"","",_this];
_smoke1 SetDropInterval 0.65;

_smoke2 = "#particlesource" CreateVehicle GetPos _this;
_smoke2 SetParticleCircle [0,[0,0,0]];
_smoke2 SetParticleRandom [0,[0,0,0],[0.5,0.5,0],0,0.25,[0.05, 0.05,0.05,0.05],0,0];
_smoke2 SetParticleParams [["\Ca\Data\ParticleEffects\FireAndSmokeAnim\SmokeAnim.p3d",8,3,1],"","Billboard",1,15,[0,0,0.5],[0,0,2.9],1,1.275,1,0.066,[4,5,10,10],[[0.1,0.1,0.1,0.75],[0.4,0.4,0.4,0.5],[1,1,1,0.2]],[0],1,0,"","",_this];
_smoke2 SetDropInterval 0.3;

WaitUntil {IsNull _this};

DeleteVehicle _fire;

WaitUntil {IsNull _this};

DeleteVehicle _smoke1;
DeleteVehicle _smoke2;

//4/16/8 MM - Created file.
