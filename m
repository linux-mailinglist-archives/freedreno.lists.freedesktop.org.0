Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BADB59F74
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 19:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8610E12D;
	Tue, 16 Sep 2025 17:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjSML6OU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F179510E3AA
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GADPvi019573
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=asmJMTOYWO6MF0j8LTYTYFsk
 hlkUXWRnPY3+bCKiCFM=; b=XjSML6OUsA7YEzsSUp9jzWcCdOj2nMcPPedHkIu9
 SiBG0MbFV6Eh9qVS+Xi9etlfsevozD7saVGyecfN/LKtlqdw1bGuB3a3EInXjH2B
 dPbYiMHzMSydct75/ZBHqiqAc0JzK9XTfbWVBUYKb4uiVjkQ9EZYsVRIfbojdbw2
 oflzVPFO8/qEfWOD91rhhvYmkL6vor2rSW+mTDuiagjZLfVjj7aVnwj4tdX6sKTF
 DnoPQ0AcJyG3kDCZCNmn2+/akw+kwI3gA5vyKlAFzpbmERkFAcAIwufRc6qF5w/N
 SJ6er7IRlPl+rAL/GMAAxSL5jceGigwoA/poIUa4/As7Fg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma9v3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 17:37:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b49666c8b8so110877431cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 10:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758044269; x=1758649069;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asmJMTOYWO6MF0j8LTYTYFskhlkUXWRnPY3+bCKiCFM=;
 b=bbR0ZrQ398s8z/So834HCgRU1qMv+/U+5wQsbI/nOgCU5WeljEjeaJZcViFYJaPRFv
 wJc/fz6etr4DD9lKnj+StakuLaOqzMJpIpF9NUv7xhLCY0bP2Ud3r3I5lQ5Zxn3WQU1H
 3DhwQF0yleuZ5AJg7HtBpbrYwwlwd4EqBpxkFWP8jl96W4pdmALaHSAoUAviuidNeEtA
 8gWmVOvZmkl0n4bYJpnUvJeqzzoSrtRWpJVDewxQq+2lKOb/JQDCJW7H+eRQupXJyvZu
 huTiZqK4Eo1ykl2HBmDyeupE62ckVrK+g8NSdcIhXsII9OanzwiM37BXcDQNyK/Om+3E
 ZzqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwS56CajPWS67zMDV4gatXEaXP7VCwW06CQLwDiZKhfKIRH8kbkQJciBqzTp86iQOoAYeMcU0qfrs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPEWtrvqebPvAXeC6tQMySNW6ANg6YJJyRFJNHcGbGc6d+2hi4
 HhdeggC1dLLQoGtmoXNlkVT0ZBQXqYGNpww8jwpV4ksDqmFbxqacrlz9YLisZjDPmw2BWvt6nTu
 3RKitvjmMBcJDNwBzzu2dkAZXnPDvqRf9QQ66pKeZiv3yVd0Jt/F+HZobsJqgllMEjYCb6Z8=
X-Gm-Gg: ASbGncug3UmELBtQtgALQVj1v0gi+THgTKbKkqkLJyW2hU4TpweyfY2cr4UYQLg9CGr
 41rpIfGcH5IPUwyboDzrKy+dQab3WzIsdILYOXO0FedaLFhMpOCZxK/k6itLfwLpsUVdhCIzvX5
 GoI4WRsW7GUlxsKgFmX6zBlACPx0rkA8sEJpr3SHIxfyg8SZ1hKVCURL1wE5nNlfIsZRmTZNy7a
 +uJGwSr0mnn0ZUa+lwvdKN66bo1/ycIblw505yaEfQbsJZokX6q2GZXvlUzUCOE+C+H3H/dHqsw
 lCsXUrbZqF6gxC8M1dkTD8SIJ5wW8A5hMeWbRpboGjF3PqxtPicvgfD5i4PsU+suF0MslMrofu8
 47qg9U9z0+IrMtIa2eusPjSAmdo2EipqYWngKMtKIxcFP/RoJDSbh
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4b77d08c1dfmr178883551cf.19.1758044268978; 
 Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEINTEPiFvuj+G9ik9pEiQhi0J/sHmetYeMmXJ12N3mEWuP8rQExfbslVak9k+CMhjZMs47OA==
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id
 d75a77b69052e-4b77d08c1dfmr178883081cf.19.1758044268385; 
 Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460f61dsm4437835e87.113.2025.09.16.10.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 10:37:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-ID: <3n5gjebxuafxgsl7yl6ife76cnfwblsggsp2kkcrbjjansbvi7@smi7zeexy5gy>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX8nx3qULFLztU
 ZT9KcBycsdatm84zffVuYsbBib3PZIDERYhOF/7XmUoJmwhefPGlEKyNg+Mpaaqpzue/LSglf4s
 OpzvaJsOtw8OASCIN6X9T7cj1WoypS3p/Nx0a314StgzIlaWMoIjsEtsLkxSu1LomdbAeSdwoaB
 dgJuh/nIPJP4vo7qvSUUugJrErm/8JSYdKyQu8Z3AFIVlejfEDDNUFXjySQh/7hbxRxglhbO43S
 8EROxpmO2Xt7q+tK0ZUJyJ0zGolFtdIyl6TReoCctdPnrUs4XPOSscyiKq/VDD4KKW0T58gum1l
 cPPZzf9+H4q0kSOdKKRNoazJK/u90NP0CmT6JZwcJtKVbViq+M7DgCE+AsLuVofC/BBdk4ix56D
 1wKBn59h
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c9a06e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BgkF6ddApZc5WCf5u_gA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: nBUKV8eu2EOtC4Jsivxn3j6ros4lzlnr
X-Proofpoint-GUID: nBUKV8eu2EOtC4Jsivxn3j6ros4lzlnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019
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

On Sun, Aug 03, 2025 at 02:53:50PM +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.

It's been waiting a while, it got posted as a part of another series,
but I think I'd like to apply this by the end of the week if nobody
objects.

A note regarding OP_HDMI vs OP_HDMI_AUDIO: there is really no point in
going through the OP_HDMI other than bridging the HPD even to the HDMI
audio through the framework code. The bridge driver doesn't implement
atomic_check (on purpose), the mode_valid() check is also performed
against a fixed table of modes handled by the firmware.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/bridge: add connector argument to .hpd_notify callback
>       drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
> 
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
>  drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
>  include/drm/drm_bridge.h                       |   1 +
>  7 files changed, 57 insertions(+), 79 deletions(-)
> ---
> base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
With best wishes
Dmitry
