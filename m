Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEFbFWKccGlyYgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 10:29:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84EA5461E
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 10:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C2D10E732;
	Wed, 21 Jan 2026 09:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aokDvuBx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+lgbQfN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8F710E729
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:29:03 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60L6Ni3C798928
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EU8GGywpPwmeslWc7q2GR396
 jvB+VDAt7UBOjt2XIIw=; b=aokDvuBxxzCQMBbYzTW2SkuYwF9Sj0Qn87jqegS9
 QH7DAk29D8Dt3yH+1fxQrrSIkwT4V7QRZeP6sa/sMu9hr20cZJUVt6Zc2ScImRyF
 WmRQXqWGdqk2iTYI/NWwEoAXSwh/bivfJXhYg0q3Mshe6jM3NjqHi7DojOrihdQB
 XnF1hBiWlDytCbtmow0WzFH2ljTVt/gRQPkbl+3xMtIenHLm/4XEhq98LMGjg97O
 5Ai4EZaM+n/H6BmcL8DBAJTNPvyodfLsqmlDtuRSF7PdjzZrEMbe56lgT8K8+zy6
 ZeCUIJp0R63E//3ug6/t0IEymcUx1KpuxwJcXVA83gSRAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta6q3y55-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:29:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8946b186018so45087716d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768987742; x=1769592542;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EU8GGywpPwmeslWc7q2GR396jvB+VDAt7UBOjt2XIIw=;
 b=f+lgbQfNekj+pZ2+Nm4NvoHf/tBWEymu5I8eWJx8qwxj3e6zk3nLn2937mfsl1K6Di
 iKcfIF1f1pbq+x7uKQDyODz0lHRn/Mzexe0O0CJ+qZfxlGG/trzXNNHV6KtqIpUznet2
 kZRevQMh2nYXpxKZcnCFelgTRQb3TgCrfPQnrCAy7DgVQG1N8n+LCDpfiL1z61QAkOE9
 q4ZHZwrE9jnN6SXFomERb+ogQ8D3W+fCOoHr6SyPkQqy5div2Ud42A1+vx3ckk3V2frD
 h9PVObjwOouaS3YDaJw4/7gqesJteKJzvXOMAjWvjy7Lv+BBOviOeRG+XBN6x1Ey2Io+
 xFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768987742; x=1769592542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EU8GGywpPwmeslWc7q2GR396jvB+VDAt7UBOjt2XIIw=;
 b=LEZPq0Crr3ZZalA34OcoHybdHAEKhawXvmW2uHuXEsoyBNpJdTZu6Ooig19RCBCe8F
 FKLloqji6HFuw6ZxZEm2qmXZcvNLmXLrmkWoTkyr4B4XYA5uNUoapuN6v1DJGrdSGD8n
 XpKUNrXZjM6lNaoRkM6DNreaBulWfTUWvgSMJh5Nyy+/xqKX/CmYuA7LAaifaHWeVyYA
 isbvafaek3e0sbZNruotVEGlXG6tPRDs3kMH3DUyonaZ2Cp47OoYcjnMgdsEjxbmJTDi
 JSaloQ8jHeKoFxMM2M4dSv3n5ZcfyvOkX1wMff+kDL71TJgpdazJ9UuwoRPawYTXdSrV
 RK4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzJf2WMb+oxrrzI/LVFV5YvgAbwysAWY8/HDiF7nNRxR83UAuV6ik+kzhyxxs0YiSKAyY+wJe8Qzo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZsECWnmLikGjGXZY8eyCohCIVUZykfw39/Gj/KvFDZQbbUCrd
 bGFs2eXeKQhrHWXmZUmO6asql5aKk2s4W0yI07t4hdJmO6ABfcPdpXQwvLqh+PJQ5RZcZVPU0uO
 tNB2kEbaSbaaOsADUoCm5GscMB7EEQB8XJ8mnpT2dQanwwElKtslOS8prmrY3/Ge/rUzJWb0=
