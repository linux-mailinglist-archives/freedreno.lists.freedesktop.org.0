Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C34B1F185
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7110E99C;
	Sat,  9 Aug 2025 00:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+SL+fuf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357C410E999
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578NExXb022010
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=; b=E+SL+fufl61vfuki
 fbXAWnPJNTGbn1TtP32D96aGYWG66TAvIz1ls1heHdVLJhJ6l1leMvSqBGe7l/2u
 +ANgQoqNvvFNAsy0Pm3lHdb1UBsy4Sf8h+R24sF5VbNtQDlw67ZGZdu1QmidD3br
 vjWQ0N+H61kkPE3tThVmZ21ddln1VstzvLQaExVJJOMup4G3nNywTVOiNL8Uq2tP
 bx3R91/G4Z6/9474W9SLawl5Hvyw0WSeN/OdQh01jJUTJLb0NbKZ8Kkj7ZCBroa1
 MWVjTlBzNLeU5a/UW71dGOw6Ib/RR0lozSXh2m4Xg286s2pWr4qx/Lwkr5LOPpuh
 5DGmKA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybkm68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b42a11d7427so1141310a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699744; x=1755304544;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1hdCfTP1N1Lll13RFi4QL7o8c/WBGzlCEwL+AMYyzJM=;
 b=dMggIr52hq9ebNLTCc05AprWUB3sZksZucA4O/HGxS6lRx6bIxRtakQdIcAJritoYD
 rTKfUdhgFBT8VwIZO2CQ7k00x8Tw3Yt93dC2hHoU+r2/Tknc+bdNmaU1V/Q1+AqGJX2t
 X7TWfZI3iDntzysmfDKXlUqoal93VCnLoTjA6fiBt7kvVfyURg2slrvSuPcu1JNb8xAC
 haxRwznuZKyiWbJyh7ffmlwEctizEdnGD/PNmNdIGw2mOL8qHiaCUXeGd0js2MQF6uCB
 4pdn3P+pJC3PFKpALj5U0QanZ5PzdQa0LKBcOnIx3ub0Bl8H92d8/bb1q8btzaKvIzCy
 lrng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDRnYVqlUwbgN/G1d4SmonarKQbY/805FMMn6ueBR5lAWjX2g5cagzGOMpaMtBz05ZnJukD0uP+58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywj5HXjr26jOPbtIXjgF9Z+tP6J5h6bdsm3uBM5D7eO5hGy8GXv
 t3cMJb9m+AQTZSjAnkrMbVTJdY/r5V2ofIM475r5W2uFOyyvRSL36KVh708kjsLflCTXqnb/NqL
 I+sPE1x1bzNFo8ej92zNzF5wFWLr+S1P0ZsSwbkxFD8hzUmsW7sqtbjKqy76LcMxySc+JzPI=
X-Gm-Gg: ASbGncsdpX3dyIOZGBTVlH72YmEJ7N0ZQiVqXx4rnbRvUj++mgcqA64khVSTh4f9BLi
 A0HNn582NrnoJmazwTeHJK8NfEA8hjlmL1/sDFoZXpPpWemyA0kRjvLzoVBiT6Qc/QGHm1IYf72
 p+XN8uayGEvnNoN70WBTpeXCyTsz/cfZvzbwYDTWO/FwTT33JeJSG0kJTAEnZuLoQHj6uyjULVZ
 mMEZr0j+02TcMh35PobbA33ZEepdtvbYjjPaAnnscrJ+w4KAZeKpI5RYIgFvt3miuVc5G6tk+Gw
 jz5PJ0cJGJv1rPWdFLwYcgbFVPbiOaMa8W2Ebg+jk1n90Q4Ge74mpqLe6i2bZUgRYRy0UnwVILX
 VReap/5bqDRjJfAIqal4xq+59
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id
 d9443c01a7336-242c2271e8dmr79853065ad.48.1754699744040; 
 Fri, 08 Aug 2025 17:35:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiff/ThYc6UuyZtbEXTBnN49IuMPgSQgl9gfWHA+0K+TeLvuc4b9uNZ9TWhJt8aKuTgT0LiQ==
X-Received: by 2002:a17:903:1c9:b0:240:e9d:6c54 with SMTP id
 d9443c01a7336-242c2271e8dmr79852665ad.48.1754699743574; 
 Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:18 -0700
Subject: [PATCH v2 06/12] drm/msm/dp: Use drm_bridge_hpd_notify()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2470;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=29HYP/DXnl5EwK/8eh4LDOHT+urC513pYg2fM9mWL2U=;
 b=hUDrHjRGa0KSwFA/brYTaqQ3aB1uEyojqFJUPg/WEOdZZ0zMPAQBmtvg12Q6ggaRIFRwqN2hA
 NgI6QAvH7kCA9iTY0rUfx519/9SnrO0gy/ydRL5EGu4CCUm7Fs+e6Ka
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXz84wCij485zP
 +8xEnCvyDOZC9ReHZtKJCIVvID7sThQvh9etoFKgodJFxmDDTec4yNsx9kxQar/dfDCIWoD5ST9
 EucuZv4DwASXp5B+YriT3hKH0sC+JGiWGpHNSoydMQdV9IVv1vBCj0heKFWfZYCxZVxG3Wjxr2k
 xwj/D42kAdINxQ9ZnN9s9HVv9Th0qLs+99fzDwPRoGwxzKGequRL95sSA/om2PqJc6AYvPEi/PA
 b1qzCNlfE3TkpO7R80mfhq/GlUqAYN7JJUbD5SZMFtFBSBRifWsa0kfxgAagMp2QG7eHOSKXMSz
 9e3evqXLdXCGXCCZnftQi31PE2n/fWuA5RZ7d4KB8Mn7w+v4iWLIYxnWlsFAwGFW0hbHXX1oMDr
 GeTgDFY6
X-Proofpoint-GUID: -hQcK-3lbHSBp3hhpNSAJUetYZedJFHv
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=689697e1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=vUZxlgmVQAOzQBO0PGoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -hQcK-3lbHSBp3hhpNSAJUetYZedJFHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
way, we can directly call hpd_notify() via the bridge connector.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 55fe8c95657e..8779bcd1b27c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -333,17 +333,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
 	.unbind = msm_dp_display_unbind,
 };
 
-static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
-{
-	struct msm_dp_display_private *dp;
-	struct drm_connector *connector;
-
-	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
-
-	connector = dp->msm_dp_display.connector;
-	drm_helper_hpd_irq_event(connector->dev);
-}
-
 static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
 					    bool hpd)
 {
@@ -367,7 +356,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 
 	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
 			dp->msm_dp_display.connector_type, hpd);
-	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
+
+	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
+			      hpd ?
+			      connector_status_connected :
+			      connector_status_disconnected);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index cc6e2cab36e9..60094061c102 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -16,6 +16,7 @@ struct msm_dp {
 	struct platform_device *pdev;
 	struct drm_connector *connector;
 	struct drm_bridge *next_bridge;
+	struct drm_bridge *bridge;
 	bool link_ready;
 	bool audio_enabled;
 	bool power_on;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index e4622c85fb66..f935093c4df4 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		}
 	}
 
+	msm_dp_display->bridge = bridge;
+
 	return 0;
 }
 

-- 
2.50.1

