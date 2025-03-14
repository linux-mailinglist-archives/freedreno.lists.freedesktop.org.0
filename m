Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953CA619DD
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 19:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BE610E8B9;
	Fri, 14 Mar 2025 18:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5MINVdX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6ABD10EA41
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 18:55:12 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDu6Or024861
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 18:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HduUHmuvaB6gfmmV3ws7Fo/V
 KexaEbdRlx2tI0VvLX4=; b=j5MINVdXVPvVulqxvi7a0/aWKZSLSCpMkIeWCDBr
 PRGyNUPUaenkKpyOfkTUOIbcR71//Ktj6N++ZVDG9qAP1lVnXhf0vhl0G/S8evGi
 IuCHK3ROPe5/gWfHHTuxd9MDGbwyt6ukzxVTSmY3Dn8Msz+aYS4xc7TSL39Oey5p
 ZeXe6D/7rXSFxq+7DU15fbvdTHC3oXi4lK98cMtoeNvs0++3bDCQe1GdOmE/9NCW
 Z6zPNx5p4qW9za9OC0OPb6Q+mc3l74a5cZq2ep0NBdMaIrMjL86i3R6F6ZVeJy4e
 T52VqjDUtpx7mnf7VimKcJKDb1K5qt1LLdzeozG8ClwGnA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45cnscrtb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 18:55:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8ea277063so59044116d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 11:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741978511; x=1742583311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HduUHmuvaB6gfmmV3ws7Fo/VKexaEbdRlx2tI0VvLX4=;
 b=AufykaT86sJcXoSp/wB9Gy2eP7iRKpb/DJOaRbYDOIvuik2N9tlV/cnTiwLD5cU5VC
 NHNHCH5JqjT5xFiCEuWKYjt5v860fPptmMXUBOGtejP+fT7raIhg1J21fxh9kmmeSFaC
 LuY2l4dtNa9Qo2v0SwcYS7OrnMuOkF7Q+DyYsEWezqpxF9p2Sg9PoWvrxjaqeJvU0HvP
 N+Q4Szorsp1WH+MOcnoCM7j2ZuJb//ljoQd83VRS43LH0S0Lfp52G7atkWlOxecfGFvz
 RSxDuod+L9zkEeB/rJOBJryAw465r4HaVFCkMIhxho2J4V7DuVBLXfRT6LqH+glliKcy
 QZ8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK6xMs/Fz+oHFjI8qJJNl+w151lxNX+hmXEwmV3p1bOuvgSHqSb2F7VZbmsR8Uwt1Nd9FR1QuPi1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4Q2w2e8OmWugZhNpTOl3hoFIu/Sx2MiuBFt2aeZIUsoz3aC6a
 7MmYdNkqbWr/3sMUB32M2B5mF/Tu5dgPUQW5Upl2MvfgU6i/LEvhq4BTGnaFUXFtz/8eQzoqY3h
 PVXVYfEEO8V1ZkUhLFrnXvoO6EX6WUYQHqJhubg+iLkhOcmYWKOBUGoaRyhG/bOZY2jY=
X-Gm-Gg: ASbGncvuRhDibFJYeQOempvBEKyT8Aosrexp9VLED7RCNIaAff9QAN2rZUzEiFdQv9v
 /ewbV4md38hiDyU7AS6O6nT7KzEGs0Lp2A9bzSu0njedh5JZV1S149FtHGrfwd1RuSPMmo3FdNj
 34oEoNNPWi4L53wLgrOv6rCYRF2Fste/lEdj6iGsVBFcRDBpgJuVlwQsFo37tJOpUPUZPMPBfoB
 Vy+H3vQBUVR2WPoLixbt45vi8LCZ+xq1Gcjp9GQeiY9iC9/y2cT8pSUhhBLRLXdoKEqoG7OAbdS
 fzgByQ3P8DuA++eoTs96TAibmTP2zlQRslfQkwfOjviwzuh+sjZE98i1G8MfmzcXMzABRl7WE9/
 t+uM=
X-Received: by 2002:a05:6214:252e:b0:6e8:ebc6:fd5f with SMTP id
 6a1803df08f44-6eaeaa8e3f1mr49273876d6.20.1741978510737; 
 Fri, 14 Mar 2025 11:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE257MSzOWoy11FijTGYTY4RP3nDJLcq+KMpo80CBlog1fwjsIU/CJtTndItZwBaXbwOab9dQ==
X-Received: by 2002:a05:6214:252e:b0:6e8:ebc6:fd5f with SMTP id
 6a1803df08f44-6eaeaa8e3f1mr49273396d6.20.1741978510399; 
 Fri, 14 Mar 2025 11:55:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba8a92f3sm586420e87.237.2025.03.14.11.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 11:55:08 -0700 (PDT)
Date: Fri, 14 Mar 2025 20:55:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
Message-ID: <otidtln4pjb47azr7zhllxkqmwocdnbdiay6xcg6psphz3436i@fn5hxgaflgv6>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
 <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
X-Authority-Analysis: v=2.4 cv=Qbxmvtbv c=1 sm=1 tr=0 ts=67d47b8f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=lSd5XUrhw2FdKyVgWKUA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: LhRBLMvb92CrgJHTYelaDxYzF9VsjVIH
X-Proofpoint-GUID: LhRBLMvb92CrgJHTYelaDxYzF9VsjVIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=866 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140147
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

On Fri, Mar 14, 2025 at 05:54:14PM +0000, Maxime Ripard wrote:
> On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> > It is common for the DisplayPort bridges to implement audio support. In
> > preparation to providing a generic framework for DP audio, add
> > corresponding interface to struct drm_bridge. As suggested by Maxime
> > for now this is mostly c&p of the corresponding HDMI audio API.
> > 
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

You've sent two r-b's for patch 2. Is there a chance that one of those
was for patch 3?

-- 
With best wishes
Dmitry
