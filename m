Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE9A80390
	for <lists+freedreno@lfdr.de>; Tue,  8 Apr 2025 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD6310E037;
	Tue,  8 Apr 2025 11:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAsOPgkP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDA210E037
 for <freedreno@lists.freedesktop.org>; Tue,  8 Apr 2025 11:59:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BCc36014252
 for <freedreno@lists.freedesktop.org>; Tue, 8 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=J5UKc7ae/UXmKHiunvfff8Ov
 kaw6Ua5MEgH+S/e5ZyQ=; b=kAsOPgkPIbWTYpxxLnV2o/tiI/3bdehvaBEoCyZ0
 dKGf+6HEMV+mOXtQg3TKew5ae8DTSn+qdcXvJtxK8ge+EnSr0tx+sCis1veuSQzg
 3edDDEClKZRUG3Frlttq3EXW9eGg6Cq4X/qOzYcAUEzeYFIgmgXGz/jg2tCX0Qeh
 VWNmF31+A/CHv5/qZ4QGp8dwZPB7U8WGPeLlfGkV1qCdeh+Pr9a3vvCkTGjqRHjf
 xF2zmMvSqSQDEiIKdecpulOEdxi8iAwxtfFzVa7K2HvKyiTWyAFBTNH+DWP29d2W
 vg8Y4qTFoI8b2c5ttNqjBRTpAkdNMdU6PF+BTUhr0+c3xA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm7m0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 08 Apr 2025 11:59:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e2872e57so1026198485a.0
 for <freedreno@lists.freedesktop.org>; Tue, 08 Apr 2025 04:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744113589; x=1744718389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=;
 b=sML9yGn3UptqtBaFEJdMkQCjaJb8FSGI1yGrDe/q8DM/OowPd9Uf9zjYewWds8xdzT
 ALeuUu0BZAui/eUHuC+hpYUDv3zhmK9rp1qCjVX9FIu5+FwjO4CoJp01ptRp1lNnRqKl
 U5S0bsxut+oTY4pW6T+fJ6RmhlipY99Woxcad+iljIq3mp86BVmttcm/50gVKZehfSMY
 dXE7IcoKReXmsdNPeSqRakbWaB5oc/JjGBhfQ2LtIqyPN9hfexbx3fjs1Te52TCevK8E
 NXZTu2bzHJdbOocm1k938Sdu9GbBSgrJSzBRHu0Xztzgensmg3HtmdsOpzFFynQJvFnQ
 oOVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfuucuEK5sJjfwPHOa2KPdf76NBpfZ6srmGD+z17fN5ONIKIzI1+0KnAEIvokzhw4AOZQFuhmbH4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRPFgzckltSQyWZnzURt/2YBPXQ1acXKbbDJJeAM1FfQzOA2bw
 U7s+tWpBYAb6xyRzjNwZlTLZuzoOVY2E9poJGDHwLtvlYuRRQtV/6gkRoEc3mIZQhFpKO0fyQqs
 WdrjXqBgO2V2+ub5GX+KQTo25Hp4o9sFxzjEbyGwRwyUhBMwDGJBN2D/S8ilOlITfPc4=
X-Gm-Gg: ASbGncvVG4kJOCTEczViwjL4LxYfk3C7P0qloAbLz4u8mP7GWhS/63aQ/xijHxPmNV/
 tgJzNbXgGq0GZABKIETStr46wXvgfA3HVvO+duuYaYH8zK4TsOCNFGQnl0xTnOkCP1LuK6Jj+aL
 JHgBkCMEdzFitHgAMhiQh90m5Kn5oFsnKiSiwT6z1rGpS9KbVRdevc4qKxUij+BJ7DXRjRMi7c9
 Br4yauHrpAYGoZyqqM0rzJdgtWl1/ndOEHWLY0WX77UWkcyYRRg63RORQH19IffzxBEdhp9iLF+
 xnSaopMVJxb8BqBtYB+MkESqfd8OGevRVGR9+XFNQYvMoo+alRrmQ4flSEcoL8L+Jau9ln9FM7x
 x3UU=
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id
 af79cd13be357-7c7759e8788mr2682361085a.6.1744113588989; 
 Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjG0AgWeS1WAQhJR3SCJI5Qh4YJ14xwCKURGmhWqtrP5XHH87RDOupWg+DezPfWGcaUO7og==
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id
 af79cd13be357-7c7759e8788mr2682358785a.6.1744113588696; 
 Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e6370ebsm1479003e87.130.2025.04.08.04.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 04:59:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
Message-ID: <s5uvbdcv7pqogwg7gyy42vfxv3ubffj4ww7nili6sd3y67kdf5@byctauuurvwe>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: z6ocs3Dpc-bXXYz2SIVIf8cioICFJwGK
X-Proofpoint-ORIG-GUID: z6ocs3Dpc-bXXYz2SIVIf8cioICFJwGK
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f50fb6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Yq7wtpIrRiHUN6cIw-cA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
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

On Mon, Apr 07, 2025 at 04:23:31PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
