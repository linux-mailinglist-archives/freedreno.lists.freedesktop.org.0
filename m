Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3551DB1F2F6
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 09:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7010E271;
	Sat,  9 Aug 2025 07:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3azN5yR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CBD10E271
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 07:55:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UDDx001249
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 07:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Bpy41yTW5kRsP7L2ucrV9Bxz
 +ufAx1/nlB3z+r30uRs=; b=L3azN5yReOvTEHISGrnQ1UntSANurOTQT5AqzaY9
 PQLv+vKNoOlcpr7LTQiuHi2gMPlcGhAGYBYi5siKR6d8IoeWxWBcLA5QTA0XzbDW
 XlhacyWDqFfoRMH9YDI2i2Xeq/UY8KInMwyT/Z8CzT0bAQWBN2quRFpSIQ8u7PRa
 slxPcjxFlSY+EJ+liNs8DQtMertIXlSplXdSNrkFBmiet6O359ajuJoCPDsukY6J
 +J3s+ywvucLrI7+I7qJ7ozOQPTOEdNmSWr9ymB7CfYLxO1kbRnp62WIUqXDTrEsM
 ayjKPZ2AYiD12ZAm8iwFPE649siuQ8W535y/Wz6JJqE93A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sgd7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 07:55:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b085852fb8so103408831cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754726129; x=1755330929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bpy41yTW5kRsP7L2ucrV9Bxz+ufAx1/nlB3z+r30uRs=;
 b=H4Yqwfoo7alkSHP8QzGFjeI2SIZgMQdeE+8jNUsODoQB8ZfM5zrYIX8TWhHPefjDPt
 yYP07fM4X+CfoLXd7OgnDn7WRUwRh/twUnX3a+G1Q6lTg2Ypft31MfPKoIUJy7jPjpgy
 W6DPFIK9o0gM2cDZpx6rHfvA+3faODijTQK5QA+qMCMAE2QZhGFaKt7rLaGbUGNf9wSX
 2B4pQCZFFw/AIZLNT3vG6cgRGR1McRvus8amUIqMZDzto9c0PJeC/hvUueAHP2vfkVY4
 K1tWDgSJ2HTBRGhT0+cRvIEz1VnCcP9nIE+LKw5NDPrOhVhrln8zkIUmJ6NF5pIQf2rZ
 vD0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9xatRIeIROqE0FaBh/NVSDqFDxGElxD7rNhhJ4TePtwD2My/tX3GFluHe6ox+B40spMs7qZ0QabA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx26WNEi8ABlucq6UyTzVtNLIlqUjhlDOa+WoBK2KuVBUmTtQJ7
 dEQDBgYWJ2Q1TAj63OET8FqU6WwP6kIoyrgTJMK6yrv3z4gyUSkYVpRuV553QOQDK5zgYOTDZxV
 jMDjReHbwLFdLW7whgchB6GrRSRYAM22TJhNH+0f6tpsAlvX09HExDbngDNPRdPChZSlPTOA=
X-Gm-Gg: ASbGnctd3TyXPWD/sDmFScEWuAC6/rY3hbAmLiL5jGplcCQcDE4EAXOCLQTvliGC1gl
 JCe1W9enhiOgwt3YbE908QInMqUuFYHEZGsd9Flm4wvUxM4mNpkUGWQhHAsxC919qHBKUQziA9O
 hVeDZjKpnMGiy+KiiO8/VCzKOHSvDIzP5xfRxI8kMnFfUsLUexeiFbYFRNFTWmpaoTlA6eJxPRu
 QaZ6qoQ45hPzs5RZnxQ1ppuONlLLVPjb3atjQbdAHZwCYnji2MqsZc36z4tIh9CPBvMK5qlyFZk
 r4D24lwFAkzHJVXZNHi55OLPX2llBH3gjV/1IAXwXSpb4QJF0PAp9xGkNequaJaXQuTfn9vg2DL
 b0Ha/bcu422zn61vICwbSnzwwvBqYcbCRpJChxU8dz7bcvAtfT3GM
X-Received: by 2002:ac8:7c45:0:b0:4b0:aba1:d716 with SMTP id
 d75a77b69052e-4b0bfcba7b7mr22351751cf.51.1754726129100; 
 Sat, 09 Aug 2025 00:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWh0wH/XYu6MxnL9BGa8/d04wIKlcDPKSSS431MPGMBx8HxPe0UWHgnixqCdznmpzQTN6fsw==
X-Received: by 2002:ac8:7c45:0:b0:4b0:aba1:d716 with SMTP id
 d75a77b69052e-4b0bfcba7b7mr22351431cf.51.1754726128504; 
 Sat, 09 Aug 2025 00:55:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-333bab6a92bsm27111fa.45.2025.08.09.00.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 00:55:26 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:55:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Message-ID: <bxobv4ofetrhnxa7n45fmm3sllqgy37fzgxnyutm3osjqg4yhl@tvdsf6mghuqk>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
 <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
 <DM3PPF208195D8D863A5A2E8A151A77A7B3E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <DM3PPF208195D8D9DF6BA02300F667B1967E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D9DF6BA02300F667B1967E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=6896fef2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ft45mRQNhs6EWNLFJ_8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ssg-TYejCAiITgDmGvnhXUpjOmoif4kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX7dFLB7HIvgyR
 OU6sHudJ9M0rCxtkIqUo0ybtAGECNCNaAE/BN043i2OQ8snxWmoBo9+t1qiSJSYEvtKbIhHsJm6
 A3EJlj/rPhJFiZIl10kSP0nnTChMhhwfWdh00ju2i2x847tI2EFGWrOvQ1qZf8RVP0Rpcq5J5Sw
 WRQIONkKvRl3nw6YMnFa3vQbOiPNXDvBm60lArEilmL2VoW8ZDXwfP91YwFyoQ/6SMl+PSDt++H
 FdMKWq4nJ9z0lBjq1BSom49gzZSHcNJdnHJS4G3OoDGN2H/HWz3mtpJV7/3UjbU5eo3bNq4HTC+
 eHL10RmZyLqXbY+HqszqomCvbD/iW0SBiycqYFdiwFK9JGHN3Jpi+Tp3lWFit/MKk96/oO4NCbt
 xsF/qsRs
X-Proofpoint-GUID: ssg-TYejCAiITgDmGvnhXUpjOmoif4kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
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

On Fri, Aug 08, 2025 at 05:24:19AM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Kandpal, Suraj
> > Sent: Friday, August 8, 2025 10:35 AM
[...]
> > Subject: RE: [PATCH 8/8] drm: writeback: rename
> > drm_writeback_connector_init_with_encoder()

Please fix your email setup to not include this splats.

> > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > LGTM,
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> One thing I noticed was after the Rename both drm_writeback_connector_init
> And drmm_writeback_connector_init have identical comments both allowing custom encoders
> To be used now is that what we were aiming for with the only difference being the 
> ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
>                                        wb_connector);
> call ?

No, there is also a difference in drm_connector_init() vs
drmm_connector_init().


-- 
With best wishes
Dmitry
