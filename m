Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOQwJAFXj2lqQQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 17:53:21 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB5E13864C
	for <lists+freedreno@lfdr.de>; Fri, 13 Feb 2026 17:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58EDD10E837;
	Fri, 13 Feb 2026 16:53:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvqAtH6N";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7e3LQC7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5211210E203
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:53:17 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DFHjLk2628151
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/oVMsUgTLZaMOKBsltA80ghS
 BNzy1i2pQtxl1eCTlPU=; b=SvqAtH6NS+fUPv7uVXCQOUVe5si8dJZBBLTMgWRR
 Hs+giu0D0us+9mF3WBlEZfLeGRmObN66c8Ls5I7sS3/MrsbC1tjeRJPrQ+k/ATZh
 of/KiouMcxh+F+z9PrRJ8EUde/3xVkyZhzuD1FfUT7Hv7IkceWf+KB2Nx4YOgS9t
 yyq3Zt/rQMZPfhLxltG9qKb2E0pXYnbuezKagq2PQT50lE6HV5D8Uzcj55N2xHTT
 YK+JUFhJFBEX/LhR+uRUWHpvGUzXLonsnAU8hKfuqDgysRvkqkJMQ4P+KhT+9Bvs
 HOyyqJEjcYfE7HKzhzQkQxMIUxeFCvJe+VdJgCszDjTgsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygut28p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 16:53:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c71304beb4so329150385a.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Feb 2026 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771001596; x=1771606396;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/oVMsUgTLZaMOKBsltA80ghSBNzy1i2pQtxl1eCTlPU=;
 b=j7e3LQC7yl5b39wa+hYeB7TkmlN2hHE4t24xvgc06RQEmtapXRNmZrxjYd8OG5ntaV
 +nfEua3nH7on81KSz8A2U8T8lys45stXnPKIxl3fXqbB5Qq5/ZWUrM0XA3PAVE+9H4Sy
 IWOKANS9Zno9YA+ZfDrvK5N+WaXGC7ag0boE3XGIREEN6SgxrLNJ4ySxehTaXOL2gLqG
 eteXexXcoZ97Pf8allhLD4o1a00w3ZDBcVLYOQUNDTVyWdXFoSzGbsSHPtnrXWHRNbpZ
 7BUpGNh2erTT+EXzfd9PUdmxrB9Ku6nua8v4LXZ0oNaihmu9+vLlEGEqDtIS1wUDqU7z
 zFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771001596; x=1771606396;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/oVMsUgTLZaMOKBsltA80ghSBNzy1i2pQtxl1eCTlPU=;
 b=qqmHKTwGQLPlFnDizGnzPNYY0ka9YIeyDTYUhEbwfEzuytYJbNtMg+p8797ZTPf5i2
 AwN7S7PbockUXbKeQ4KeuIDcXb1ty3y4q50wJ7K1EgluqP631/uCLSi7nql9KkYKr1sI
 h1PPCOS2Dj/O5ccKs0lsol7wn2ljJqARIG2EfpQguo//P6FL1XjZ11Es1YbV8JirtdJa
 2tGnF/es9ijLWxGW5wbJPvZPzUCpYcAgPaqhpTjqU0rWImomoSbEo1FVLdibz45l2c5C
 VO/6fg2ht5Qd6s8/kEoBB74xFZXN9eqaAeyx5j7oCBKWDk9h0nDuJT5HD9tNm2LGc5Vq
 xTAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfGuNGmvtr7aA8iVNmTmb5kLvsMhmz+T/0dOSfEqs0hjHYRowGV10DMCHN19SPlzdiwE0ahhSRhgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE1iKOKpMsuOIXdJwYZKJ1pk5eKbsHSN3GVj7o31L/uzw16xMP
 l0Fv1PoMdbMIXJskunUeo/nAQhRegMoydhHR4YOpx598ZWKdTJgyKbzdO4tuwC4CLTFOlJnlBdW
 seTRhWSbwRbv9SV7H8vMMPYEoFXre75LpjHutllOIWnKA70s6HZ7dOTKV+x1li6Ac1+S8aCc=
