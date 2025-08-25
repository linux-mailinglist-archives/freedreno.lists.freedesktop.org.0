Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8207B34319
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71510E4C3;
	Mon, 25 Aug 2025 14:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dStW5F9H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A310E4B0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Siim019144
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3tNrzkm6NnC5NBmKQusZe/7bD7M6yByAsNnMKNdXFAA=; b=dStW5F9HT/iazpGT
 ilpwA0mK/96+i+Bv93Crh5jwgGxqfsSNrjAo8esCaMmITM7WVDPZqqlKl/n2sjug
 lyvQnxO+m6uTR3/OuPNFaTbDQGJVfg/IZ1JhWZmwbDud3ZiObmTiLjJsV8ugbY+/
 r7aZHVFL7LWj0925SLwagMIq7ZjU1GWUGVkfJJ4AqlAxqag/4OMvcQ1B19oN6wwl
 bF/qHOsvvfsutdeDLeUPZy6r3JzoYv3MaTOTFbSXxqc+JIeYIC/B2JNQ4Cs4i/GF
 63cqzCyIh0pJJNp7dpknYJu94F50gsRBsJaSKpkO+zD131w9gCWSemMr434C/kQa
 U72J6Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85bah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b49da0156bdso2388780a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131488; x=1756736288;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3tNrzkm6NnC5NBmKQusZe/7bD7M6yByAsNnMKNdXFAA=;
 b=rWn5/xd0BkSMMp+y0NiqGvaqHpydz6gKkE2e7Szar05CWbRW17upTNjBsk81Kkx2Wx
 WecuFwNdOjKIf9JipqmiJfTbLKPp0ug0y/WNI7lJlW5eEgw+4PamGkaa9qaJuWexumeF
 +Jm5X1otN8zpZs6KU209xdJ+5Djq8XqLEMsAWYOKoRulr5AbXGvTbfSB2s8pdExeanTJ
 w/huC6y8JxvnL/i/kPHkKZ+V5yKDO4UbgTRlfacxxVtDq9lZzaLuTjfR7Vn+BVM1R3OR
 Z6ro91/f+hUEmMrO8x5dXFkx5JQwo2LzssSQc+BqUpwh0gdkVAGHF8JFEqSXKiNLGqgg
 5L6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUokIwD7GAt/Zs9x1ts4hzSR5IUW9AH/39FdFXN2gKTTWdDzPWYLZ8siP7kuwvDvZUW9H2ljO2+mjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSnwX1FfhfdL3lZKdosdUyOUDV1n3FQLShVa1SkDAlDWYzHgR+
 pLE83TQCzVsvyJLDwxQ98q0U2GXz4eCh+XT830EK6c4IRyo6kKb4fmUs6dMUzw8yFjYvbPWWmDs
 GDn34rCeO+s08a7g0vVtnrkRNLyEdIqKVnUNXFO3QeAcaOegshlm+oTv1NUVXIdb1XTF8eAQ=
X-Gm-Gg: ASbGncsYs6Gogky5H3eAVbvcv00QcvGLkcE0t3aGNTXYo6KXOdZVvjczC/ADekaZJb8
 Ml5zydacR/heRbAUNijOkimkEw1ZnIz9khQ5XtPPyG3jbu6/I5tbgTezhqL86Q15NgZyddMjjuF
 nvY4RNCmgL2h/8XQRuramsdOrO3pq5KT3UQbXwoUeQMZdFbmxehbW9QkLemvIwA+60K0BOjZed0
 Xg7+e+WVbNO71SKkKPGJ6PgxHEYAnwqlaXQ64z34E/rQvx9BysW/50JxUX8u3Gv0aLVdNAjHOYG
 9k8H3zcDfJJ83Oal81zhHZtMwN/30ZdyD+2WIx8Kt9sR5wvfA1+qjou4F8JZ6Xlaw0CoZz0=
X-Received: by 2002:a05:6a20:3d05:b0:243:15b9:765f with SMTP id
 adf61e73a8af0-24340d6f10cmr17849033637.57.1756131488016; 
 Mon, 25 Aug 2025 07:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ1HzBewiXw9vfRQNLd4+B97QoHUnfjuI52e65+qx0ZYTu69HQYFnxU9HDs9qPlgpq31w3pg==
X-Received: by 2002:a05:6a20:3d05:b0:243:15b9:765f with SMTP id
 adf61e73a8af0-24340d6f10cmr17848973637.57.1756131487362; 
 Mon, 25 Aug 2025 07:18:07 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:07 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:00 +0800
Subject: [PATCH v3 14/38] drm/msm/dp: Add support for programming p1/p2/p3
 register blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-14-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=11942;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=yEUuvDwmyu188sY/ZnxrJRIxTCaJhFliNhhqn1z3+u0=;
 b=HdTdBmhUk43Yom9vXzKoiZC4YTCXDcOfRJeZT195NBp+k8zPdMFzTLzSvjGOI20ebbVA7sxbN
 yg+hw5PHq7GA+gCbCqiN3FVUFYReEV825Kq6uo+XqVE+IhwX+AZYuEj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-ORIG-GUID: C061ShnyGGxE1fYrTAedmrAVcfawC5Ta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXzWxFCHWwDv/1
 cSnzqWfPNKoFm0D+lOc94R+OB2qQ7fGQyt9L6Vo15LaeMknRE7hPiLcDMXLNiRilFDzmL/aajCP
 tD5cJvfkzJixJT7mRCVWcYjpu4zgQ0EJtFUU+hT2tIEG0EObCO4cwPgl22UR0MPVKsJUKJ5QPzB
 ZwZr4aYEDmKu8WkAzdndOLdZbnGmn28PpKfUodg3Xc8Lt5l7mkywO+WqitViBo58Krt93KO8qL7
 1ilNwvWxv8565UeDqs0Ks25+hyMFNo93qBaE5uUquTf8cnzJJYXQZZ9zb1Oh8kFn5UdOfLOJbbz
 d+JorCznvY7n1/iKEJZjI1HJvs5ggUKgtB17g+pq5OGQpCjhyXQ5oUHzdXuDWqxjnaAclbDvf4d
 dmYcmlGY
