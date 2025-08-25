Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D599DB34335
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE42010E4C7;
	Mon, 25 Aug 2025 14:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WE3VhV8x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD5710E4C1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P895xo031245
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=; b=WE3VhV8xruhxECoO
 l4c+2fW9Y/peDX9IcqV1KHaQj+t4oNPb51aj5bbwyJd6PbuvHXALDf1wxUkiz/rJ
 eP/lVlgTCIgEN27RhrYVjjKRzmVb58x7GE43TSozz5b8d9LoV7B4SAZvR7ywg/9O
 0+lIDqAa8z74feLeFaoteBNfPyak5HuNndGG/6CSfKsbgaTblCUcUHuPu6ACUkSj
 jYqdw0A4JlpXh4AhB/1MEKigivh0VVWpelxn209vop1DtWw6iLCmnysdGuDIBo/w
 VjRiVL3RfsA6Sfr8ApBYh7OASOkOtG+rWkE1TSTMH2t2enuk9CQPNEEdZ15mzc8E
 bd6FrQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2eb787f2so4614579b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131534; x=1756736334;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6wHYbSvg7X6j+hxKHpKI5Xd3HiTiQ5a6PIWmFXRLBo=;
 b=Hc8pIDMEQqf8Qd6BYfKJnTMLMuqkQ58YqwU9cK4SF2d7KLSAlGE68VqYLqeJXdHwvC
 Up3razO9kFsekAq+hvuQLzl2x3HamHMjTDBVlAvI2Lk8f0VE8uCY3MqaSq/n/1Vnnotg
 dhbdNcYUQkOjIU9Owg7BLC+FmSG9VArCfkaRNYI+9FMPEHB614ovX18sCkLvjwYsYN/o
 3AOeLc0t7y+9AUyUMz9XU+j+Rk/1t2yQ6ZpmTACaJeW8C83v/rRBj7rAlYC0pDSvuAwV
 Bodpzdx32z1LuglrerE610HhV7gtoerdA4rN/dQLuuve+MoeTnwbfQYjcNFezE//QokO
 IoSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfXCGCUUwLdD7ySjeF66iVVjpabutWLHVm/nOiZ973Et0PReuwzZAJz9wnAv4r2hVo2CqKUp4jN2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxd1OElYhEvtdLsvoTm924l8JO4bezg9BUw15RkJF5aomC+ETa
 KmC7wwA/yV0e1zRcLBT4y0K0fmSvPAaVSKP3tqOHjEQlhcy2dM6ReN1PdJT0seXTcOa98rBg8sH
 qjDOW7nVvYUUnqBNDHsflLwtDXN9Ey+VbYepFL7z22JDInNvwzYQlByiUBoXmxK/2ie03W+Q=
X-Gm-Gg: ASbGncsSYiUktJO7kZfIe1x2+pBXhIW1423lRBNqRUyBHK8yNYTZiRsDPA0KV1kPHbe
 /gBruvGWqr9L8NJkajRBRECmZXmwWE19j67EZke95yoyMpukOW+gVUNLUAReAKbE//GJD37Yp3N
 2XOp77yioSLrcM9SAja4nl9MW//63hKSfqQTZAYonYXsshqazoIzZGLwRb80GZQwqzSIcKUrNc9
 FYUt0Vt3b/ZklE3aGajtP2A8hJ74FMTDdUNXMTwwkzfk3c34fHMIIxZ2KVdfRbGVkmu//XOQPCP
 yU9hr73zDkrs9juT+a2nZ4kzpKARpX1ohp3PNF4NRE1wt9DRz3yeUHxZv01e/hNopCbzEwQ=
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id
 d2e1a72fcca58-7702f71282fmr15614239b3a.0.1756131533914; 
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOIe57ydGXa++MErfMnONFuNJjLar/gSG8BXw2uySW/CV1EwrBjfkSzqdOpuu88d/5cAafZg==
X-Received: by 2002:a05:6a00:391f:b0:76b:e936:607 with SMTP id
 d2e1a72fcca58-7702f71282fmr15614219b3a.0.1756131533415; 
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:11 +0800
Subject: [PATCH v3 25/38] drm/msm/dp: Mark the SST bridge disconnected when
 mst is active
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-25-01faacfcdedd@oss.qualcomm.com>
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
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=1007;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=qVUepIjusQu0oiyKhdBBjZ9rnYnedg/dO8rrWYD3he0=;
 b=Mm7SH2QVnkdWkXUKoBGe917JO2ug8TJ3B1CNvrWGxVgZ6cUb76kGHwuP9NdkG7IbSysBIbP6M
 lj+R8gKVMGzDFE9MsunfScMTtGGQAGp/JTS7OfT9zluAnBOGNoIRbGp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70ce cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXznH6YQSLttO8
 o1a7z1D/JjcItuCbe3TIF3gqhpjHcMHuddQMWr4Gr0sDP3gjZCuKyfXAiI6h3YbqHFsU1Kh88hx
 ZBbuHuaUmnLLR4H2jEum/cXemcgoY9TinQAR0X9KQfQNQbOxBUY1ngwsMYM8c02ru93BBCTUhOn
 lPBZsFEB1fQr+qAehsEoIarxLXM6pmbcRqCmR56UUR7FRFpMD5MufxPbtSNZ1q6AHGjVGJdhIy/
 WCshDAqJ65SbvctV/pDmc8KR8PE0y5t7wiAW+gUrRw/T7az06mjgzfTbXZFN00rz76GHFo19/Ff
 LuZCkAjLevpR9PvRFjh9nXTmKviyB7SSkcY1dkk/S2xAp8sy7zixVt0kafGCwihaQEJzT3yr0qu
 1Opf24Mi
X-Proofpoint-GUID: 3DWuN3KIq1UCmaf9UjtXGY5p45bNASh5
X-Proofpoint-ORIG-GUID: 3DWuN3KIq1UCmaf9UjtXGY5p45bNASh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. This patch skips
detection for the SST bridge when MST is active.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c..cb433103d439ac6b8089bdecf0ee6be35c914db1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -986,7 +986,7 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge, struct
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	if (!dp->link_ready)
+	if (!dp->link_ready || dp->mst_active)
 		return status;
 
 	msm_dp_aux_enable_xfers(priv->aux, true);

-- 
2.34.1