X-Gm-Gg: AZuq6aLX6N9dmlPLonRT/3JWv7KcCb5MP6Gi6IQI1wZCLO9r+x2f2zCKRYSOaamNKRb
 VhRj7DpReN+ZsfCCVgDHfKXKdUCz9sQeNp8UOpY26KJBXTTaRxG0EpSagavaSeATwyOb7KQCJvA
 PDbCsl2LCOg9u3cdbZubeHVVUPsKr/UOKbhlMR2QnaxYpeX5vDHcBUQXdnji/6DRdD3HsJS6ehc
 CWbActFwHTpRHQWeEU44UKoMqImNcJ1RsmCTn0IMHbfLpAED4x3UpBI5yqdkFsIP29Zf4ugyAcv
 Kn3ESWtcVR+qtbuFatPtDUxDQptaoIi7elmCP6q/TxNDyCdlhC0pXGoCdmgmmNc7sJqJW3fZPuV
 1zcqSsRyY+3UZub/bbMjpw4sd31wa4007Uk6/UrY1kVf4FP6B+L+m2JyBW40ik28m2OtUvGVq9d
 VtiRoMyDlJmkvw0m6qMLIncxFknUlnvRx/jCU=
X-Received: by 2002:a05:620a:3187:b0:8b3:14dc:4821 with SMTP id
 af79cd13be357-8cb4225fe2cmr301758685a.3.1771001595646; 
 Fri, 13 Feb 2026 08:53:15 -0800 (PST)
X-Received: by 2002:a05:620a:3187:b0:8b3:14dc:4821 with SMTP id
 af79cd13be357-8cb4225fe2cmr301753685a.3.1771001595056; 
 Fri, 13 Feb 2026 08:53:15 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b6cb1sm1673648e87.84.2026.02.13.08.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 08:53:14 -0800 (PST)
Date: Fri, 13 Feb 2026 18:53:12 +0200
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
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
X-Proofpoint-GUID: Nnw8KiLDTQBhzQNXfXy-2sroUxWTFZau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMCBTYWx0ZWRfX6YBhwWU+g9tU
 0CVA9uW5GWnBXUz0MptQE1TRYrYpMYCv9RsV+Ana6RuUcUWhNrD/RcBxBzyCDMmudqCxR529Xcu
 dP8jKzwF8K9nvz4FvXaDHwU+dAD00uI+Cb+/C/5W14nrp5fQhcCCZ/VpaooGd9PSfD+n+XN82gK
 P+x0B6vZk3OmNddXCSH6TIchxcQUy1MUvzeTftlK5W2wI+9KtkjQFu4/+8Ux5YMqP7Sw5dpAf55
 9MPAs6D2xSONE/mOXiupGKu9/SryZg/Ok2UO4lC9ScO/tFY1JYXXSFRQNYQyZGgPOCef6D5saIG
 NL4cX6fEtb2bi79tz7ubhASMLyE8vL5v1PPimO0wQt23b/Ir/1tTdfetwhxaCLPpCVX+nuVl3O7
 itu+ah1CqMDNfM584L+MlPNxZVJKWH9zuCYADuDvO7vpS8uqzTDeIx5xkIkh+Z1MvX2PltypCRT
 ONrSGxJM5J8pnIUUUmQ==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f56fc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=LT1BtIMsji7uXtgOJFYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Nnw8KiLDTQBhzQNXfXy-2sroUxWTFZau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130130
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
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim]
X-Rspamd-Queue-Id: DDB5E13864C
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
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

Wait... This still isn't improved. The dpu_plane_split() function should
not be called if the plane is not visible. Move it after the check.

Yes, it is currently a part of the code which is called before the
check. But there is no need to keep that.

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
