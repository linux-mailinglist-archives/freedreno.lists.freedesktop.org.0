Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCCAC70CF
	for <lists+freedreno@lfdr.de>; Wed, 28 May 2025 20:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0E910E6A0;
	Wed, 28 May 2025 18:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SR0X2GWM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D3710E684
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 18:22:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAI3XR021578
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 18:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VSqQFgb0vNsBP9uzJZGqkiym
 8JmNyD9K1JA4p69RyL4=; b=SR0X2GWMZdeo5YIMfu1V5VWPXhm5fizEiLOyztxn
 Z31tpRZ5q6jNRWmaYP+x8IHw0ufMx5363oFhVUhFnrTxk/zjJSVSuVK8PnZFR5gC
 bE6BeHJJii2czVgO5uOnjNSdNYYzEjsPtxzE/32hPxmLoj4VYG44PYcu8s5p+elY
 zgT2AtngHJT+lduDoIt+ig4bjYQ1aPEZXmgHNLWTZM7Z6hBrMT0lmR45xlg6Brjd
 7uqgILGSKM7p14GZDFhBQx9fPQsMH0NfhpV6K+MQzR9m534ylmFFbY8mJVgeF1ua
 SA8D7ZH8KXzbFEpvb8Tisqc0VasR+SX0gANBDJKCvyj70A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g935p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 18:22:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4a35b701385so1430291cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 28 May 2025 11:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748456550; x=1749061350;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VSqQFgb0vNsBP9uzJZGqkiym8JmNyD9K1JA4p69RyL4=;
 b=d5fuN1AqwjXTRVjKVFaEYkfaJ3MMIns/kA2Bu096Rply4r9mYY6jp1zmYdl8DWEV8i
 CR9B1mV22XWE2TAdu9Ux2/taP8Az8G/PHhB/KXYyuYyXM0hoT413KwvyBMJBvv07QUQl
 pocjiALldGlo/BpSKUWReFUPEU1iLonqsOni4k3HqCOTt+r1m888fPVcT8lTEJ3ZD5QZ
 TDoM4ZynvgL04s+uacfDITFCTAjJtzpZL0TpX3DliKe4ZhOoDnI4gkE4kP7ZXgSAAbRt
 TcgCR9J2U4kmjaGDXXhRzXbKFIyoVptuIU10HnhrRrunN/8TAlr3w7SDLY2/7Nc8QSpE
 koEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6LBxyXL3alGZIlJ2qIXqCNFf/jf8A7zXFWDCvg/azT9rGlrQAt2/Dg+VWChC3XURqiCSQQQFmcfk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZvvf+2j5xcn0/vdlpCkYSktYmQU+0uKkTzyhqvIwOxHdkLMip
 kkagFiLWS5SxgXHa9QSLThRcuOKsooJsoRfKAWhrSHjXgk1omcG1AzomUzNna/EsquupZSiNvNK
 7ga9NuPKoCtseqpmYFWD7H+LdlV1rpbLwSPT07QwukBFcA6zICl/qQ9eKVsNGG3cNU5IAd3ec/g
 +SyII=
X-Gm-Gg: ASbGnctqBFz3zbWvzj5KdiL5yzYslAJrlHs9IjHCUYoOiWIWQrdVh8ES23zfgtrg7P8
 mQS+tIBM0XOWHoyuhduSR0PthAQXsYbZh01sNZHON4bTuIfHZa/5BIgc+18j+LiRNg5OzPOw3ID
 6lik3wJKP5ucxkp6Pjp2BXCH/EhQk6XPGPutY0Ok3MqTXuvB9iA+DmXYUIihuh1rlmf8OwYvAqH
 LMlK4bC3b9+UpEaitqJ/vmAr8R3ZzkHOeSxV34rj40OGU6wDFMaB/EpchFShSyN63vuSEzF8cWp
 LYegMWAOb1poffEl0OaXDfdU0QAsZNp1qwCsVwwnhKMaPRntUl/J8RTlipcf7EEP56tP/jIky1I
 =
X-Received: by 2002:a05:622a:1f0a:b0:4a3:800d:2a93 with SMTP id
 d75a77b69052e-4a3800d2bc6mr50820231cf.46.1748456550319; 
 Wed, 28 May 2025 11:22:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBgHDOWO+XsRhKCVgZVBb0vNNcV9Fn1O7FSP1azZt5CGQL4wmPuRN66m2zfRg/m3rWXeXP6g==
X-Received: by 2002:a05:620a:4587:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7ceecc33813mr2659680885a.30.1748456539153; 
 Wed, 28 May 2025 11:22:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5532f69a484sm378762e87.116.2025.05.28.11.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 11:22:16 -0700 (PDT)
