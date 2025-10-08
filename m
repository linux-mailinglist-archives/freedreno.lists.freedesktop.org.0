Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD1BC65B3
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 20:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77E910E8A5;
	Wed,  8 Oct 2025 18:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm35HvVw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A54510E8A5
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 18:50:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5HfF002401
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 18:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=; b=pm35HvVwKYtocXkC
 KgBjxl7KJX/a84PN3g7r4RKb4r25FiSljFfF0+W+PA8oUpzKh7i19OAwbJAeQwCr
 uK4H5eZoRKU5++bwJFddNVJd+ffIZEZTvGMqtUvedUt4Vtp77DThSZmodrglKARL
 FQetzyS0hXMvZCfYIRLI51jKH9BSPfL7W9Yfsl94SY1qy7SGCRajgJyFEJcZboHR
 993RwCxyAeMkuFZlhjJtL5Bu7ESP8uLnmbefsmT9ZbgN3gS6r3Br47WlCrPpyOMn
 yDv33Tiwo6b3L3xKLwUMFrw2332qL/ViUXzWVX0/lNZsOsx3odEH5pHneOK2jail
 wvpZ8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m09x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 18:50:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d77ae03937so4456191cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 11:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949457; x=1760554257;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=;
 b=j9lXyJVTc0ncTROJz26VDckr9DpgcMC4EXyeGdKHrKulJrraQ6/TQneEVfdQxLRn7M
 T88WuVG0sbNz9GfhQNeq82V6+z9ZvQGI+qaJLCbIzteUgFQlfMVfRheQZss1gB9xR28t
 pqqbUKSRbvJrXqZiANswI6V1v2na+pCk+6dNnltEShxdukeMqCLJkuOLqgxi4vUCC9MC
 Wl3wHCBCxO7Tp4TRAaRhn9i20kwWfSU8H3kg3FuCRiOhS89dVp0TUWcmcp2NxuML1czo
 DdpF9VTcXxLDSgHAC4x7BZY4ByHFsOnNWQ5qF/AJIvWIF1jHm7DIR9inhl4OoK9lJpZE
 9rYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlgtssIxuzOlqW1AHD+gt6e/vfFXAwaIvjqZK87M6RcFfOcSiWO8K9cnchZbC3xK/BKEHgP5zDPdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz48B2YcIFrTWHPGDHgZcFOyyPY83QTSLBOe967lZmFxgkqg4wl
 Xi5EIbFSoe6D3Da56cMj3lvIunpYLWOkgNhlCM0Zv9yB14GVe/ksGhToQa/eBYa6iPKxtvtf3R1
 eITY1WRpTWa9dK9yVTvxCe+RB3Ku+fIK1CBNsKc9p6BOvbXzRfVYeWDb2Qywp+Ct1/ZtrSb0=
X-Gm-Gg: ASbGncv5prOeX8y+4f3o/LGGn0Qk2NsD3YiQ3RWgcNVtMOFtW0M0BiYv0e2kKSIvuMe
 Oqp9QR/Lzb0Ff4NAhoiZ4M7H+YjLjH7cIJDd/S7JKu1W3LnbKT5uWBkkfSAy7xAfBryNFUlPhaQ
 /73bVTIU7NmC9bMGH6Z3xljWDUHdChZJRtwjbnqkvvttNhYhUHjm7wFe+hC316q7tXuYN8otDcL
 EVsU2SACt3kafqiOTC6BAAtusGzp2ZBZVCNnsv2/MTHsu+ZB3nMMYRtfum3Kuuw3zOmO4pr9zAm
 t9o3w2PY2G+XAaay2eX8dRP+IfvV3P8RwhiXZvL7pScLXIVLuQ9mF/kEIK/s+mdtagPS8iTmKSI
 ugeoCSR4zK5IkxHcIeuGRRAgnQwx/ssVzSRVG4RuHn2MZWdkQ4MYGfVJ+EA==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id
 d75a77b69052e-4e6ead76f15mr74281451cf.38.1759949457174; 
 Wed, 08 Oct 2025 11:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUO4IzyC2eM+Rm083vlD0OKO2yWrQqJ+L80WsUVjuOU8S6+ZWJh0vpPqNVGqSnwQ0XcRPA2Q==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id
 d75a77b69052e-4e6ead76f15mr74280941cf.38.1759949456598; 
 Wed, 08 Oct 2025 11:50:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f39d509bsm22551021fa.12.2025.10.08.11.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:50:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
Message-ID: <wy7atek2mqkfg2nkawobibq7abt3w6g5wiu4d25nkctkxwkce4@mffhmrlfrqdy>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0exfQMZA0nKc
 KGF9WSXBtPsB7RUozcbEy8nHiGMvvhV6fpgy/gDzITPxn3fZUNCF4+HNBfdc93D6GjTR1oS3vgP
 jrHrDVUQimOXd9gGaWimqad+vWdYUvfpnNuC7HoYVMOXB4kyvcBUYn9z/hVuSOLfsLoUyfNu+F4
 9TA4p6rLc76tMKIwyVs9aKELCaj/QIbAHvzPLLDoQwJ9UlnKzJFgpkIWPYWAs3fcCSJrf2l25LS
 dQ1J7I0gKAkzL1uRpbFfaCmk7eWMxNHGU+aImzr8IZLBWM70LJP902pDlUhILPx/6atPhD8ADai
 qsjmLyQmiMCvYHj53TwYnupLCllkEJL9LDVtg8Lq5uEawnvH2dQaDSLOL1b2Znp1XmPPtsFAkTQ
 rClGKKTxskGy9MGcqcrquOLHpJ4XVg==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6b292 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=ER_8r6IbAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=Ikd4Dj_1AAAA:8 a=RF00TdSWAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=4fa6rhvZphqvzmXW0hwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=dawVfQjAaf238kedN5IG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=9LHmKk7ezEChjTCyhBa9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7Y4kLTEJqOQCA_NKXoFnUcFZHwTqAX59
X-Proofpoint-ORIG-GUID: 7Y4kLTEJqOQCA_NKXoFnUcFZHwTqAX59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:13PM +0200, Maxime Ripard wrote:
> Now that all drm_private_objs users have been converted to use reset
> instead of the old ad-hoc initialization, we can remove the state
> parameter from drm_private_obj_init and the fallback code.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       |  1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c           |  1 -
>  drivers/gpu/drm/display/drm_dp_tunnel.c                 |  2 +-
>  drivers/gpu/drm/drm_atomic.c                            | 17 ++---------------
>  drivers/gpu/drm/drm_bridge.c                            |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c               |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c                   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 |  1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                |  1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                      |  2 +-
>  drivers/gpu/drm/tegra/hub.c                             |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                           |  4 +---
>  include/drm/drm_atomic.h                                |  1 -
>  14 files changed, 16 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