X-Gm-Gg: AZuq6aK2PAlRXLPPU3IY+paVlFimkY8IeaFrfqwIC+SLX2TUKDLIMHQjSVS0mttm/HX
 me8r0DIRhzy1i1aEPgU+yePNrcylmM9TGdJeKtEAP1Y2guEHpUE4USkEiZD1IoXnYrvn3f012Ha
 4h7ZrjBxoPHex0UKYSska3nzMyNHvsGNi+SWuhhUK09W/OHg/Z53C4SXCTWWqDXKqTJBB15msLV
 xp6wy5Yrlpntn/nuIK2pVJPVm1qGw0G+RX2/IiuYdhCb/iMtJzccCEJD8qKqC2vP0ZuEwrjBBwS
 Wby5fxTwb1/bZFuHOMSzB09kPPKhM0WddMhlMeetw4hjHUbXjIj6+RuJ8giT9qwq0BOp22+X/9e
 QiNDCJQKH8db96Z6s/cgqvLZpJvyYEFyeGewu55vlEEmketSnf6Is3l9/qPMWdUTe352FogIba5
 pcLUaoGrdW+AIm+9a7LgdKlPk=
X-Received: by 2002:a05:620a:44c6:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6cce4ffd9mr585409385a.79.1768987741629; 
 Wed, 21 Jan 2026 01:29:01 -0800 (PST)
X-Received: by 2002:a05:620a:44c6:b0:8c5:38b3:fefa with SMTP id
 af79cd13be357-8c6cce4ffd9mr585407785a.79.1768987741207; 
 Wed, 21 Jan 2026 01:29:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384e788d5sm47898771fa.31.2026.01.21.01.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 01:29:00 -0800 (PST)
Date: Wed, 21 Jan 2026 11:28:58 +0200
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
Subject: Re: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=69709c5e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=3lNzBIq4ENDdFANmQEIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3OCBTYWx0ZWRfX8YYOjZoFZV/K
 xgxIUyZRPIZHGoHKPvLd3I4kCshZ2V8zO1fiy8UhuEBrCBNtKrYauqLEt19QLHqbkyUFMYrcPJv
 oKYnKQJ/gK5KHVACsH3lwuM/KyLML4ohzjRDQiOsUOO7zgGpfip6RRFkVT/S+Rm2CfwEjPZBGN+
 Kp7pxnZSQ41gDVHBW9k8foYXbGMYoUw3uELHD5laxzn//d9tgZizBtjw+L2N3Tddbj5YMcg5LRJ
 tZRhIw56bUHMAcAYRqSWMvqHSJY2aMNH43TmMRBWFPUpquyKccaCnhJvwY4ZHbgmq0x20pOKEPt
 UcPgStqlESR1JDjz8BvGVMi5KwyMUTRFzNlIsYeowEp0JTG2q5avCBkPhV+hk19hZcl4ZZDS3vI
 uGZH6PQkPVx4Vd6HdeKGUj+RRn1E8P5A1KjEPsW34KEM69D3dUazXGmza8kYSk07qK3fIR4sE7q
 /lBV+lrUUTekEDmsNZQ==
X-Proofpoint-GUID: lSqUV93S8_q4-pB_swT9QaK6TGbScNHl
X-Proofpoint-ORIG-GUID: lSqUV93S8_q4-pB_swT9QaK6TGbScNHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210078
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: B84EA5461E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:01:50PM +0800, Jun Nie wrote:
> dpu_plane_atomic_check_nosspp() currently handles both plane
> validation and plane splitting. For better simplicity and to
> facilitate future refactoring, move the splitting logic into
> its own dedicated function.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> @@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
>  			return -E2BIG;
>  
> +	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> +
> +	return 0;
> +}
> +
> +static int dpu_plane_split(struct drm_plane *plane,
> +			   struct drm_plane_state *new_plane_state,
> +			   const struct drm_crtc_state *crtc_state)
> +{
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> +	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	uint32_t max_linewidth;
> +
> +	if (!new_plane_state->visible)
> +		return 0;
> +
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
> +
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
>  	drm_rect_rotate(&pipe_cfg->src_rect,
> @@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);
>  
> -	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> -
>  	return 0;
>  }
>  
> @@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	if (!new_plane_state->visible)
>  		return 0;
>  
> @@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;

Why can't it be moved after !visible check? It's the first check in the
function code.

> +
>  	if (!plane_state->visible) {
>  		/*
>  		 * resources are freed by dpu_crtc_assign_plane_resources(),
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
