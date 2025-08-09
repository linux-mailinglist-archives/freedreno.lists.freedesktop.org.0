Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3EB1F29C
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 08:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F5B10E076;
	Sat,  9 Aug 2025 06:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmVEU8wo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB1010E076
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 06:46:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793Upnx006425
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 06:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqIzyO03+Zog8XVeXGSU4+9P
 xhsWU2JVSDy83gBx3+Y=; b=VmVEU8wozQFb73br1lONVGOPVLjL8QIsmsaKBUWr
 UX55++1WzarJEEFxbE1+VxoS+FOJUoxyHKTX9CS/pbaNrBcfo3keJ/hL95DD7nHm
 ZX0evIO1T5/C89z7BflaWGN+C0m5MNSuoBnlOZ9GGSyK0i9nW5Nra0dwKjyHuYD9
 TKCkJ6rtiUiZtl/CZQ35iWMv/E1PnPCDagpkkyfaI+rdudoT9zH3LdK1QjZ+jjxA
 Ou7y3XptnFeLALCxWWnfnnW64IFRR5ODzY3qDH+q/2eysyaweCYQSxhk/0/7kiCW
 epWcBZQzqQ28PKMPdA36oJUbV42vjpMyDiFDG2Aa3c+wQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdur75e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 06:46:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b065932d0bso78429361cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 23:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754721977; x=1755326777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqIzyO03+Zog8XVeXGSU4+9PxhsWU2JVSDy83gBx3+Y=;
 b=D01/hXgnH4P2ja+EVfywGZC8gfA+wkG7KzyTxvIrujAcI5ow/uJ25Hlg5RB9mXzWam
 EUj8jt1EDMT1oEm0+YIu07wNGrwanMA9leX1WpaHJU5xTvWTBA3GqTZn7emNr7KcDjVQ
 xWbvEeygRIJxJyrwOZPip8U9+4u6wGD2rdp3NasLS8FzjrGtOrpct5kuqdnGpC3RYsSm
 Wlu/7Sod/wUFpwhWXFpEpvvgV1ktTjKgRduLzwv/gT01eHrxPwDivfnolY++rDaK/LGL
 vGO/hHUX187n4a7Wfug9IVnj26t7epnAluMw1usq1vA6kV1Z2XcF/JFP+/uia5GHXVm7
 ti4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwpxWSZT4e6Lctimar5enIDOisO6VX+OrmAFNUcNnTJ+9+mpYxwCKSjVGKKURleg7r6KfFZMWLU8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFvYpQNTpPuRqbca70eq0wffIhv4b8lA0MLmAxg4WgTgcnlXGy
 83tVera87Oft5tpuy2hDHEj46t7Lylr9ru8bB3Yt6sgtBryGizY+VchRHpCLYdaZ8w1PtMyB5Bm
 zrNedAQxJn8pKMBG1+8i3J15OaX80si08FAEOEek/wm9YgajbUVNhW8kCy40pNPGyDiz1HaI=
X-Gm-Gg: ASbGncse2LOxAZrfYJfKzoxAgVbxtDQwsiFjJGguTwJwoNxm4MOqLjcY1jq4PcM3ZWL
 k6L9LZmp1r9Kv74IWd7h+fHtS7xURoXtyvhBMfgPQes8ijpiJTHekrQQkT5ePI28hYpNi27DJaS
 cSMLGruFEuQzvh3bN3K9zBh6CimS2xzaR+hcnqZfDFQ9HWlvq7BvhtNx+XEZcCZjomPRRdb7eWH
 GJmD6dicMbnGTQcFA7CkLMuG2xnsQBZtcS7HqgTVwHzs6mRJpsTVYXGTTFanXS4699+9l2vtfpZ
 uo7I2Kd9cklXMj1NQyaQIvleD5cKqDpJXIZGxlOaHK0kFOGNay+Vr8rpFKhNTItj+3sPGp/ErWQ
 aMtBTLIUC/A1grDM8+KFKqmIkQJYFAi//l+Fh7Roi+9kaMnk+42Ip
X-Received: by 2002:a05:622a:1181:b0:4b0:7620:7351 with SMTP id
 d75a77b69052e-4b0aed29dfemr82029931cf.13.1754721976636; 
 Fri, 08 Aug 2025 23:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7uzAueb/H2T7wTR91arcTcUMFSM/xMGIdUJ3vbQ8Trxnz26AgjAqlfb42BhcAP9WpwSKUYw==
X-Received: by 2002:a05:622a:1181:b0:4b0:7620:7351 with SMTP id
 d75a77b69052e-4b0aed29dfemr82029661cf.13.1754721976092; 
 Fri, 08 Aug 2025 23:46:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332388fb356sm31344371fa.61.2025.08.08.23.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 23:46:14 -0700 (PDT)
Date: Sat, 9 Aug 2025 09:46:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 06/12] drm/msm/dp: Use drm_bridge_hpd_notify()
Message-ID: <6ve3hpbcki7k2erktnaxkouyxxzeuii46hgeqscqrmurya2cld@e24gp6viluhd>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6896eeb9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QNbhuYZ5RTNpGKTg7GoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: uc5XIexHlE8xmV5uua-dK8P808xhgQgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX0c+/7YO5xSix
 jUNjuNTeJyKzKAY+qaqHlvTFQsFDRs0Eb9XcV0xQedQH/61eM7QIl4kzfOVy0Z0/LnE+bUYsF21
 q+hqN0CpWnozyJM0Z3TJSEugwNJFMs4Zyk5JnP2cIy9bs4MImAq/I0TzJb3+ul8xQGm1c4yFQ+c
 RnQkTCnZ8eYcbwMQgITthLrUvA0ve7j/PbFZRcanrLwGqZHqr945lRBT7XI77pQ/R5K/OFLu6js
 dKWtvw61QSKL5764V1jtNCp5we7WEAn4meVtX5433+wbQ7hlldmwWTLR4UTy9L627ujeyyShhxg
 YpgrFrnwCTWnEp9x3TJXLf/BuoJTdT5O6tcjsCTgwKc9jc9/iMwPdF2p0B0S9i4HBf59sx7q/uY
 7ghc9v2Q
X-Proofpoint-GUID: uc5XIexHlE8xmV5uua-dK8P808xhgQgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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

On Fri, Aug 08, 2025 at 05:35:18PM -0700, Jessica Zhang wrote:
> Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
> way, we can directly call hpd_notify() via the bridge connector.

I can't understand the sentence.

Please start by describing the problem and why do you want to perform
the change.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 55fe8c95657e..8779bcd1b27c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -333,17 +333,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
>  	.unbind = msm_dp_display_unbind,
>  };
>  
> -static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
> -{
> -	struct msm_dp_display_private *dp;
> -	struct drm_connector *connector;
> -
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> -
> -	connector = dp->msm_dp_display.connector;
> -	drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -367,7 +356,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +			      hpd ?
> +			      connector_status_connected :
> +			      connector_status_disconnected);

I'd really prefer that at the end drm_bridge_hpd_notify() is called
directly without extra wrappers.

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9..60094061c102 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index e4622c85fb66..f935093c4df4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		}
>  	}
>  
> +	msm_dp_display->bridge = bridge;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry
