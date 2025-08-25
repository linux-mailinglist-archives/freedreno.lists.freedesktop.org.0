Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C6FB34354
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E2210E4D6;
	Mon, 25 Aug 2025 14:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmyMyYsx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD8D10E4D8
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P93AAO026431
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=; b=OmyMyYsxaNVhE307
 VKRUCTs+csDQ0SSOZ7TiMeH2g0q1DNmMWjWWeB3sflyPqHQMnkiWlCnryiouQAeZ
 HETpXNyIiIiHXCWumHNX3jPBZSfKk/9QNzz2xV9SloZBaZSXRtBsNZ/fl+rHtgJt
 UYe4Hx//SNXvC0T6ViYrLbsmlI2wwWzF01QeOSyWNBJ7+7glXjcyh6e9D+o0XjAE
 aG+956jmL1lBGp/XwH/O4VzSpNdJm0MiCBH+baLumtlKVO7KAQe9pLWX2MF6nrYO
 rSxPxxIIPQ+wnnTaR0AryxvUkLs8CQzBID06KSV30tbZ1cmHY/DBX9DugQ9re/iB
 E/f7tA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5e0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2eb9bb19so8009377b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131588; x=1756736388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ir1+DJRNcXJ/AcbzwsCokOtnTywkuEGXedxgqKP739U=;
 b=IKocaULxYiDHgcjbRwq+b+kW0cH23R60fNRe+d1HQ3uzijQe+XN6GuFyFIH6QIWBpr
 ZJ/OEjP6GOylzLXQAwB0u3rCvx8l7pfxJ8cPrl3Dq3+22CxNtCw8mhvCdMsfiNg0xbW7
 8AwaGCXn5iDmr64cjecoqKqZYORjKv+Tq4uOFCHUIXTKkRotzP9kQLzPKUSfW71JGtx7
 ua6k9m8o06CYw1ULSjk6KoYn/+6bLyJ9MEDvqo+h3T+eJrpNX4H+NuaoCpOSqD1BmfB2
 DKPhco4bxeVCWkMY6cGBW5bgoArNF81VRtjuzTWhmAIGsgk0fLY6hxMAeMtH+fdtx6BV
 t2iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHk9YGDImJSybdJnDloxvluibACI7yMcK+xTD4HziRrjyyCqW9TGWuimxGp18Eous0/ZSCArE3Pf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybsDhx3pCGBAytTq29767bGGYFE/U7P1K7KMm/re1E4yDcqWl4
 QwWQ9MnYpLCHcJS9066S60pBYE28TmSARLxXPtZyeFl0d6HQ0q/Yio4KynzbiQwrO4ICJRlkJTM
 21UqyqreKkkvN/Op9SKib387Q5hGC52eN5YbHSpLroLXHCoY05RwcthZCYa4/iAGA24TMRXU=
X-Gm-Gg: ASbGnctO4i2t+8XzCjb4O0IYSj52OC9CRshCyjWX/C7xQFZjmyx1NyjbyDokdlr+FfM
 YarbV53qLz3u8KZCavyx3O7El5+KlplWimHeKY8HMHoRDYmijF4ZP+wQeo8kQNYJa1jsYW7JQt2
 FIf80v1auYzll3g/a5JxDwhZrwQG3nz+NJn+6KsR3aIxgkqZjmsm5haiz6DGT7rj8XjuIQ2h/n9
 u+bpfdq52VIee5+VyAo70zAeG5RBN7RSGr+La1/ih1EENYeWIztDnwkFTQ+UWAFHg1vYV11vA9S
 1VpLzkT3bFuiM25umFF/TgWIMWvri3r3te3i7VoOWzNiAV/fTQJZgd8OIZe629ktqUvW9Oc=
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr4641827b3a.6.1756131587889; 
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYxL9Zri7v/saIwgivMP5c3D/nLe00nBqbIJBm10dVOoGEqQhvu2/5xZ+AWaA4jkPkIzp30w==
X-Received: by 2002:a05:6a00:13a6:b0:771:e4c6:10cc with SMTP id
 d2e1a72fcca58-771e4c6143bmr4641792b3a.6.1756131587467; 
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:47 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:24 +0800
Subject: [PATCH v3 38/38] drm/msm/dp: Add MST stream support for SA8775P DP
 controller 0 and 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-38-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131425; l=1377;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=EPPzpsOe3GMV6W9LzMO4nrdD0eyL/NlLhoDKFXKKq2Y=;
 b=2glrjFiAbHnVAab9xXUirWQWDuGwWCuaCdROVriPR5omW4VgCxP0xsBuM18ARg6ihHRK37Aek
 lpHHx5bpe0MDUSf1vG4PwfFZhJlTArs1xWVTxpTCadMkOIgUKiwlJDv
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXxTwBC4oSIIgT
 rcXtUbE64Z5rxCbDPLdM3lY/Vobcd5H/qMyQYyNhJq2C7EsyM2VlYEPneyva+jokxyP6xuIfa7A
 iRMGizTQTQbZ++DCtk2YfuyrHxUbO5pUJDPtaCb2qKcy8CUAR6F6am0bCYC1b7XxMvL+y7vrDN1
 gfFn8x7RQ9LGbqbJOug3YcEWzbD5nppKjWHVrRMQV399wdQ0bGCXgOwWFKPscOjrkzQSgD5tDdO
 0H/6ANZ1aKlTbIZopLg55W5yv9NYytxEXCyzAqqWhKWT77CVZxelfMXojIPnOOfnjbZeb94091T
 Mn6nJAicWGAv3PXthcOvSEOwZOfzMAM6o06qjG4OdQJbmRmGuEdSLEKnVxvPMkRHYg7a5UQ6gzA
 kT5cMz9E
X-Proofpoint-ORIG-GUID: i8KGLVFc3_o_vNJE_iNqfTWwqGe8US54
X-Proofpoint-GUID: i8KGLVFc3_o_vNJE_iNqfTWwqGe8US54
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac7104 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=cZ6T0uJ2ZX2uJOstinUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

This change enables SA8775P support for Multi-Stream Transport (MST),
allowing each controller to handle up to two or four DisplayPort streams.
As all necessary code for MST support was already implemented in the
previous series of patches.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 897ef653b3cea08904bb3595e8ac10fd7fcf811f..4a94f37513c21f9a273080b572a1e50a186a45ce 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -108,8 +108,10 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 4},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}

-- 
2.34.1

