Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA8B34300
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED5C10E4B5;
	Mon, 25 Aug 2025 14:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPYWMbJ9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B91910E4B5
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8S7Bx004306
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dhu2pyL0X/ioZ8T2TjoRhnhCcvCEY46TDbOm5EiNtvY=; b=nPYWMbJ997wyma8i
 R/b2CwTMPStWo9zsBpAwPU2z2BnpqbqKvsPk3rvULtT37RCicGvVWg012I/Jnw0r
 M5YcPWMYwT29GIf4Fr9GdTYsZBAeVRSSJwcppyQ9bdvjMsBwEpE5cB+XsNM+IP5G
 6GO2qsB0o6xJDvsqUQdkeBfFSK/LPR2LC47ww3O779qYJMYQJKCMaCWqKFyguG61
 lAqGnUHRNRGFvEfs3KFxam2/0mpsreiaXq8jZnGsQKlYifHX5ee7oFw5Vgp3ntmL
 iIAsLCI7RNhLSG4ShEiYtCbAwbnTCaVxCALB6K1wwwv7GsChB0M5ylGMg5AU+jUU
 1HT18A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw83h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-770d7a5f812so1001600b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131446; x=1756736246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dhu2pyL0X/ioZ8T2TjoRhnhCcvCEY46TDbOm5EiNtvY=;
 b=sOSMh6dYezwwz2gUuUqHHVwt1QmyXDLWPL9Vb07ZEQf5kFNLnmnY8KpPl/6c3DX9mu
 Eaf36/HgytWHJCA0bkXFuVyaRsw6zx5bhO8Pz+yBUBQss9u1AmiyNP9/HhubrKQkjnOv
 NPIk9fr9dVcghunWNgt3xHANgBadYKIbZjgU5nv0mVYobntUfoOIR1rOIH+wKMN8V0Fs
 4Q4YpobM9KCiOindPceoD8W0Nvo6WGWVHIouGsJUMELgaBxU5g6qicm8TrwVysbvBd9V
 ti11SPKWks7/E1VMDrb//lZ8KgNfLnz58agLLMNYw8d2yuhkpQrgB4iosz0/A6rGQpEG
 rdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk0U2FjN4mvcP6G1bKcTxvN3dHKd87TwFV8yWB6Rbw92eFIll4s3Twc0jd+EEjCZdfsXfqUIgrkkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrhzIreNM21ufi6OkGCnmljM+4qJpsgaGUWBUUuFiR+D8lHpTw
 URTkcSESzWo9WuFW2Xllu3/hggqYlXygI6edwfklg+1kvArtHBEQhfulPvyJ7vxUIVTg4zbJo4u
 JdtrRDKnulrIbb10sOY3nvGFBkDo2M6wmbufg9OLtmS9pTh+BSfuSrRlESkhy2cYy1iHxGoM=
X-Gm-Gg: ASbGncsp/65wlsgRSYIpvnqlZG0TUlLezuacVYg5ZhgHp56qTiIoRRyRBcww5oBPmId
 7TLdlHD3hwKhq+qd614o4Phluuxju10qO7njy1oyPOkjionBg3QvbGdMnAeIU2xpuCQQgTEl78k
 1bsTbY9EWOXAVANnl8Sj+NVIjYFO7kjHAMrrVkYG48ern11+Z7eRL4Np6Mwf/bjpPyEyFZx59pz
 RrHdWMcUh1EtM1bG/MKBO9K25MKRyyYtZNIzcI8ugih7kIMylqGhtwL6EJ8pGsqsBfk0J5Enim2
 cDkrHLG5OoHl6Bp1p2Wjov3RUF8hZw0huONG84W37tEb8g8KdIm1AFEeVlZ/G+CrRlMSnFk=
X-Received: by 2002:a05:6a00:10ce:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-7702f9eb582mr15836883b3a.9.1756131446041; 
 Mon, 25 Aug 2025 07:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSA32/pz4JTFpftaw70l3JtTNu6V/0FjNUIWgG3oAVz7MrPT54k1XuSVABqVGbBbpJMYM7RQ==
