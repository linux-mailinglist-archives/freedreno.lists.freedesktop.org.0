Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C18DAA0F3E
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 16:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEF310E4AF;
	Tue, 29 Apr 2025 14:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaLLtT5C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A6610E4AB
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:42:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9mbnD015508
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=95T6lUWWSMvDyPMIc22M5eNK
 HqFKHq2wCTghZ6/oaJE=; b=WaLLtT5C8FQJcBDimbkuPt6TTht/cqWy5fKvWqMW
 ILpQ4FF1A55IxDrswWlIclW1piFJUsnCWdTYFUGmuQysFPqImmV7yUh6xBE/ilPR
 bb2G6myBogFm4RPgPQrk+conHuGunajECg0n9cIdzK9XsFIwHOvJ5mFV1RUDGjbs
 ZNqm9qaxetcA0D+BTMmzHMm8am9RMW5W5xHeAzwGubxvVQ5DwqDd/2+Mf+3fMfTg
 YZ47bkm9K/StMh6cpwHU8/Epk21WTDsx2zpEdRJiFUZw5CT6/OzmtbcaRFmkse0p
 jVHxBm/tqOBWWPBV3MuZV4aGW4uImQHirEavkGqJTHITLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwvvpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 14:42:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so393263085a.3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745937761; x=1746542561;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=;
 b=MMjyqCz2OOIz9fVtQzyKu6poUnauVyPzVwsxomLT4oowq+/PjZSrS1jbVL3JZsapOZ
 818M6SNI1pmg+KAwgfEYaZTWIr9HrHXr8E/cuyJeG2jx9A0CdY6jEmh16dtzpKgOkZQi
 1wjeLf8Wwwj987ZAJOZ3xJsP3NPzA3DdcDaJZNyq2JPQsDrLKaTW/vsCAEiZXW2cmLzb
 hB1r6nzZmK5JSl95QXNb7IVCibZWxpULEcWLpiQ1BxCA37s1AYerYCE9F3Mx2yA9e+gD
 VpFdllD+3Xha7hxHt71HErFlorFLLOqZTmvlG8xcEvCj8egFIZ0oePweaQVZLQ2G1TQp
 VPyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcVn09KfJ/14FLZgDxpQnr6SaOaP34NMHRrhJSVRj9///tU5DARV7qJbb1BBF27teFr6KYm+kDPZw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH3SjyCc4tJ8yOeBHDuJORrSn2ML1TBN+rpn4+2TlEjydoti4e
 ShqYhvss1355prtGBtdx2efBLSmjSPLTbfNeYNfGgmzXBD5T4Jkg8hQJ1i/DBa4Q6qVqr1UfeS0
 pcoJsgFTAxErqmosc5ND7+di8TeO/kZxzHmTX4QlD5lQaWSqH4Sl1XPRtJzooHgIle9A=
X-Gm-Gg: ASbGncthfDhwtUAtSmt5Ph9+wI+v4qKz466LgnkVGmG8fECiBwb9XKqAyzjVyOsGOsu
 1ro95nnKaWmpYcs3N3xCc50P0Nv0vxHQjmNvpHtX7ypUnkHcWyWwhvvbB5GHWrw11hxiKuFh9a3
 FsNumI86ndQOHBOOp6rt+j+wVoVG6Ghy4W9Iogi6xfFjENyn7kmDrQsFsiDI6hrmsHwCGC4OgTl
 u8o0DFziqm/kftXrg6K5nSBDkNrG1gKlLZVPc/U5/InAk7F4OMeHiISiXsmCIn6WWK367mWk65y
 ZcTQmbSpxqtf6hNFud+u1BGvTKJd50cQTqzAKUQjU03YvpA7COK8NCxvcFoxnwa5CB56ieOUDDo
 =
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr2109275685a.58.1745937761636; 
 Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNJAkS5MxDnNhkLq8y60Bm1ZZecLba9P4Zw5IB7TV0UsyjpIf9foZNs6LWwIvq9tQDTlZsQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id
 af79cd13be357-7c9668cdc37mr2109266985a.58.1745937761023; 
 Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb26258sm1895708e87.17.2025.04.29.07.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 07:42:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Adam Ford <aford173@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Herve Codina <herve.codina@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Helge Deller <deller@gmx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-Proofpoint-ORIG-GUID: SQ1Xk8Nk186aDSJa7LsApKup2HNnstBq
X-Proofpoint-GUID: SQ1Xk8Nk186aDSJa7LsApKup2HNnstBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfX1BMXSxye3hAd
 XXSU5G52UxilFlOl6cWwuwm0qt6Hp5k+/ieK/EpSqa3g/FOhEsbsfuUTWkrlh/ahZSt9lcjOldt
 UR0z5/sYaJgw76k0rOfPKQQZ/EaWq/bpsSeQdKViUcwwjkmr0lz44a5apWdgusHAv+GKvmmm2wW
 tXxPlDNxUfOj3h6rKGetXTbAzBuSfcOzCSy6+9ZOoNprZBZp3i6yg7bUGu7cDDACH63r85lZggg
 Z8F9ohCV68YjPl7eGQN/4ULmgIpv7IJEuLjlXumDviQqn5juGW9N6zskackS+RRPQLH269Sduqs
 ZytNAW5/p+gu1xMOY8HpKDH68A3SX0qfwikN0gMSE3PdFHlNWklH2BuvvzhNLDwdjN0/R1MzKmK
 wy5mqavoMgbA6Kt5jY3bbBmcNFBy3GuW70WNkctIPFvecIZNdwBDDq7j0a+Lr8JnyiQw7JX0
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810e562 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=1X4oNAvfgwtBicUf-4YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110
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

On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> 
> On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> > 
> > This series converts all DRM bridges to the new API.
> > 
> > [...]
> 
> Applied, thanks!
> 

[...]

> [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
>         commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
>         commit: fffc8847743e45604c4478f554d628481b985556
> [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
>         commit: e11532be87e437648521a8ed5358c56df11933b4

Why? These drivers are explicitly handled outside of drm-misc. Please be
more careful next time.

-- 
With best wishes
Dmitry
