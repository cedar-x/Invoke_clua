using UnityEngine;
using System.Collections;
using UnityEditor;

[CustomEditor(typeof(TestEaseType), true)]
public class TestEaseTypeEditor : Editor {
    string strease = "";
	public override void OnInspectorGUI ()
	{
		TestEaseType tw = target as TestEaseType;
		GUILayout.Space(6f);
		//base.OnInspectorGUI();
        GUI.changed = false;
        EditorGUILayout.PropertyField(serializedObject.FindProperty("offset"), true);
        EditorGUILayout.PropertyField(serializedObject.FindProperty("mInt"), true);
        EditorGUILayout.PropertyField(serializedObject.FindProperty("mTweens"), true);
        strease = EditorGUILayout.TextField(strease);
		AnimationCurve curve = EditorGUILayout.CurveField("Animation Curve", tw.curve, GUILayout.Width(182f), GUILayout.Height(62f));
		TestEaseType.EaseType easetype = (TestEaseType.EaseType)EditorGUILayout.EnumPopup("Ease Method", tw.easetype);
        if (easetype != tw.easetype)
        {
            curve = TestEaseType.GetEasingAnimCurve(easetype);
            tw.easetype = easetype;
            tw.curve = curve;
        }
        if(GUILayout.Button("keys"))
        {
            int length = curve.keys.Length;
            curve.keys[0] = new Keyframe (curve.keys[0].time, curve.keys[0].value, 0f, curve.keys[0].outTangent );
            curve.keys[length - 1] = new Keyframe ( curve.keys[length - 1].time, curve.keys[length - 1].value, curve.keys[length - 1].inTangent, 0f);
            string easeIn = string.Format("\tanimCurve = new AnimationCurve(new Keyframe[] {{ new Keyframe({0:N}f, {1:N}f, {2:N}f, {3:N}f), new Keyframe({4:N}f, {5:N}f, {6:N}f, {7:N}f) }});\n",
                curve.keys[0].time, curve.keys[0].value, curve.keys[0].inTangent, curve.keys[0].outTangent, curve.keys[length - 1].time, curve.keys[length - 1].value, curve.keys[length - 1].inTangent, curve.keys[length - 1].outTangent);
            string easeOut = string.Format("\tanimCurve = new AnimationCurve(new Keyframe[] {{ new Keyframe({0:N}f, {1:N}f, {2:N}f, {3:N}f), new Keyframe({4:N}f, {5:N}f, {6:N}f, {7:N}f) }});\n",
                curve.keys[0].time, curve.keys[0].value, curve.keys[length - 1].inTangent, curve.keys[length - 1].outTangent, curve.keys[length - 1].time, curve.keys[length - 1].value, curve.keys[0].inTangent, curve.keys[0].outTangent); ;
            string easeInOut = string.Format("\tanimCurve = new AnimationCurve(new Keyframe[] {{ new Keyframe({0:N}f, {1:N}f, {2:N}f, {3:N}f), new Keyframe({4:N}f, {5:N}f, {6:N}f, {7:N}f) }});\n",
                curve.keys[0].time, curve.keys[0].value, curve.keys[0].inTangent, curve.keys[0].outTangent, curve.keys[length - 1].time, curve.keys[length - 1].value, curve.keys[0].inTangent, curve.keys[0].outTangent); ; ;
            if (length > 2)
            {
                for (int i = 1; i < length - 1; ++i)
                {
                    easeIn += string.Format("\tanimCurve.AddKey(new Keyframe({0:N}f, {1:N}f, {2:N}f, {3:N}f));", curve.keys[i].time, curve.keys[i].value, curve.keys[i].inTangent, curve.keys[i].outTangent);
                    easeOut += string.Format("\tanimCurve.AddKey(new Keyframe({0:N}f, {1:N}f, {2:N}f, {3:N}f));", 1 - curve.keys[i].time, 1 - curve.keys[i].value, curve.keys[i].inTangent, curve.keys[i].outTangent);
                    easeInOut += string.Format("\tanimCurve.AddKey(new Keyframe({0:N}f, {1:N}f));\n", 1-curve.keys[i].time, curve.keys[i].value);// curve.keys[i].inTangent, curve.keys[i].outTangent);
                    easeInOut += string.Format("\tanimCurve.AddKey(new Keyframe({0:N}f, {1:N}f));", curve.keys[i].time, 1 - curve.keys[i].value);//, curve.keys[i].inTangent, curve.keys[i].outTangent);
                }
            }
            Debug.Log(string.Format("case EaseType.easeIn{0}:\n{1}\n\tbreak;\ncase EaseType.easeOut{0}:\n{2}\n\tbreak;\ncase EaseType.easeInOut{0}:\n{3}\n\tbreak;\n", strease, easeIn, easeOut, easeInOut));

        }
        EditorGUILayout.PropertyField(serializedObject.FindProperty("v4"), true);
        if(GUILayout.Button("set"))
        {
            AnimationCurve ac = new AnimationCurve();
            for (int i=0;i<tw.v4.Count;++i)
            {
                ac.AddKey(new Keyframe(tw.v4[i].x, tw.v4[i].y, tw.v4[i].z, tw.v4[i].w));
            }
            tw.curve = ac;
        }
        if (GUI.changed)
        {
            serializedObject.ApplyModifiedProperties();
        }
	}
}
