#### animate

Animation让CSS拥有了可以制作动画的功能

```
@-webkit-keyframes anim1 { 
   0% { 
        opacity: 0; 
        font-size: 12px; 
   } 
   100% { 
        opacity: 1; 
        font-size: 24px; 
   } 
} 
.anim1Div { 
   -webkit-animation-name: anim1 ; 
   -webkit-animation-duration: 1.5s; 
   -webkit-animation-iteration-count: 4; 
   -webkit-animation-direction: alternate; 
   -webkit-animation-timing-function: ease-in-out; 
}
```