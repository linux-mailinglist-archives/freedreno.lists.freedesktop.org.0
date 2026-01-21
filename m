Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBsyCr2ccGlyYgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 10:30:37 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857B854696
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 10:30:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9F910E22C;
	Wed, 21 Jan 2026 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MV+fDBIe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNs1YsNc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04010E22C
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:30:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L5e3oF800360
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=jCcHWBxjANuzaZBT3V4JtDZ5
 YiBRtjVNWk49V/l3bSk=; b=MV+fDBIenesFOs2WDuyOQuI5Zfv3bqavypJYhFO8
 6RETgt3Yo4DrYdX6rn/OCGmZMr3b6D6CEcCsNpGpVCgyfT7nNaCdVfY1giBXLqon
 1p52CD8ay9gaadccWuV3tcLfQvOHHIGDH8eKs1pQwWqwAGcStv6ZS4tIUV43ZUWF
 kNRyW9GVKV+eKY3iIEgHSvEiZIK0ea3LCyawv82/15gu/rC+iBNpI71G7xg5pVZu
 zh1vSutpyM4Kt6S9gqjyuEUW9nQjpmHQqii1+31Ow7Lg6+QtKvks5+t8ByDDgKB8
 c/xNjvm7jcWGRTpnW5VvzfZEX9T2+6DZEz6Lzc6UF24i+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q3ymg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:30:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52c921886so788175685a.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768987833; x=1769592633;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jCcHWBxjANuzaZBT3V4JtDZ5YiBRtjVNWk49V/l3bSk=;
 b=CNs1YsNctb5CnB6zjUvwseQNRYRSa5+U907SynLqCqHIrg8p8CcINq5pz1jRyPDGEw
 QuSg03ezk1iz3+49Tz2NgaFZpFHzAC0aE8S+06Lcg8XMu+f6Lj84Z4eLXR4F36vfLcz3
 AEYydy889AZx7Ygcl2kZPRa8S61MasEVSrrtSWIwInhtq6dJnxklomoSvPfMCW33NRuk
 CoNJVMLu2zKkXntpMgHUp3/kTSEkd54SdTOb38S5HmU0rVt+ROC82vvEFbnR5MGnFD62
 iPLMhk0QlaXlIeqLeUFlVmG/GJ5b8B2N0n1PU7kT9ZqrOpaRDVilvh8SwnYvturcgj0Z
 vXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768987833; x=1769592633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCcHWBxjANuzaZBT3V4JtDZ5YiBRtjVNWk49V/l3bSk=;
 b=rXQMkuNCPiGBpg/Epf45onnRmPFYUCJ/426GrYhawKtHGUoVgLTv7D36p8oF7/Jxv4
 y+v/0EBRCSbJwPJhj+tnd1h1lfOmjD66DfHRTKuHRtK4B1nXt2k5zKlxsQXLg/zlS/Ul
 AVHwo/548kpq+HKuzNkvzuXi+DD+SN4s80VJ71CBOhctCqogOyJsWk5RGad0htl26LOd
 iHdZBg177DCwARvZBeLDJ1fSbv2PpDyt5BNuMU+g2eD/PUusvVPkv1roTS1TA76UJcQr
 dPusPRL6F3TkuSF9mAQWRXxqXCBxFklI/6pGaiHZyXk/H+aOcDe2PNWns4sSGgnhN8Wy
 w/bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmYrIhs0GlBS6npi/pNejp7Ds8Zs8B4EPskXEKNPSECYAtttIb53DxfjUxmdqPJPyUwjM46FTZk5M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3cLD+Zfb0rV88FOR7rnXD5bofkuYlombqmhpuI7wsy1wIbQFS
 1l9h7mNRz4dFnNgQEF2cATBnyrTfYl1M4oITELSkBU8Y92dCHXlrNyEhfnKisktj39TGJPDv+QX
 JZfX50oMzlRE+S1ZSB9olfBoTM4HgWUh5fN6gGKPmQwYS3Yg0MGY61G2aoertoXIQ9/X2oNc=
