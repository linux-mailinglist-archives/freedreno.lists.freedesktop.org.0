Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C4B3433F
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E7210E4C1;
	Mon, 25 Aug 2025 14:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe2zFT1F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E13B10E4C1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8KJs8004580
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=; b=pe2zFT1FxGnv316U
 x/vKPLvcGuINyo3poA+wFMjeutaALnAlPilwcpB6vgFS1lPIGlquxi/k/GJ1uXiK
 LSp1Uhnp5dMRKjH6DkmmL3xHaVHSIGMK5YryFB+AfC6+A/qtpGF20xqaG56FaU8+
 TmQAYov2Lu46rQBe3zC4lqAglAZx1+Y686du93YO20Z4umjuVXUcDfZ4bwufjFt7
 wG9R6Ufqki8kR4eKDqI9W3y6iOqZK8N0IgSS+FVSvxdCd2tLAGh3N/sHo3z/2rGc
 UZsbEyLchC0X1I39+HOp7Ac77zEAeR9xhxDLUIR9FwcNmsA1sUa9Fb6yX4KPlEuG
 uSz+Wg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um5ek2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-771e1451631so1956499b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131550; x=1756736350;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmocC4ftyVaWVSgyoHNfTRGjizwe6D9zwARFQ5cI7Ho=;
 b=KISdLC0cPaLFWD+lzNHQHmPA6nzP6R/psc+waEAt7qXg7aUkukRb+IHTt6bbiDG27t
 8lL5r7mIs5FlbP7UXb5Jnp/WlOBIOQh4pXLz3t7zJ8ivg0Hs4SAaVz/efNHJWTsORoPG
 6kejZliIDuop88XbDqgYMaCFq5NZQEv+KzNlJZj0KoL8JrpYPeWNjXbSHE5fv0IN5NII
 c7SreTEIgdfvQYM34lGemMfFfsYR9mogdN/jYl+ZKaVIs1uplKcBbKA0eV1dM7D+swxp
 mPkSbNukvaERqulrPw+0NI9gD1wO8IGuDeg6uW5TIjb0tb3vDgzr7/dlkjtk6IPYO2rp
 SG+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBXDYuiAB4fUnA8PWZ8oh0WfyUsK/Mi/yZE3k+37u1TtdSc22JnfSTiEDTLTU63lezNINxW9ds7hA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNXDyUF5AGK6gn62N6sfArn5Apt8BLwbNTXyvUpgO9gvblCr/j
 cLhBb+lutYKmSVoEJZUTzK4+qRzTlICY/1S+9Qd9ezGUFFa+xCFdDhMdrRz3gkpqGo4nu5rzhlD
 xd3QctZFad/iFS7SPo2BujKVaWKaTJeYF/GA43irjhIiWo61CI2pqh0lbubxDjeI8jpb546M=
X-Gm-Gg: ASbGncsaStNFvhVPn1H8scazTSDRYJzPCSN9TxK6bFLK/D6hfNrJTPmyVuUMmPFn1CV
 WFM0olHhQ58V3mZuAnC8JILCiMbapIXENI1MMFNnrAHGKAi9K+0Ps3hCaIvByn0mm/r+ahBWRwP
 iNHdUr1ZKtqOtgTDDtaL3aV1Feh9wv0OXIV2CjHunu3MkF45YhYXqft3oPGtNY6Sd5lI+ikviS+
 rhGbEFdkiZuDzlf4iBEVibSv2mF2G31KC4DlNtdM247+LFc4lgEHG12jpHz/7mcxbNAkg55Cu0X
 9iNMYlBHU44f2uwEfaoQWDH9edzDgcpj9JtWdMqspqhihdXLmyZfoR5hSX2pe/yJ5CTzlkE=
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-771e8fdaaa5mr2803034b3a.23.1756131550519; 
 Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcDnzJ5RfYiEwv9A01WhZOmceWuXE7FYxb4e0UXQzViegEhpR06sENZJcy5WADZk5aDdU7VA==
X-Received: by 2002:a05:6a00:a17:b0:771:e8fd:a82a with SMTP id
 d2e1a72fcca58-771e8fdaaa5mr2802997b3a.23.1756131550028; 
 Mon, 25 Aug 2025 07:19:10 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:15 +0800
Subject: [PATCH v3 29/38] drm/msm/dp: add MST atomic check to
 msm_atomic_check()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-29-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=1376;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=8m/NmAVanmnv53nLnyrBMfNFZLTXWJekt8jy/qfdBFg=;
 b=u8gitSXMth4muAJp3+xoeK5RxUPyF1SywZCDE5hkinXcdd5++I3Vd2b6CfisCybuJNCaw3Sx+
 YU79iwt3eRbC9x0AI8+HP5lq7cTUavE7xpEFgbcoDFnLiqoiDewyvDz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ac70df cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=V2CHa5tHbzOdfKvFleIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX8vYZiygaCTE+
 C2AgBcsefbdsuYtR7LY5wYE95smJL2T5Ad7Nty7BZJgQADoW5hqiJ4nNZlVxxSYkGsUDewkqVuH
 Ea/78nv9gYRGtD95vJGfBYSqeCtoehpR2leEWLnCJD81TjuC8iAzQ7rS/UbsxqWIWWYULgINeS0
 mTtVrdIkT04Yx1wXMcgE0tuJmBWaVF93vw7x1Nt+t88gQfr3moEH7PcE1/YvLi9KSXAoz0++t6L
 N7tGs6UmcCOHRknSPXuTT1VchdpsM6JRTluMLgxdeTC9f0K0ovMt2t/OQC5CJx9dhgkZs2pbL/3
 b2p9fR2lTLNBlAB2wDbgVPOnOjZNEMDdITYwTAawu/Sm1hFCMrW+n6EMx8Mawwo4vnEgY+6xqJC
 7LapwFPg
X-Proofpoint-GUID: fh6dvlLhrZVkMRe6rQwvyQDedsSCSwgh
X-Proofpoint-ORIG-GUID: fh6dvlLhrZVkMRe6rQwvyQDedsSCSwgh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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

Add a call to drm_dp_mst_atomic_check() within msm_atomic_check() to ensure
proper validation of atomic state changes related to DisplayPort
Multi-Stream Transport (MST).

This complements the existing drm_atomic_helper_check() and allows the MST
framework to perform its own consistency checks during atomic updates,
such as validating connector states and topology changes.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 87a91148a731dc911f30695add4c8f5002770220..3aa0020dec3a90b693ad3d4171cfcffc091aad4c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
+#include <drm/display/drm_dp_mst_helper.h>
 
 #include "msm_atomic_trace.h"
 #include "msm_drv.h"
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_state *state)

-- 
2.34.1

