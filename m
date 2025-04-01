Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32080A771FF
	for <lists+freedreno@lfdr.de>; Tue,  1 Apr 2025 02:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D6410E4BD;
	Tue,  1 Apr 2025 00:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+J93/0q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4810E4B3
 for <freedreno@lists.freedesktop.org>; Tue,  1 Apr 2025 00:35:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKGV2M008453
 for <freedreno@lists.freedesktop.org>; Tue, 1 Apr 2025 00:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xVZG5XFmHuEOv/oou7fYzA05
 cG9iGzRAigpfxBHQiuA=; b=a+J93/0qSoeRKO+yA9bJBTkfRclycEtd2Lx3NAQ/
 jPSjh+io7iw5THr0ul2LU3ISPF/kcRNaD3XsqXA3oV2/P43GbqpiR4objUqWtdVA
 9/e2jD4AoWssBvLZEL4p60q8I0Y0pBpW1ib3enau8RpIz/IhcK1Bv6zvEfvLKnMk
 kCfF44xwpB14rgJDPNfVphkmUcwMb2MFimMqKObvS/VHGt6quBKGQeVWy1IJIlXs
 evXTLuSOhLrRRf6VRzKXhjkThMn6t6EjLRZ52j/6RDiHHqQ/mgxsd4jeXZ8SIjlJ
 fAJa0h6R9lxYAIs490VFTK/GTb44zxPT3+wvQQbNQstt8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xngenq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 01 Apr 2025 00:35:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5d608e703so915451285a.3
 for <freedreno@lists.freedesktop.org>; Mon, 31 Mar 2025 17:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743467748; x=1744072548;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVZG5XFmHuEOv/oou7fYzA05cG9iGzRAigpfxBHQiuA=;
 b=l0CAy5y1tKc9vOFnq+zxkz3fEcG7Z7P6I7ayWOutHu8Oi5TVEFpBqSqF7O3GDTOeVr
 PhAojx4GcTzZ0g4HWs8681l78o/isEUGPHwGyyS4YkFIR7R2pBAsXjjS9ANPKBRkIrxw
 KPrqzslPaW9cZtffXTgD8sfUJv6V22YTq/sLNvqQhBKElCo2uFNvW9p7OxXGOTfM9NqB
 Ptz5ll8iIgpB3uOoRfSznhVel6GkvLgIPfA4YjhCCH4usNKAasAHtIeKaj7zIlkZYK3T
 9phGo/0W9aNs4XDQDjie5T21KGflmSRcH7FfSJkbMgy3OFLBXkVdNyqW4IZRDyv3sBdx
 i4Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8npoAva4MhEwt4NEdGss/S5N/y8i6JtIweitlZmYbgL69xnZlk3OVKmwPeyYg8oFHrg8YHCEh5vM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh9ZX8paLugAuXWycS6Y39xYZ4VzolegdCgccoIrh+qnYxqEXf
 mEzlcW9D2C9FXHTm37TrMeh981qLpgaLbU9A9mFHHzG+cnYp1PKiu9KA0WzGRaVyYGfuuIj3GqQ
 5PtTXGD67FgwfzLlrwgjQrppkUvxpFyy94teFqrmD4ZaEdRyhOilCK19jY6yEAPGisBA=
X-Gm-Gg: ASbGnctFvlFljB1ES0D+4XP3r+5y/WaP4LleqMyWi153ygn/5mu3O5LQkOdjEllY5cW
 whPJwwUZFWlkojLOF9rjdbqZmk6ydL6lYFhXXN8c1hTjhbFODnnZXl9T+gI3oxzIDLseNTl0eoe
 gFhtND26xpgeP2SGPDB66acijrUwyyOhQsDvMehM/lBN6u+RwbiaStn6YxpDw+RRgcmsBfer8TQ
 7UxGs5Y4Nc0buNIKPs1chXt0nM3bVRFFhgpQ0mQLc3J4I6wIqPEJICyfLKTOFcZLfdtf1b2KAcl
 CPf7kAIVB9NL3gUjKM9qirgEItbBCRyyb/mJZhgRNzMtMNWFtfGzMgejHK8fiApB7CZHNSM+EpM
 fdIA=
X-Received: by 2002:a05:620a:199c:b0:7c5:e38a:66c2 with SMTP id
 af79cd13be357-7c690894ff8mr1717399885a.58.1743467747825; 
 Mon, 31 Mar 2025 17:35:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA1opS2Ob3NuZOH0FyIY6wfqVH21/dPNFhnu8zvlNMPksgVPFTQVVPl0FPx1SOzRn48BMMjg==
