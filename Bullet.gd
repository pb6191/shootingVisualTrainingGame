extends RigidBody


var speed = 770
var velocity = Vector3()

func start(xform):
	transform = xform
	velocity = -transform.basis.z * speed
	scale = Vector3(6, 6, 6)

func _process(delta):
	transform.origin += velocity * delta
	
	

func _on_Timer_timeout():
	queue_free()



func _on_Bullet_body_entered(body):
	queue_free()
#	if body is StaticBody:
#		queue_free()
		