X-Proofpoint-GUID: C061ShnyGGxE1fYrTAedmrAVcfawC5Ta
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac70a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=4aQLaHZKxtSMBsMh2sMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
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

QCS8300 supports 4-stream MST. This patch adds support for the additional
pixel register blocks (p1, p2, p3), enabling multi-stream configurations.

To reduce code duplication, introduce helper functions msm_dp_read_pn and
msm_dp_write_pn. All pixel clocks (PCLKs) share the same register layout,
but use different base addresses.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 68 ++++++++++++++++++-------------------
 2 files changed, 59 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3422f18bdec71a99407edfe943d31957d0e8847a..935a0c57a928b15a1e9a6f1fab2576b7b09acb8e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -84,8 +84,8 @@ struct msm_dp_display_private {
 	void __iomem *link_base;
 	size_t link_len;
 
-	void __iomem *p0_base;
-	size_t p0_len;
+	void __iomem *pixel_base[DP_STREAM_MAX];
+	size_t pixel_len;
 
 	int max_stream;
 };
@@ -619,7 +619,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -937,8 +937,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 				    msm_dp_display->aux_base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
 				    msm_dp_display->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
-				    msm_dp_display->p0_base, "dp_p0");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
+				    msm_dp_display->pixel_base[0], "dp_p0");
 }
 
 void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
@@ -1181,12 +1181,13 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 #define DP_DEFAULT_AUX_SIZE	0x0200
 #define DP_DEFAULT_LINK_OFFSET	0x0400
 #define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
+#define DP_DEFAULT_PIXEL_OFFSET	0x1000
+#define DP_DEFAULT_PIXEL_SIZE	0x0400
 
 static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 {
 	struct platform_device *pdev = display->msm_dp_display.pdev;
+	int i;
 
 	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
 	if (IS_ERR(display->ahb_base))
@@ -1206,7 +1207,7 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		 * reg is specified, so fill in the sub-region offsets and
 		 * lengths based on this single region.
 		 */
-		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+		if (display->ahb_len < DP_DEFAULT_PIXEL_OFFSET + DP_DEFAULT_PIXEL_SIZE) {
 			DRM_ERROR("legacy memory region not large enough\n");
 			return -EINVAL;
 		}
@@ -1216,8 +1217,10 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		display->aux_len = DP_DEFAULT_AUX_SIZE;
 		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
 		display->link_len = DP_DEFAULT_LINK_SIZE;
-		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
-		display->p0_len = DP_DEFAULT_P0_SIZE;
+		for (i = DP_STREAM_0; i < display->max_stream; i++)
+			display->pixel_base[i] = display->ahb_base +
+						 (i+1) * DP_DEFAULT_PIXEL_OFFSET;
+		display->pixel_len = DP_DEFAULT_PIXEL_SIZE;
 
 		return 0;
 	}
@@ -1228,10 +1231,18 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
 		return PTR_ERR(display->link_base);
 	}
 
-	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
-	if (IS_ERR(display->p0_base)) {
-		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
-		return PTR_ERR(display->p0_base);
+	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
+	if (IS_ERR(display->pixel_base[0])) {
+		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
+		return PTR_ERR(display->pixel_base[0]);
+	}
+
+	for (i = DP_STREAM_1; i < display->max_stream; i++) {
+		/* pixels clk reg index start from 3*/
+		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
+		if (IS_ERR(display->pixel_base[i]))
+			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
+					      display->pixel_base[i]);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index eae125972934bb2fb3b716dc47ae71cd0421bd1a..e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -26,7 +26,7 @@ struct msm_dp_panel_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
 	void __iomem *link_base;
-	void __iomem *p0_base;
+	void __iomem *pixel_base[DP_STREAM_MAX];
 	bool panel_on;
 };
 
@@ -45,24 +45,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
 	writel(data, panel->link_base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
+static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
 			       u32 offset, u32 data)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, panel->p0_base + offset);
+	writel(data, panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
+static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
 			       u32 offset)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(panel->p0_base + offset);
+	return readl_relaxed(panel->pixel_base[panel->msm_dp_panel.stream_id] + offset);
 }
 
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
@@ -297,33 +297,33 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_pn(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_pn(panel, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
@@ -333,9 +333,9 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -369,7 +369,7 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_pn(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
@@ -559,7 +559,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
 	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
@@ -567,7 +567,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_pn(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -673,7 +673,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
-			      void __iomem *p0_base)
+			      void __iomem *pixel_base[])
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
@@ -692,7 +692,7 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	panel->aux = aux;
 	panel->link = link;
 	panel->link_base = link_base;
-	panel->p0_base = p0_base;
+	memcpy(panel->pixel_base, pixel_base, sizeof(panel->pixel_base));
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;

-- 
2.34.1