X-Received: by 2002:a05:6a00:10ce:b0:736:3979:369e with SMTP id
 d2e1a72fcca58-7702f9eb582mr15836850b3a.9.1756131445564; 
 Mon, 25 Aug 2025 07:17:25 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:25 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:50 +0800
Subject: [PATCH v3 04/38] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-4-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=3995;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=pcLIA/1j0xUF/hVxpkEvzGCgW0UBBqYXiTe4Lh/Hipo=;
 b=RuBdo6IucYKeLkvTVUy4/Z7tKcVlYbRA14ZBgdHUD8reN+XgzMpe10OYsuQuUGhf5UIA1PhV1
 l3LcV5otO3yDHgzX1Ov3aEX1mbeLLcesc/WV0e98Pky5MD4gVrrI9e/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: VN6SeCF_90UmIapldHxVX2kH3V4OvKQI
X-Proofpoint-ORIG-GUID: VN6SeCF_90UmIapldHxVX2kH3V4OvKQI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX61St0we7vkbP
 f/e97sUIaPfFUUBx0n0L46VxNNu60yi2i6ZleaK3Z+xDJoT8uYXRVHQO7A4Ov10dSFHaFqR6nOZ
 jcZhYOxui3g5RB2nZpolGxkD5AB6MXcP+ba84C3kFvf5eQ7bB4kTKGpcKpgK5ycA54V6U5JE3EY
 12ATS5KcJYlMQWwBQG9c4XOgsn6uYidcJAEJCLJ/SjbE4Sw/zDjLzFCsNGYmuJMhHeVu8kFs7HH
 J/+BrcpFRuyI+n2umyhxzq6+wVHrcAk960cgJjG9P8OZv/YanwSYLZpg3AzsOpnB8dCXYvPpbBk
 x6jo+VAGQkCZ7sGJRNUMrF3gx07y78ZeAbTPGHt2KICTeOf9TPRuvdBfRcew029L+2ih9wcwyvg
 2wgQAiD3
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac7077 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zjUDaY1vqB1ZZ-tktEwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

dp_display_disable() handles special case of when monitor is
disconnected from the dongle while the dongle stays connected
thereby needing a separate function dp_ctrl_off_link_stream()
for this. However with a slight rework this can still be handled
by keeping common paths same for regular and special case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 +------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 6bfd8faa1e212c3a25964677a4462e7a3a162fa4..e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2549,7 +2549,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	struct phy *phy;
@@ -2557,23 +2557,6 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
-
-	/* set dongle to D3 (power off) mode */
-	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
-
-	msm_dp_ctrl_mainlink_disable(ctrl);
-
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
-	dev_pm_opp_set_rate(ctrl->dev, 0);
-	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
-
-	phy_power_off(phy);
-
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
 	phy_init(phy);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 1497f1a8fc2f00991356663c19c87eb9fad48a73..93747c0a9b3f049bc877f347f05d42b66ad0dddf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -19,7 +19,6 @@ struct phy;
 int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
-void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -46,4 +45,6 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 36a12150925246b168acbabf77d1206a1ef8eff5..4c74eb2915fd620868f658ccafc32030b1c208c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -773,12 +773,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on)
 		return 0;
 
+	msm_dp_panel_disable_vsc_sdp(dp->panel);
+
+	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
 		/*
 		 * irq_hpd with sink_count = 0
 		 * hdmi unplugged out of dongle
 		 */
-		msm_dp_ctrl_off_link_stream(dp->ctrl);
+
+		/* set dongle to D3 (power off) mode */
+		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+		msm_dp_ctrl_off(dp->ctrl);
+		/* re-init the PHY so that we can listen to Dongle disconnect */
+		msm_dp_ctrl_reinit_phy(dp->ctrl);
 	} else {
 		/*
 		 * unplugged interrupt

-- 
2.34.1

