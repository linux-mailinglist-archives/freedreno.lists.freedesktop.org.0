Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA4B342F8
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC8210E4B0;
	Mon, 25 Aug 2025 14:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKCBr9Zl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A4F10E4B0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8aJ5d024938
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gF5yCUUH2ecWswuPj5GpyGQVGYbV11ScW7MQA2xB7KU=; b=cKCBr9ZlXIiWuDdq
 qFY/lXEKg91mzFZwvxbCesSI4AEmgmaCFBUet8IuLU9N5Fz7uVd3vcJ09eDojlzB
 ZQNV/XO1NNVGl0l0NYeA+miD0SbKOMR/cgLInESweg+XoepEKXev0akQWXcFNSxI
 j0fZdnzFmLKcx2rD2fSfax9ztd8rt89Usconxf6MCPPOnj2WSW7BAYxP0rrhh/sF
 2dtBmFuZCLVaEjJ8Zugd+HDSay4TYAGBn0Kvkkn4ViKS8U1ZaH9SqKTP7DtV1/89
 1u52y0U6xfsR3Qq/0nfO041Kwo0a5y62tt6RAvspzoQ/98nVwqzTzzYtDHX6F4I6
 /mkhng==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw82s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-771b23c098dso943104b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131434; x=1756736234;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gF5yCUUH2ecWswuPj5GpyGQVGYbV11ScW7MQA2xB7KU=;
 b=W6lSJ8sQrefDEj8+T8mLhLzslxnSsS1kvOUwu3yWsf5oO5aJ2UQ3T7f6TnYmAAzhHE
 haujjjeQnW5sM2OGvm1v1TtVIQltgGMG6XuPlYRwc8iW2DuA1cpzvCkprMP4oFj1Tcft
 LTg89aN2pLActdPtoKjYe5NC+4lKnBpr1q87eN2uBsFMtHr0qn3AJMG0obiUFGg2EK4N
 YmWODcO3r1vFOZoKfYY5k267aG6tozZvglWb27C/2UKKz9S4wPQrAsvmaOxZMY/Rcloa
 xXtK8XH5VXuwyDyhvPPl5IwH+uPLkQx65Ed/4B7miC+iC1xVmAgHmd8U9ik4qwquOLgJ
 jt5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRj2oxXZinJykAzHVLDqe4tpyNHyB42HVD6lnllBZFYPVVLIfw4MUiJCF2a/WRXNI5TlqsDsEdyIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq4WTJw46RJV9w37FyUppWSP41L9AKbf+cezNIlqZde1V2bkYi
 AV5yN4ZKBYaTnL4WbJ4PMV9MBPZ0mqF+NrSt1VCLKvidLIEKEvA5O3qJTi0vQ2rR003QdmRCR0Q
 R0e2KeE3DddBpMVPIk8Hnqhp5l4WcnIwU5+KYbAPkYX4N+xYkfDr6VQzZVJWGiCR2DTOJS34=
X-Gm-Gg: ASbGnctEmNw77QB5zB/lHVSBY8ipiN4ZgzhrErhU89J1762P8efLapVuHMQmduqD0v8
 YkrUWfieudkiGs5aL6nV2lXCO/sVErpio8ascpyjOoRm2QOJXQ2hsAIIzK/J4qNMfmn8b8YeQkU
 97h2MB0Sj7SGQemKjiB0QXLsreXEKfyu7z0/WqvRcDzPbSjl0Ms/WJCAA8V0AD73zH+6f6kWJ2q
 4MhgW9tkSdyk//ld9NGcXWPzFZZziIQam4kNcsl/dCxF9T79YuII88/V0/XixQ31qWFsnYY678p
 xuCOZPMIQg4fz0CeDRtF/RP1o+uCPLdrJPFbGFc7tWqjZoYuu1y0hMljWhxDQi4kMWm3L6c=
X-Received: by 2002:a05:6a00:3c91:b0:771:ec42:1c1e with SMTP id
 d2e1a72fcca58-771ec421dd4mr2014394b3a.16.1756131433718; 
 Mon, 25 Aug 2025 07:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUAVQwRsD6uoLSRc7oJUF4l2nyWeHZUOOMxA2rFcFQFlR3MacYGjd7QW9iFJRXZHPfxb9v+w==
X-Received: by 2002:a05:6a00:3c91:b0:771:ec42:1c1e with SMTP id
 d2e1a72fcca58-771ec421dd4mr2014371b3a.16.1756131433196; 
 Mon, 25 Aug 2025 07:17:13 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:12 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:47 +0800
Subject: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131418; l=8479;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=pW1C/FAkrELsv2lywujfPr2WEDZOqzKrkIRTRgn3JOM=;
 b=Ia/lzZCIgQkRmB3T8DJay/JEg5rDHt/HDMS4jdDjAYuIMpU3DmbMpB68swR6oxY4h2hftlCb5
 0qRF/LIxER/D25ZS3c90EB5PHZjBHIiIdU0liObXziKmAzkQ2YWv6Oz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: qU5q8ojIhyLNO0jLqOPIQ31kuiSXKTqO