X-Gm-Gg: AZuq6aJAyMg0LkQe3UHhfu8kb6eFh7kMKLhk9OGLxCUEoFiQtzz0gRQ24MElK1kSZ2X
 BpJFHBNrxzJkK/VkT1fGMdtBIuF4mF+S9Q5TAFfLer7z1TmGZDqA1S68XuwdAUU8+QmHXN2aCNG
 4Co+xwqZf6FLlgy3q5BKYe05u/ikLBXxxwS7jrr+G29SBh+dsP9t6YR8Z9Yk0p7FDRtOE02Pu71
 TtXO1oJvnYadFseXjbgR80Dg07xJm17/zfkJuAMG+IFNU3wMjlMnUgsgQZZ4LAoixjIZ7OeTjva
 RPQ0e8gkAay05pKKhFdbPPNGDrdQgsVDEXHd/vwNVt2PPBflZFt2fa+hBXhoN7MD2gogog9eqLJ
 M8qOPn8i30i8vy0HdrPVf+6pUIRka3wX56UzV16rzcY28lfyV/N4KfiKvSqaS+6n9sT6pYZTT0L
 95IKWsNwK8QyD7Kc82+wVEtOY=
X-Received: by 2002:a05:620a:2a05:b0:8b2:d2c9:f6a with SMTP id
 af79cd13be357-8c6ccf3f116mr542868185a.89.1768987833114; 
 Wed, 21 Jan 2026 01:30:33 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b2:d2c9:f6a with SMTP id
 af79cd13be357-8c6ccf3f116mr542865085a.89.1768987832546; 
 Wed, 21 Jan 2026 01:30:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385bc7d29fcsm344741fa.38.2026.01.21.01.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 01:30:31 -0800 (PST)
Date: Wed, 21 Jan 2026 11:30:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=69709cb9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=yhFmvX6FVyQK3JyMgscA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3OSBTYWx0ZWRfX5AMF0rbTFkDx
 9BEPhz+kEoivaer5cPprgvFqgZnIaXJutXWWfS+XKDrlkDmCcgopBnsx+qMyjsDIdU5uveOWkMJ
 kdqMdkj/vyQQkufxNIBHossTmNuwMWGITJMakc9LbZO2c6JlHSc/pWCd465FzWC8E4z3BVM0BAT
 EywH+gl1cNONkgk4oqUc6CB2GfW765Ys2zH7Rfse70XHiOwDAr6OJZjpemyB9AM9GBy00JxYBVT
 /6UnNKlyp3NbCGbOPkJAVfk7rx4hcct31A+rcnf9GbgY6WOaqyrGzTAmkH2nEFkgDs8xVIc3ZVC
 wTU1FR+wRAI1Uk/GJPWOeWdb6NCASiECM7CW6jK/fWFKJI8lDqnurGWVtCOmSI+Y5TONBtWvqFz
 cbUg7hK7XxmoVblQNHrxIYcPUy0Z7c3G704bt4NsfeXjsc20U09enrO9Iggd4vAEPGddMP6N16J
 yJ4pjYCyvVRdmUcnDBA==
X-Proofpoint-GUID: T0Nxmp7YPjrR7U3GL8dFgGZ8D2KNLbsG
X-Proofpoint-ORIG-GUID: T0Nxmp7YPjrR7U3GL8dFgGZ8D2KNLbsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210079
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 857B854696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> Currently, plane splitting and SSPP allocation occur during the plane
> check phase. Defer these operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.