Date: Wed, 28 May 2025 21:22:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <45hk22fdghaqnilukvqayjcbnf3btntknqrwf5ivx346vrgag3@aebzt76tkjzw>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
 <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-10-5fed4f8897c4@linaro.org>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68375468 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=giFwS8THduiqBY6JDEUA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zCuAJAkHGA_uWwye3iBkCjaxMsaVBhg_
X-Proofpoint-GUID: zCuAJAkHGA_uWwye3iBkCjaxMsaVBhg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2MCBTYWx0ZWRfX1KQryWW49Cd9
 tMw2otRhnL+N3oUUwu5cVlxNKUKUeMib6C6FFgaP4yfL7IkPX0axsq0n8MJK9RhVv0ZAPXIZEgV
 WOIfFLpuuhpAL0pSz5KBEaN6xUkGih+Dh3ZVQ1FdubMJAeE1d88+mKjYyUn49mcGkkk2qU5QgtK
 Z6o3xAj/E7NEz3M2u2WX4JWY4+tFFaaKnWdaCf9otMfDMFJCv6JOvhsW/9eQH3AiBD3DEf7LkcN
 2njqJHjz6DhTz13A9Hf5ERt0k2ASN92KZc/xSZKq/5TgT/rJbNGHtmMFgLGtjG9QdicNEKoifa6
 Oo9yXC1wkG0eHe8S1zgMfk4iv3+VXhDIDczCi60cH999RA4YnXZv9TNA2GM+A1G/TRgVGwY2ICY
 B08zdEln8w/7y+U8QVAU8UN5uesxJ5xjBY3x8pzKzL4bBFHr7xmBhnllLdaOzdXZxr4pHZfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280160
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, May 26, 2025 at 05:28:28PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 126 ++++++++++++++++++------------
>  3 files changed, 88 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 85f585206218f4578e18b00452762dbada060e9c..47ab43dfec76acc058fb275d1928603e8e8e7fc6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1562,6 +1562,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 94392b9b924546f96e738ae20920cf9afd568e6b..6eaba5696e8e6bd1246a9895c4c8714ca6589b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0bb153a71353ca9eaca138ebbee4cd699414771d..f721dc504bbbe3a49986239adee113bfb6790f70 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_check_single_pipe(struct dpu_plane_state *pstate,
> +					struct dpu_sw_pipe **single_pipe,
> +					struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +					bool config_pipe)
> +{
> +	int i, valid_pipe = 0;
> +	struct dpu_sw_pipe *pipe;
> +
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> +			valid_pipe++;
> +			if (valid_pipe > 1)
> +				return false;
> +			*single_pipe = &pstate->pipe[i];
> +			*single_pipe_cfg = &pstate->pipe_cfg[i];
> +		} else {
> +			if (!config_pipe)
> +				continue;
> +			pipe = &pstate->pipe[i];
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			pipe->sspp = NULL;

If this function is 'check', then why does it change something in the
pipe configuration?

> +		}
> +	}
> +
> +	return true;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  					  const struct msm_format *fmt,
>  					  uint32_t max_linewidth)
>  {
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> -	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe *pipe, *prev_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>  	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_check_single_pipe(pstate, &pipe, &pipe_cfg, true))
> +		return false;
> +
> +	if (!dpu_plane_check_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  	if (MSM_FORMAT_IS_UBWC(prev_fmt))
>  		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>  
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	r_pipe->sspp = NULL;
> -
>  	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>  	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>  	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> @@ -1194,12 +1216,11 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe, *r_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1209,11 +1230,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	prev_adjacent_pstate = prev_adjacent_plane_state ?
>  		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1227,44 +1243,52 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		if (!prev_adjacent_pstate ||
> -		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> -						    dpu_kms->catalog->caps->max_linewidth)) {
> -			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!pipe->sspp)
> -				return -ENODEV;
> +	if (prev_adjacent_pstate &&
> +	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> +					    dpu_kms->catalog->caps->max_linewidth)) {
> +		goto assigned;
> +	}
>  
> -			r_pipe->sspp = NULL;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {

Can't we just loop through all possible stages? Same result, but makes
the logic somewhat easier.

> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {

I still really don't like this idea (and especially the part with
(i % PIPES_PER_STAGE == 0) condition). Extract current code which deals
with two planes and a single stage. Call it for each stage. That's it.

> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> -	} else {
> -		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!pipe->sspp)
> -			return -ENODEV;
> -
> -		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -						      pipe->sspp,
> -						      msm_framebuffer_format(plane_state->fb),
> -						      dpu_kms->catalog->caps->max_linewidth)) {
> -			/* multirect is not possible, use two SSPP blocks */
> -			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!r_pipe->sspp)
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
>  				return -ENODEV;
>  
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
>  		}
>  	}
>  
> +assigned:
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