X-Received: by 2002:a05:620a:199c:b0:7c5:e38a:66c2 with SMTP id
 af79cd13be357-7c690894ff8mr1717396385a.58.1743467747473; 
 Mon, 31 Mar 2025 17:35:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b0959f429sm1232125e87.212.2025.03.31.17.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 17:35:45 -0700 (PDT)
Date: Tue, 1 Apr 2025 03:35:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Fix support of LTTPR handling
Message-ID: <qcmyxcfhtecyddx42aaw6or436qj3ghsq6uckyoux4wulcn7oq@hwyg3dddbpb3>
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
 <20250311234109.136510-2-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311234109.136510-2-alex.vinarskis@gmail.com>
X-Proofpoint-GUID: kkMbal66enlmpyivMSzTCa__fFjBl9lD
X-Proofpoint-ORIG-GUID: kkMbal66enlmpyivMSzTCa__fFjBl9lD
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67eb34e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=eggZMxrzFqzPhGHCAmkA:9
 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010002
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

On Wed, Mar 12, 2025 at 12:38:03AM +0100, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines. Initialize LTTPR before
> msm_dp_panel_read_sink_caps, as
> a) Link params computation need to take into account LTTPR's caps
> b) It appears DPTX shall (re)read DPRX caps after LTTPR detection

... as required by DP 2.1, Section 3.6.7.6.1

Split this into two patches.

> 
> Return lttpr_count to prepare for per-segment link training.

And this one is the third one.

> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 29 +++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 30 ++++++++++++++++++++---------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 43 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bbc47d86ae9e..d0c2dc7e6648 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -108,6 +108,8 @@ struct msm_dp_display_private {
>  	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
>  	spinlock_t event_lock;
>  
> +	u8 lttpr_common_caps[DP_LTTPR_COMMON_CAP_SIZE];

It would feel more natural to have lttpr_common_caps inside msm_dp_panel
rather than here.

> +
>  	bool wide_bus_supported;
>  
>  	struct msm_dp_audio *audio;
> @@ -367,17 +369,21 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  	return 0;
>  }
>  
> -static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> +static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd)

Hmm, why? Return code is still unused in this patch. If it is a
preparation for the next one, it should be split into a separate patch.

>  {
> -	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> -	int rc;
> +	int rc, lttpr_count;
>  
> -	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd, lttpr_caps))
> -		return;
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dpcd, dp->lttpr_common_caps))
> +		return 0;
>  
> -	rc = drm_dp_lttpr_init(dp->aux, drm_dp_lttpr_count(lttpr_caps));
> -	if (rc)
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_common_caps);
> +	rc = drm_dp_lttpr_init(dp->aux, lttpr_count);
> +	if (rc) {
>  		DRM_ERROR("failed to set LTTPRs transparency mode, rc=%d\n", rc);
> +		return 0;
> +	}
> +
> +	return lttpr_count;
>  }
>  
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)

[...]

> @@ -64,16 +67,24 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
>  	major = (link_info->revision >> 4) & 0x0f;
>  	minor = link_info->revision & 0x0f;
>  
> -	link_info->rate = drm_dp_max_link_rate(dpcd);
> -	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> +	max_source_lanes = msm_dp_panel->max_dp_lanes;
> +	max_source_rate = msm_dp_panel->max_dp_link_rate;
>  
> -	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> -	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
> -		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
> +	max_sink_lanes = drm_dp_max_lane_count(dpcd);
> +	max_sink_rate = drm_dp_max_link_rate(dpcd);
> +
> +	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(lttpr_common_caps);
> +	max_lttpr_rate = drm_dp_lttpr_max_link_rate(lttpr_common_caps);
>  
> +	if (max_lttpr_lanes)
> +		max_sink_lanes = min(max_sink_lanes, max_lttpr_lanes);
> +	if (max_lttpr_rate)
> +		max_sink_rate = min(max_sink_rate, max_lttpr_rate);
> +
> +	/* Limit data lanes from data-lanes of endpoint property of dtsi */
> +	link_info->num_lanes = min(max_sink_lanes, max_source_lanes);
>  	/* Limit link rate from link-frequencies of endpoint property of dtsi */
> -	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
> -		link_info->rate = msm_dp_panel->max_dp_link_rate;
> +	link_info->rate = min(max_sink_rate, max_source_rate);


Please keep existing code and extend it to handle max_lttpr_lanes /
max_lttpr_rate instead of rewriting it unnecessarily.

>  
>  	drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
>  	drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);

-- 
With best wishes
Dmitry
