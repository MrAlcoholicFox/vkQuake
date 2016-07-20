#version 450
#extension GL_ARB_separate_shader_objects : enable
#extension GL_ARB_shading_language_420pack : enable

layout(push_constant) uniform PushConsts {
	mat4 mvp;
} push_constants;

layout (location = 0) in vec3 in_position;
layout (location = 1) in vec2 in_texcoord1;
layout (location = 2) in vec2 in_texcoord2;

layout (location = 0) out vec4 out_texcoords;

out gl_PerVertex {
	vec4 gl_Position;
};

void main() 
{
	out_texcoords.xy = in_texcoord1.xy;
	out_texcoords.zw = in_texcoord2.xy;
	gl_Position = push_constants.mvp * vec4(in_position, 1.0f);
}
