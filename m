Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E73B34311
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A771010E4C3;
	Mon, 25 Aug 2025 14:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8SqCiI7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3127310E4C3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8WfgX030918
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=; b=f8SqCiI7IGyNFm6R
 9lCq+wvmY6Hwj7QyViqHMp0qYMBU6Ll2k6LBaC0CUNKraIhForGHSwe5ktTcZ/Ia
 BAk5ELQRXw7oACjLzvoIUS5b6B5EJQztU1qFL7NgjGVYoYOCkE0cNrUEo5J1zO5/
 if3U+op3nC3W1NR7kFyU1SzM9lzetXsG7/C/bCGo9+gxm1JgXeEwfQlzcn4/wcP7
 DoHT97txjokqOOLeHhudq2oDZVRA1YzGIxXz8Ta1XqPGKzqYofbnh+bcc8nT6UNZ
 tqH0Cl93gPYCCa3bu+AYWx8c26GOy2eZrKYnUHqrNHr07Cvxmp6ZeumXP5rBCJ7G
 ZwqfmQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc57gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-771e1657d01so864627b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131475; x=1756736275;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehd6Z3j9F6UFJbL1ClLACpAxqFTJVB256eRXwzSO4q4=;
 b=uwcxCq1LSsjlF9kSIFe0vC+4DsVQzoDAqFSmIoDx/FNY0hbQwcQNzUTLjLa12EC+q3
 pGE0XNhY64WAvz+cHDyrEimxagSP6ouLLoAY5GwiAEJ1V9LYdTD5BY/Bbtpf9jNI35lH
 4I/5xM5FQFO/p21a/miXnUFvwscjFLmN8eQfBm4ManPqWzcXYBg4FlHAF0dIrTZNqdbK
 729xOo3d3Q//9RWYv89wsI0CIF1cDh26K7zjlzyf1wW5s3IDP+ikQ9alzuoPq9szhBo/
 Xcr0/2Sw5fwYoEauJVwwiNpeHveHIveMmfZvaA1HluBXJUr3NvDpzUXSpJIb+9QAfC7m
 jYZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBnTLa/NIrVGWWelCclwSvqUtBlkH2EdKnC6FKWx9ZLNSYYZK/KuxtmeGEW8E4eraXBeBisLNj+D4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbW41x7tXCP5Y911xleZNjQPFch40xUUYRXs1I9mTsbaV6f515
 b7zT61c0PQzYf4V7KED75Ib0BDz6APE8YG1q1gcblOymyht1YgRF+gU8XSa1BG6k/liw7Pe3X1T
 7Jz0nSozEoN741vk0XJRfuUBFo1wgcz9JROuYowV8dZMKB51NhrjakKGvEjbF4N1DkmiRLX4=
X-Gm-Gg: ASbGncsvGUmeEaGuecjNrk07e1oPn4MaiLLDKejTfz6zpN1Apn+rRPUmZbb3JXdlCfH
 6sNE8XJOs4KKlTkhQxVEmVOFXXqGUT3BpOqeME1oQhg/+jmAhYdyQJbRhc88EoooKEdmgUTecB0
 T5e6wLyty9OfDzQFFhqCTY4bcExiLi7KRBbxPDIxo3f6WgbWLDmsFAY+hSmprBbNCTqZ2Gj7k6v
 dgh2c55A7+ybQpORFIXYFOB0AujwK9hZnm/PJR1JVsU15/9CyinpcKAGGPxEnjpNaAE+kRy1rAA
 2xHeAhfnFbhsVDo4ovjPgzabYRUWQxMNDMd+S8KKt/rbMh3j+48khcOOzCA89Vanft2zZ98=
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id
 d2e1a72fcca58-771ebf1660cmr2234353b3a.22.1756131474837; 
 Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG09CpaFtCh665b+UlMocJfA8OyKjoGgQ9CL/OZNsmGoCPdzMYCFLICiDjOWQzYZdEyXdcfOQ==
X-Received: by 2002:a05:6a00:989:b0:771:ebf1:5e45 with SMTP id
 d2e1a72fcca58-771ebf1660cmr2234312b3a.22.1756131474287; 
 Mon, 25 Aug 2025 07:17:54 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:53 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:57 +0800
Subject: [PATCH v3 11/38] drm/msm/dp: separate dp_display_prepare() into
 its own API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-11-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=3193;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=JGxMLypPbWKxuAwuwREf9cwiYhjKSbC5pwhS5CeKWxI=;
 b=RznuqTe8L3ZHOURGRmWpwGF4mnaHM1muZz9YRCIleoH0fWDqRblDuLOyyUxyD4TKnrGV1lEjN
 MPHaoI4QpkuDxuQkmdMZuprEovAdbWskxdLf/oo8w9MxRVeU4KmJVxA
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX2sbX8j9hQhqm
 UZJ8CbjLyhxkx4G7pP7C6h4qFW6q62ZAF+tRPFHwh6qQfmZMK8z3vl3SQABm/Kr6mVrlWYuLoSY
 U6t35jCfaF7BZRbHQZ9nPWTEO4O6Mnc0FDac6t+TKQF7AwLXS6umXqNnswTHQLpxaXeyLQqDtJr
 9+DZJMi4WUT4oKwcrheh+x+QW383kZUp/PPfZObC3TRWmn4BjjapHh+UC06ick2YoD2xiFEeTGK
 s+pKABZA2k4EENnjSzZWWMxVxA/GRibm3viWximXQF8m58KJGbDbV1ezmWIAW+N8ZC7godeAoVJ
 Eu6LFgVTbbG49gXp5JACFNXRfuLHLD9lsAeWBNMQJMdnhYpDW/3oBt2Hvxk450pIkg4vqAo3w8S
 gIYplZNO
X-Proofpoint-ORIG-GUID: H4bJkHm03z1h_7zthOU-ZruG0JyoY_4I
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac7094 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=rHTcTV9uYuKpyGuOXCsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H4bJkHm03z1h_7zthOU-ZruG0JyoY_4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032
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

dp_display_prepare() only prepares the link in case its not
already ready before dp_display_enable(). Hence separate it into
its own API.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 16 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8e95cfb98bd08088a707ffb5643a5021a288095f..78d932bceb581ee54116926506b1025bd159108f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1438,7 +1438,7 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
 {
 	int rc = 0;
 	struct msm_dp_display_private *dp;
@@ -1449,10 +1449,18 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 		msm_dp_hpd_plug_handle(dp, 0);
 
 	rc = msm_dp_display_prepare(dp);
-	if (rc) {
+	if (rc)
 		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		return;
-	}
+
+	return;
+}
+
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
+{
+	struct msm_dp_display_private *dp;
+	int rc = 0;
+
+	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->prepared) {
 		rc = msm_dp_display_enable(dp);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index e12496ac73f853a2bc120e68eeb84e5a2de6aabe..37c6e87db90ce951274cdae61f26d76dc9ef3840 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -38,6 +38,7 @@ void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
 void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
 void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_prepare(struct msm_dp *dp_display);
 void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
 void msm_dp_display_mode_set(struct msm_dp *dp,
 			     const struct drm_display_mode *mode,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index b6b77ee96c30ca60e31cf76569e262a237493aeb..b0dba97e120566f7376e047b319a60c5bc36ba4e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -87,6 +87,7 @@ static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->msm_dp_display;
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 
@@ -196,6 +197,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
+	msm_dp_display_atomic_prepare(dp);
 	msm_dp_display_atomic_enable(dp);
 }
 

-- 
2.34.1

