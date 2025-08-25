Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B9B3430D
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A1710E4BE;
	Mon, 25 Aug 2025 14:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqX/wJcT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BAA10E4BE
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:52 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8gMNK021029
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KugB/lBYbS+s3dqphJMlpBFe1NsSwNAbfXTjg/sGCOw=; b=dqX/wJcTvCqmS5nP
 o+QVTrtm7+HK2sdR7nbCELCVcc3FagT/NKjiW60j0TqVPFrotFEnY9V2xmf2so1l
 fIvS5kAIln9HpDfYDYF6GjbaopMeuMXOH282eSJpumKgsVDVrSL4/bw4AaH+0gd7
 rrvVNRfNHMjm3nnW4207KEmFHVJI3vegiQhXSJi4WA49pjtSiJ267kHthlGcpYnO
 gJQKTcpvE14j2dIuRt26HGa13KsBXbBkbS72hJqHzr0SpU3IBA6LVbxGFUPcsAvK
 ISC6oiULJ1huFBlEr5MUcW+n23hzj+szm+C+gRuwZjk3C6CrbGmwT1Qz8KXgHKpK
 E4ASeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85b9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-771f1645e31so228263b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131471; x=1756736271;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KugB/lBYbS+s3dqphJMlpBFe1NsSwNAbfXTjg/sGCOw=;
 b=BSiW0pJRhbnCeX/dNdtQL9vcjT85iP9i/pqReZOiYyyVV6Bug3k4ECPpzsyrr0cfxb
 3XeQsrAOqmMmsy3DIfPR4P2321BrhpPLD00fjsNcz5GO/W/aU1c1vPiE3vQisCH41jY/
 KmyRp6AM6UfXGHOc4Me+gLx01lS5Fs7wjpnXdpjS6jf/HCERraCnwhC10UtIQuWCLiDj
 DkNi5HnAaKwA4QVYuwOyCsTmCbXSK8QsywnLJJ/P952jpfJd1yJvmiURrJ6l0ti36cK2
 u+J+P+dYO8jd0lDnNJJhFIaI+GdMljRzefgbenf3MX/fpQQcnZQa/tPLgfOcDMY9W/Xj
 dW7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURlhAyR6oeMbqVxXlR9gbBZ7/IcSYIAf59JialtdC3XTVBEsQWTDB5lo642PFwDxe2VDaSrNYKWe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT2wKdBzJWgonBt95aqsCP1Aa1ncBydgAo6K1eX3CYWvLvYIVh
 jaugsihgNtxo5h9Lx0ZJ/zf1YNg7bERTg6G9mwQUDUoEGnO5iTP4AC1hI95wmOsgzsAd8V0c8Um
 Nq3/ROf2vFCWn2pD7fWDLxn39SlF4fMLJfXw+f6NX1i1qn7u+ab5Con7c5hGikomx2/UUVFU=
X-Gm-Gg: ASbGncsREpFp0AIfCbiMieCknIaoez1kQlr18wwwZlFO/d+3rFNJyhsK44aTsDdky/N
 tb0NKzEqjltcmCBWCLo/aSWlqVBFb4s5xtar5J3r6mNjXMK2dzVyDYmkBU26OwSUmk2G9ObNkUZ
 qlbI1dR7+/Xj5YOkKVht+LnmA8mhCcxe9Fg0agOvoxhpYS8VjBahBaA9JwJFL9u0uXPtfksUb7V
 hJW5zm0N3GzLf76p8Ls5+4gczp2uBguY8kUUZZRRMv5ygpRiqwKQgopKGIahJdUVEFtoHpnqrAf
 iVbs8j47TY9isRTL+fcRy81Wk4C3J3jL7N7/ICVBa88bBquecf9ZjG72N9io61vdd5P3p3I=
X-Received: by 2002:a05:6a00:4088:b0:770:4753:b984 with SMTP id
 d2e1a72fcca58-7704753bbf6mr10686924b3a.16.1756131470600; 
 Mon, 25 Aug 2025 07:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESblHr8j5NFyLN5uWT6iFyICWQfQtyu/HKk7Hdm+TtQVYAYSZzGRYOzkrj7SkUFw6lTnEbEA==
X-Received: by 2002:a05:6a00:4088:b0:770:4753:b984 with SMTP id
 d2e1a72fcca58-7704753bbf6mr10686886b3a.16.1756131470070; 
 Mon, 25 Aug 2025 07:17:50 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:56 +0800
Subject: [PATCH v3 10/38] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-10-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=9466;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=L994Yy2QrMAOiXO+x2w/GZyZBMG20Sb7wl+50OQR9Vs=;
 b=lSDFMm6CWvGhNucrPveqSxz7GjSC/0X3EOcKyFyqCimdElz3VzVR1l1Nsbp96Qt9UPY4VDTan
 nTrqaPPpkfSD7J29Dx7BKLq2RNzW5+O/rHLyOegRYKYFhex/rnlXnQm
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: GUzsc4RRRUIxrnqRMOLtVGcUkwDvP3HF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXxlPcPQ8L0/bd
 O2UL9SMCtdf9fXVvdarfE7tHXoEIJrUAiWamrWdpvaftiQZqTiEmFpf1kQ61kIEtWnRF+4+ogZ5
 /TIzvOOy2ovxsxVVAj64KECQG38dXFtv7jR9Mcs6K4RnJvL5jmrK68RXtYZ8YNr9FKaV/IrZz+m
 DXm0CCgAf5vtyk+6+50F0KGSw4K/e749r+2MGAmhTiqXEplWeKfnRX4ctGv8glW8VywcAYmwFSe
 r7mJoQfxh2UkQ7DjA7zquBx/h4mx/ONlXQ/+/d2LxqwgIkYaPpBl7OD2MZ5m50mBbsWIUQ/bJbK
 +YHoZfGRTYFv6Xhtzzz2b/ilwc2xd+c1nSTGOaFE3+R7sqjia5ektfpQvT3wjMd9RG8Vw/mSHtQ
 BqTD8pc2
X-Proofpoint-GUID: GUzsc4RRRUIxrnqRMOLtVGcUkwDvP3HF
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac708f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iEZZ7kfMCVqEHj8YyOgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 49 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     | 12 ---------
 4 files changed, 67 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c5c502e51b94a6ac4b9a893b43eb88e87a0c0d46..8e95cfb98bd08088a707ffb5643a5021a288095f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -806,24 +806,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1441,11 +1438,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_state *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
@@ -1475,11 +1469,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_state *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1496,11 +1487,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	msm_dp_display->prepared = false;
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_state *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1520,12 +1508,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 }
 
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode)
+void msm_dp_display_mode_set(struct msm_dp *dp,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_panel *msm_dp_panel;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2fbf16f27842bb7639efaa2baecac7bdf8908432..e12496ac73f853a2bc120e68eeb84e5a2de6aabe 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -36,5 +36,14 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
+void msm_dp_display_mode_set(struct msm_dp *dp,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f935093c4df4681770ab487916584cc76834b0d0..b6b77ee96c30ca60e31cf76569e262a237493aeb 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -81,6 +81,53 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_mode_set(dp, mode, adjusted_mode);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -149,7 +196,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 0d026bc9becf777aee192b9200197f477012bf8f..1066bb181a50b462203647618db6386e72a8eb32 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -26,18 +26,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   bool yuv_supported);
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_state *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_state *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_state *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.34.1