Why is it important? What is broken otherwise?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 112 +++++++++++++++++++-----------
>  2 files changed, 71 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 2d06c950e8143..debdbbe6160dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1484,8 +1484,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			return rc;
>  	}
>  
> -	if (dpu_use_virtual_planes &&
> -	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> +	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
>  		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
>  		if (rc < 0)
>  			return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 66f240ce29d07..3c629f4df461d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1119,49 +1119,25 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>  										 plane);
>  	int ret = 0;
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	const struct drm_crtc_state *crtc_state = NULL;
> -	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +	struct drm_crtc_state *crtc_state = NULL;
>  
>  	if (new_plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   new_plane_state->crtc);
>  
> -	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -
> -	if (!pipe->sspp)
> -		return -EINVAL;
> -
>  	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
>  	if (ret)
>  		return ret;
>  
> -	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
>  	if (!new_plane_state->visible)
>  		return 0;
>  
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(new_plane_state->fb),
> -					      max_linewidth)) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> -				" max_line:%u, can't use split source\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect),
> -				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> -				max_linewidth);
> -		return -E2BIG;
> -	}
> -
> -	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> +	/*
> +	 * To trigger the callback of dpu_assign_plane_resources() to
> +	 * finish the deferred sspp check
> +	 */
> +	crtc_state->planes_changed = true;
> +	return 0;
>  }
>  
>  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> @@ -1186,10 +1162,6 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> -	ret = dpu_plane_split(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
>  	if (!plane_state->visible) {
>  		/*
>  		 * resources are freed by dpu_crtc_assign_plane_resources(),
> @@ -1261,9 +1233,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
>  					      struct drm_plane_state *plane_state,
> +					      const struct drm_crtc_state *crtc_state,
>  					      struct drm_plane_state **prev_adjacent_plane_state)
>  {
> -	const struct drm_crtc_state *crtc_state = NULL;
>  	struct drm_plane *plane = plane_state->plane;
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
> @@ -1273,10 +1245,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	const struct msm_format *fmt;
>  	int i, ret;
>  
> -	if (plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   plane_state->crtc);
> -
>  	pstate = to_dpu_plane_state(plane_state);
>  	for (i = 0; i < STAGES_PER_PLANE; i++)
>  		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
> @@ -1288,6 +1256,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	if (!plane_state->fb)
>  		return -EINVAL;
>  
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	fmt = msm_framebuffer_format(plane_state->fb);
>  	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
>  	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> @@ -1318,14 +1290,59 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> +				      struct dpu_global_state *global_state,
> +				      struct drm_atomic_state *state,
> +				      struct drm_plane_state *plane_state,
> +				      const struct drm_crtc_state *crtc_state,
> +				      struct drm_plane_state **prev_adjacent_plane_state)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	int ret;
> +
> +	if (!plane_state->visible)
> +		return 0;
> +
> +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +					      pipe->sspp,
> +					      msm_framebuffer_format(plane_state->fb),
> +					      dpu_kms->catalog->caps->max_linewidth)) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> +				" max_line:%u, can't use split source\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> +				dpu_kms->catalog->caps->max_linewidth);
> +		return -E2BIG;
> +	}
> +
> +	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> +}
> +
>  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       struct drm_atomic_state *state,
>  			       struct drm_crtc *crtc,
>  			       struct drm_plane_state **states,
>  			       unsigned int num_planes)
>  {
> -	unsigned int i;
>  	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
> +	const struct drm_crtc_state *crtc_state = NULL;
> +	unsigned int i;
> +	int ret;
>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> @@ -1334,8 +1351,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  		    !plane_state->visible)
>  			continue;
>  
> -		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> +		if (plane_state->crtc)
> +			crtc_state = drm_atomic_get_new_crtc_state(state,
> +								   plane_state->crtc);
> +
> +		if (!dpu_use_virtual_planes)
> +			ret = dpu_plane_assign_resources(crtc, global_state,
> +							 state, plane_state,
> +							 crtc_state,
> +							 prev_adjacent_plane_state);
> +		else
> +			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>  							     state, plane_state,
> +							     crtc_state,
>  							     prev_adjacent_plane_state);
>  		if (ret)
>  			return ret;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
