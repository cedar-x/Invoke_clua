using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class TestEaseType : MonoBehaviour {
    public List<Quaternion> v4 =  new List<Quaternion>();
     [SerializeField]
    public Vector3 offset;
     [SerializeField]
    public Object[] mTweens = new Object[1];
    public int[] mInt = new int[1];
	public enum EaseType
        {
            easeInQuad,
            easeOutQuad,
            easeInOutQuad,
            easeInCubic,
            easeOutCubic,
            easeInOutCubic,
            easeInQuart,
            easeOutQuart,
            easeInOutQuart,
            easeInQuint,
            easeOutQuint,
            easeInOutQuint,
            easeInSine,
            easeOutSine,
            easeInOutSine,
            easeInExpo,
            easeOutExpo,
            easeInOutExpo,
            easeInCirc,
            easeOutCirc,
            easeInOutCirc,
            linear,
            spring,
            /* GFX47 MOD START */
            //bounce,
            easeInBounce,
            easeOutBounce,
            easeInOutBounce,
            /* GFX47 MOD END */
            easeInBack,
            easeOutBack,
            easeInOutBack,
            /* GFX47 MOD START */
            //elastic,
            easeInElastic,
            easeOutElastic,
            easeInOutElastic,
            /* GFX47 MOD END */
            punch
        }

	public AnimationCurve curve;
	public EaseType easetype = EaseType.linear;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {

	}
	public static AnimationCurve GetEasingAnimCurve(EaseType easeType)
        {
            AnimationCurve animCurve = new AnimationCurve();
            switch (easeType)
            {
                case EaseType.easeInSine:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 2.00f, 2.00f) });
                    animCurve.AddKey(new Keyframe(0.08f, 0.01f, 0.16f, 0.16f));
                    break;
                case EaseType.easeOutSine:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 2.00f, 2.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.92f, 0.99f, 0.16f, 0.16f));
                    break;
                case EaseType.easeInOutSine:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.08f, 0.01f, 0.16f, 0.16f));
                    animCurve.AddKey(new Keyframe(0.92f, 0.99f, 0.16f, 0.16f));
                    break;
                case EaseType.easeInCubic:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 2.00f, 2.00f) });
                    animCurve.AddKey(new Keyframe(0.25f, 0.01f, 0.16f, 0.16f));
                    break;
                case EaseType.easeOutCubic:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 2.00f, 2.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.75f, 0.99f, 0.16f, 0.16f));
                    break;
                case EaseType.easeInOutCubic:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.25f, 0.01f, 0.16f, 0.16f));
                    animCurve.AddKey(new Keyframe(0.75f, 0.99f, 0.16f, 0.16f));
                    break;
                case EaseType.easeInQuint:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 6.49f, 6.49f) });
                    animCurve.AddKey(new Keyframe(0.97f, 0.83f, 2.87f, 2.87f));
                    break;
                case EaseType.easeOutQuint:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 6.49f, 6.49f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.03f, 0.17f, 2.87f, 2.87f));
                    break;
                case EaseType.easeInOutQuint:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.17f, 0.03f));
                    animCurve.AddKey(new Keyframe(0.83f, 0.97f));
                    break;
                case EaseType.easeInCirc:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 6.49f, 6.49f) });
                    animCurve.AddKey(new Keyframe(0.97f, 0.83f, 2.87f, 2.87f));
                    break;
                case EaseType.easeOutCirc:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 6.49f, 6.49f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.03f, 0.17f, 2.87f, 2.87f));
                    break;
                case EaseType.easeInOutCirc:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.17f, 0.03f));
                    animCurve.AddKey(new Keyframe(0.83f, 0.97f));
                    break;
                case EaseType.easeInQuad:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 2.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.07f, 0.01f, 0.15f, 0.15f));
                    break;
                case EaseType.easeOutQuad:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 2.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.93f, 0.99f, 0.15f, 0.15f));
                    break;
                case EaseType.easeInOutQuad:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.99f, 0.93f));
                    animCurve.AddKey(new Keyframe(0.01f, 0.07f));
                    break;
                case EaseType.easeInQuart:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 2.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.41f, 0.03f, 0.15f, 0.15f));
                    break;
                case EaseType.easeOutQuart:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 2.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.59f, 0.97f, 0.15f, 0.15f));
                    break;
                case EaseType.easeInOutQuart:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.41f, 0.03f));
                    animCurve.AddKey(new Keyframe(0.59f, 0.97f));
                    break;
                case EaseType.easeInExpo:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 5.83f, 5.83f) });
                    animCurve.AddKey(new Keyframe(0.83f, 0.21f, 0.97f, 0.97f));
                    break;
                case EaseType.easeOutExpo:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 5.83f, 5.83f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.17f, 0.79f, 0.97f, 0.97f));
                    break;
                case EaseType.easeInOutExpo:
                    break;
                case EaseType.easeInBack:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 5.83f, 5.83f) });
                    animCurve.AddKey(new Keyframe(0.66f, -0.01f, 0.97f, 0.97f));
                    break;
                case EaseType.easeOutBack:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 5.83f, 5.83f), new Keyframe(1.00f, 1.00f, 0.00f, 0.00f) });
                    animCurve.AddKey(new Keyframe(0.34f, 1.01f, 0.97f, 0.97f));
                    break;
                case EaseType.easeInOutBack:
                    break;
                case EaseType.easeInElastic:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 0.00f, 0.00f), new Keyframe(1.00f, 1.00f, 5.83f, 5.83f) });
                    animCurve.AddKey(new Keyframe(0.48f, 0.01f, 0.07f, 0.07f)); 
                    animCurve.AddKey(new Keyframe(0.56f, 0.04f, -0.07f, -0.07f));     
                    animCurve.AddKey(new Keyframe(0.65f, -0.02f, 0.97f, 0.97f));      
                    animCurve.AddKey(new Keyframe(0.73f, 0.09f, -1.47f, -1.47f));     
                    animCurve.AddKey(new Keyframe(0.89f, -0.16f, 3.06f, 3.06f));
                    break;
                case EaseType.easeOutElastic:
                      break;
                case EaseType.easeInOutElastic:
                      break;
                case EaseType.easeInBounce:
                    animCurve = new AnimationCurve(new Keyframe[] { new Keyframe(0.00f, 0.00f, 2.00f, 2.00f), new Keyframe(1.00f, 1.00f, -0.48f, -0.48f) });
                    animCurve.AddKey(new Keyframe(0.10f, 0.01f, 1.13f, 1.13f)); 
                    animCurve.AddKey(new Keyframe(0.25f, 0.00f, -0.71f, -0.71f));     
                    animCurve.AddKey(new Keyframe(0.47f, 0.16f, 0.12f, 0.12f)); 
                    animCurve.AddKey(new Keyframe(0.70f, 0.01f, 0.84f, 0.84f));
                    break;
                case EaseType.easeOutBounce:
                      break;
                case EaseType.easeInOutBounce:
                      break;
            }
            return animCurve;
        }
}