X-Proofpoint-ORIG-GUID: qU5q8ojIhyLNO0jLqOPIQ31kuiSXKTqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1XbrI+UoK0IS
 n5E5FbT23xiIk1X02HnbSarn0IfnM9j6ltmqF843Xu9qumwpfOy8gWuTqVDdYacvbooH82U56Bi
 /R1azp5E4BlvHQZ6GAxAGiLI1btz17cP6LR+iZDg6MUDTJco558fKjdyo5yabAUXtvpdeGH8PCa
 1kjX94b1PZZ/xvRCT508VuoeB0csOcKjEgufiNXP7HDEjBpJnrXqIrl/40mGMI7K6/tB1TcENB1
 +2a6tl/9Q0qHbwBxDN3qN37pzTvZzXTBzxi7+LzqOacfRiU2vepXcPsKCl0YyS0jfpSldEy2L46
 AlV1boFWth6YeKf7agBmLctYrW27/DQz4EDT4iRkAyQp2xW8nFragGf4yTs23yjfBCSo24Uxecl
 Eu06hh6F
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac706c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s5ODlx4LKU-xjoPD000A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
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

The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
state management complexity. This change removes the drm_edid member from
the panel structure and refactors related functions to use locally read
EDID data instead.

- Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
- Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
- Removes msm_dp_panel_get_modes() and drm_edid caching logic
- Cleans up unused drm_edid_free() calls

This simplifies EDID handling and avoids stale data issues.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
 3 files changed, 26 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6d81950627a073baca9809690134a711e965035f..dadf31bc37763c4f07f68b76fbbe33fb77b20850 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -282,6 +282,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	const struct drm_display_info *info = &connector->display_info;
 	int rc = 0;
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	const struct drm_edid *drm_edid;
 
 	rc = drm_dp_read_dpcd_caps(dp->aux, dpcd);
 	if (rc)
@@ -289,7 +290,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
 
-	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
+	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
+	if (rc)
+		goto end;
+
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		DRM_ERROR("panel edid read failed\n");
+		/* check edid read fail is due to unplug */
+		if (!msm_dp_aux_is_link_connected(dp->aux))
+			return -ETIMEDOUT;
+	}
+
 	if (rc)
 		goto end;
 
@@ -306,7 +320,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	dp->msm_dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
 
 	dp->audio_supported = info->has_audio;
-	msm_dp_panel_handle_sink_request(dp->panel);
+	msm_dp_panel_handle_sink_request(dp->panel, drm_edid);
 
 	/*
 	 * set sink to normal operation mode -- D0
@@ -565,7 +579,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
-	msm_dp_panel_put(dp->panel);
 	msm_dp_aux_put(dp->aux);
 }
 
@@ -616,7 +629,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
 		dp->ctrl = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
@@ -624,13 +637,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
 		dp->audio = NULL;
-		goto error_ctrl;
+		goto error_link;
 	}
 
 	return rc;
 
-error_ctrl:
-	msm_dp_panel_put(dp->panel);
 error_link:
 	msm_dp_aux_put(dp->aux);
 error:
@@ -794,8 +805,7 @@ int msm_dp_display_get_modes(struct msm_dp *dp)
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
-	return msm_dp_panel_get_modes(msm_dp_display->panel,
-		dp->connector);
+	return drm_edid_connector_add_modes(msm_dp_display->panel->connector);
 }
 
 bool msm_dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e1176a80b5c9d25896b1c8ede3aed..eae125972934bb2fb3b716dc47ae71cd0421bd1a 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -159,7 +159,7 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
 	return min_supported_bpp;
 }
 
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 	struct drm_connector *connector)
 {
 	int rc, bw_code;
@@ -201,25 +201,6 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
 					 msm_dp_panel->downstream_ports);
-	if (rc)
-		return rc;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-
-	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
-
-	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
-
-	if (!msm_dp_panel->drm_edid) {
-		DRM_ERROR("panel edid read failed\n");
-		/* check edid read fail is due to unplug */
-		if (!msm_dp_aux_is_link_connected(panel->aux)) {
-			rc = -ETIMEDOUT;
-			goto end;
-		}
-	}
-
-end:
 	return rc;
 }
 
@@ -246,20 +227,6 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
 	return bpp;
 }
 
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-	struct drm_connector *connector)
-{
-	if (!msm_dp_panel) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	if (msm_dp_panel->drm_edid)
-		return drm_edid_connector_add_modes(connector);
-
-	return 0;
-}
-
 static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 {
 	edid += edid->extensions;
@@ -267,7 +234,8 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
 	return edid->checksum;
 }
 
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid)
 {
 	struct msm_dp_panel_private *panel;
 
@@ -280,7 +248,7 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 
 	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
 		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		u8 checksum;
 
 		if (edid)
@@ -736,10 +704,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	return msm_dp_panel;
 }
 
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
-{
-	if (!msm_dp_panel)
-		return;
-
-	drm_edid_free(msm_dp_panel->drm_edid);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d2cf401506dcbaf553192d5e18c87207337664ab..618d0253b525308b392b9282098e8ca78bf32f1c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -33,7 +33,6 @@ struct msm_dp_panel {
 	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
 
 	struct msm_dp_link_info link_info;
-	const struct drm_edid *drm_edid;
 	struct drm_connector *connector;
 	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp_panel_psr psr_cap;
@@ -50,13 +49,12 @@ struct msm_dp_panel {
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
-int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
+int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
-int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
-		struct drm_connector *connector);
-void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
+void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel,
+				      const struct drm_edid *drm_edid);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
 void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
@@ -95,5 +93,4 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
 			      void __iomem *p0_base);
-void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.34.1

