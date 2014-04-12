RuneDefenders
=============

A game demo which plagiarize from RuneRaiders. The codes is based on SpriteKit. In most cases SpriteKit is really convenient, but it still not handy when you encounter following things：

1. You want a round corner rectangle. 
	In SpriteKit, you must create a CGPath, then assign it to the SKShapeSprite.
2. You want to handle child-node event in the super-node. 
	I had writen a RDActionProtocol to help resolve this problem.
3. You want some really sommon UI contorls such as menu、button、tableview.
	In this case, SpriteKit can not even catch up with UIKit. You have to write every control by yourself. This is really timewasting.
4. You want to know the notification of when one node to added to a super-node.
	SpriteKit do not have methods such as -willAddToNode or -didAddToNode. You must implement a mechanism to achive this goal.
5. Atlas feature is not as efficient as the documents said.

All in all, if you wanna use SpriteKit, you'd better exactly know what you'll get and what you'll lost.

