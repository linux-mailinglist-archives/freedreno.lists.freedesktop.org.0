Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D9D22D29
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 08:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE18C10E6C2;
	Thu, 15 Jan 2026 07:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WVvtuNe7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbn77O5q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404C110E6CD
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g2ds783439
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=; b=WVvtuNe7E9bu2Dua
 2UmXq88zKk3Hzw2jC0iWHbfF4zvt3AEk8uG1gRf/k/7at2NKJTY1MJr+byr7INNk
 JRwNliwjmEc3ta0wUqWoeb/JzBH2R+pIj1Xz30R8CM1Of2zkiF6dZ+YmdEgovxrt
 afOal9dTBe6XibUOLT3mLtizeSSOX8AvGAhptWsb00K1/uA+oDL3sKXpfX4l//vy
 HZ5LIFJ1i8iNx8ArUrcD1ODIMAw0ulEt3Ewsq1AXkupiFOvP/RdpFYAfrzQmeBiq
 FasxJTauqOJzRG7o1isU4PIU34cRoKNhZZoBVI8bcUpUgO0X2xvzDBxvZYWWcybq
 F6PGGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5k01k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b9fa6f808cso183513085a.1
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462169; x=1769066969;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=;
 b=cbn77O5qv/RdhFif/a0MCsSKZsGWuG9kZkM8o1AJsBS5ol/XpSuQOFpflJnqf5KlZb
 BR/vg8uKueVOYvjGSkVnCu1Qb4w/HCxURHnMlpq1ULGNGK+9NIQ2MNKc5qmNmGXbquRA
 +Z6dKvyfasjlLc2VWBWWpyaIpMyAUkYW9A2VOXyNE2Fu0MIxsrsQXZtGWrqN9zdHVDC/
 0hoFSlGgIaNSRw7ROyHSiF9/gpsY17g8qBJjtw/OR6VHQsYENnV0k7RY+G/lXEP5Pl5j
 ZsU0kBdfEic8PUqL1Ey4G8abWAvGUG8QiWATefHFtATcxknD8TaxU6rdRCyuAMwAYZPs
 xEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462169; x=1769066969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nYMdlqKEaCVNYnY2T+ZZKkA05y51oThEIgGnkyPnO68=;
 b=xKZYj60gJpD4r2pUHkyouoXJi4P2vLzPZnl9iYCs8NnUFsRdIuqwShmaamG2kLssk5
 k1tPJVyzn9k8J5brG/pS0pCYRPr84GRmEWCX4lF00zxfxT98ZSWFLKZCG3uktJ0z4SIf
 xyHBx48dTz+LcL9kSOWUCtXxJOtgPzGFPCF19bpdt1E7yGf/ZC9jaB/TC1Z+6pLEty5D
 3X/hu16T076sUqo3jaD9uQwjEVb+8QmFHZWGWWV4/zKPl78raiJq+vD2qkNp/4wYnwCt
 T+kwtCwfYue60U6eB1Vt71PCPyrUhE+EjoHKrSovG1YDwyNemCSpUQcFCvdDNVCkMEcn
 EC0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcLLFyDB4vC97i95pwD0OXbsEMeGX88qX8Sk6Aj9RXzjGvGf92oFeu2SYn8SCuH5hWXG5CAYfzHtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd1JF08t5RaM9G23WPLTJy1bYvlm1Yq1ag6Qbk04UhqnXz/x+Q
 tcCVFgWYIq+YVj6jtEX/t/IpEa1FNGNSrIWc7elwjFlvtP7bn5bxLU6gWoH/fBS4HamwZTQe8cm
 ivX2dLeENiwTfegoST9p2G3YR/oeujyRLdaViv+nPg1vJGQv0Mw3wwIVuHbyYhQc4l0i/BOY=
X-Gm-Gg: AY/fxX6XJL/B2CaGiK5ifQNLJtUysDL9s4gzPeoLfUrfo57dx/qHm0iaw6NyGao6b9q
 0QQEY3NUp0029+/csqaowVFrYOfPzHimWg4BbcASCEKZbW3RFoXXTnPw/UqleIbM4ulz35YN1rh
 w9lcDaefl68xfiH4BXBjEm904CJ7uSzEZrj/6XUEdx+UVZWzKmzWeJDzBIYZyO5x0PCUIX0QGRt
 B6o3gFV9EQ5cnc/Jgj3gU1qo3zSKIGWEyDu+CvVGO3eo2+7SoQ4wJn6sx5sSqfzjMlCCsF68iEZ
 aaEsbsO3m68cVe7r0+n9rEAw3alh04Qe6nF/8AB/kcUTwGnqYoa+RgyWukm4OmJshk3NCOTQCNr
 rLnOITQV/+xQ9T3EamNKUkqIvGwYj9/ulc44toMl0E/EQ4e5q790cC1Zso09q/VUR3tMQr23TEv
 eHCsTIf3TtD1+rRgo9FVerhFQ=
X-Received: by 2002:a05:620a:31a5:b0:8c5:2dbc:6253 with SMTP id
 af79cd13be357-8c52fbcf036mr732592185a.51.1768462168628; 
 Wed, 14 Jan 2026 23:29:28 -0800 (PST)
X-Received: by 2002:a05:620a:31a5:b0:8c5:2dbc:6253 with SMTP id
 af79cd13be357-8c52fbcf036mr732589285a.51.1768462168135; 
 Wed, 14 Jan 2026 23:29:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:13 +0200
Subject: [PATCH v3 8/8] drm/msm/dp: Add sink_count and link_ready to debug logs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-8-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3587;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PIbs1V6oCZycCnfF0WvcY9fGYHmsP42h2zaX22R58XU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bGdBfnZfdy3t5IMN7ieH3Zmimnw86Wy8m572HQToph+
 GKYK/K3k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATuXqbg6H/jE6Q9Xw1Ca5l
 wvdc/W14n8Re8vjl/Ux2rkPWuklnFHu+32tNil6u75rqrLBWcME69aP/PlheC4z12Paost7x4qe
 eauXQ99GzZ3afOzXBTOnJCZV12kK+rs135BWerJC5ZqLg7ZI9s+ZL1sekl4UMERv3SabxnlbYP0
 NhTezx262Sfr7MOXfr3ojPfzqF/Uxd9HEG4Rxdrf7l3sLPXjUsd92w2XPjUh77DsO2N4FFG8uln
 IN6AmS2sYh9DHSq6O6IMzlsHaJQsW13zFZV7q7O/52Gr44WHbUv9fa8q3U0yeZ94JpdBxIFznBv
 nlMuceO17vvoCPcXL7kuRxtPmLjTt8oyZ+GKnCefzERdAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX0vZ4I9MVKUNK
 MQTh+9w5cCyqt2vSCv2XcGyxGuSz9mVGCOjTok87e+inTkRr1lJNP0LTMWQQ7fylTb5uNyyge/G
 jwhona71xGkh970Hi+8CQwayDN6UAwA34447tu24PZGEZ8Ctpr1eVmDB6L5LjuOeUWwvSLQVqSC
 W6v4/4UWFRLO36cfPUDiAS7at/Ui4Vz3ovFcds0DlJNCQQFSNUm28tjWqNYh4KeleUjigwlcmBC
 VyjkJpO+yJQxWNc1JbW/X+qEQPPL/DYoI3mqV8PZX8jsHUaledJU7LvnNWKARIWn0JyagU2rkfK
 3gHUGLdZJ2qZi0QytzmHvAMYy5Pnnv/VCDWn+mVoXiRlHPPFKiP34MeIukjtzJg6bh3XYqbMzhh
 ihNB9q7ZSVcalLL7tI3Hifmve7bm9fUEwBnqSzNtieEYJT/ZKhjkGmgoNrxmV+kmdML+Ax1objz
 OywoQsE2m/FV+6+Mm0g==
X-Proofpoint-ORIG-GUID: g1w1p1q2H0kuk1Di0wWHjjiA2NhlrOdW
X-Proofpoint-GUID: g1w1p1q2H0kuk1Di0wWHjjiA2NhlrOdW
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69689759 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D6o9UKO1UCu5gje6phcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Add sink count and link_ready to the debug logs for [un]plug and HPD IRQ
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b26fba89e73a..67a193f58ce2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -388,8 +388,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 	int ret;
 	struct platform_device *pdev = dp->msm_dp_display.pdev;
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (dp->msm_dp_display.link_ready)
 		return 0;
@@ -411,8 +413,10 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 		pm_runtime_put_sync(&pdev->dev);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete connection part */
 	return 0;
@@ -440,8 +444,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 
 	msm_dp_aux_enable_xfers(dp->aux, false);
 
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	if (!dp->msm_dp_display.link_ready)
 		return 0;
@@ -465,8 +471,10 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp)
 	/* signal the disconnect event early to ensure proper teardown */
 	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* uevent will complete disconnection part */
 	pm_runtime_put_sync(&pdev->dev);
@@ -479,8 +487,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 	int rc = 0;
 
 	/* irq_hpd can happen at either connected or disconnected state */
-	drm_dbg_dp(dp->drm_dev, "Before, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "Before, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -493,8 +503,10 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
 			rc = msm_dp_display_handle_irq_hpd(dp);
 	}
 
-	drm_dbg_dp(dp->drm_dev, "After, type=%d\n",
-			dp->msm_dp_display.connector_type);
+	drm_dbg_dp(dp->drm_dev, "After, type=%d, sink_count=%d, link_ready=%d\n",
+			dp->msm_dp_display.connector_type,
+			dp->link->sink_count,
+			dp->msm_dp_display.link_ready);
 
 	return rc;
 }

-- 
2.47.3

