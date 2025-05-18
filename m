Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B20ABAFE6
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 13:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076EB10E2D6;
	Sun, 18 May 2025 11:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEwNTALF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13410E2C3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAB57M025360
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0n3BypQtMzrM4f0/F0/fXFNrDqsTMnOoMWLWOj3CoJM=; b=oEwNTALFOTf00JdB
 X4+80JAwPG+1msFQZxPyNuzVYaDGduw/7hjOo7O9zhVE0mY8mDJWYBsxunE0sW3k
 VCFB1aIx3RevVTYxViN+WZDEcKEsoHuLvM0j70jMAlgC+zflm1otBCX7Kjl9fhnG
 WBS3DR3MJh8yYbtBQwOz4sFGTAjHRc7ASFK5SrU0go1piNthQy98toxowNRrcUxk
 sFJrkw03P5UoAwfot9I61jL+ZbgE6dURRIXpWs1eoVSJJaHA7/eOCKn4aDw283OJ
 T0FFo90TVfdAH9Vj7gSyzYu4GF9b5VnAB9NRY5lxMK36NbE31by6YRqnM9LyEswe
 YsuWiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1uvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8c6ce05e0so18118516d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 04:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567310; x=1748172110;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0n3BypQtMzrM4f0/F0/fXFNrDqsTMnOoMWLWOj3CoJM=;
 b=jGIhDJIX3nsjYOYI4BBsmx3CHSTGsk6QFAGvxMwVo3AO/Va0nzM3r3cEc5EfZrsLIx
 6hqhbi12YBwCiusRypoJPkWaMXTdyAaUWk2dHWG2qN16lQfeLpd6s9qm9aeAF3P6OUWM
 s5iR4fi6yLe/XOdQ9a8OCJ1JsnP9fij5cw5HxhOEtWw9XyMKw1KyTL2WTk7Z2iOjWgif
 hAA/y2A+t/Sn5rKqtndeYJiUGZelIdZ+OfjPWr9v5c1F7iJS+IJF1Q86w/brJD62R04m
 hq2F9ON22cQ4bIj77URx6VTcwrusdWqIq/ZmoPOptTPUm5WpD8K2xgNpBRtduuda5Hqo
 Posw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqxp2eqSO6Zj9HuGI0H5ww+5wuLyTzSpMP+pqqEVamXuVt5/FLMUZJRRSlAQjGpgyxXRVOJEVI1qo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJkjrw15bXa3ZXzHDB/cbzgq5REq1lwhqYp+bii8smTNPiNODx
 cQQH+0d3o2ZZOQeWKkUDMivHB67kMGI7mwANMJDjYZcHB7hSGt6Wxg5sNPHlvirNZh7A8fGq8RM
 CcTfp1YBVoh4Ju3K8vZs5hshkbsYzIfP1lGTFwneM79ixTKdwQyzrZONFnBF17HX8jgRq/8k=
X-Gm-Gg: ASbGncuocKCHbiWj1j/iKuyc8KabJ8H/KxSC/TQ1mrxbKqXWcVMYXepxcjq6pPTGyWf
 yqQ/3iszhRCVG2SFL/ef+QbfiimReWGzLdZB+w51eNfXom9C2LXUU1LhE10AyPS+YuaHN4wiLVp
 rsmWx9VE2CiCsB2lfbrPK13DHcJkSOUdQ/3SanETEm7DKaT6Vc0HWiwUPuTuR3scKaVubm3Vx5w
 DgovsZSZagxUgC4Seyiv4Tw2SWbRYtzo0AZJ4XlNE2R0z9xaFFCVQ0WKXVVhD2Vli8T5GWzY/Tl
 eifTxXsqSXA+a6DvfaTZ5wtTxX3VHiewptJTJcuZisAs7CerkjWlXvfM4LczDJJQyXZutHBUjKM
 ncd/IXtFUPjFXqVndehy+xm5S
X-Received: by 2002:a05:6214:410:b0:6f5:f83:1cf8 with SMTP id
 6a1803df08f44-6f8b084b10emr155866856d6.7.1747567310387; 
 Sun, 18 May 2025 04:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqh5JCLA87nL/m+fZPtY64kqi9FLEiJjiyTLum/kL95i5EBrq9+IwuV907+i1LziO1TpePDA==
X-Received: by 2002:a05:6214:410:b0:6f5:f83:1cf8 with SMTP id
 6a1803df08f44-6f8b084b10emr155866466d6.7.1747567309891; 
 Sun, 18 May 2025 04:21:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:39 +0300
Subject: [PATCH v6 06/11] drm/msm/dp: move/inline panel related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-6-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=22430;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PqJ2MS29jXnvAGHppPl1yLvXSuTkm3MZ1P3f3wq086A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLASFR9vcCoG9W0i4/TdpW95FOMGpL4Zp3wB
 /U7buadBZGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1dxrB/9bfN7ordWPSb2TexbKcCqjdPCAUH6MYyafi9TEZuNpoGSpmo/zg7MOvo3x2HzkMLwJfP6
 OY2emgzNuTx+1WgsGprsVC94zM/lXAo9kgjHRcOGj+F7cy8zCKRIj7Fp/9MPKsNQRqw8ibken6m
 XmKJdma2reZMywKDR/Ijes9ul6kAwAyr3RyE5SBu9BSbkLFhNJhaxM4i7E1tFze/HRfInGpyutJ
 3eOgSOaPqcODh223S5gN0T151qf6ym8tp5uDk7WcSjuw24RXPhhcL7KiE8U49yALjDC6/cvk7yj
 TeaUDb+07e4H8hJqN8mYwiJoGnxIQaq6Y40kAKI2m/qNJMuZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4-1nrfNDoANJ56xJC-EBx4v2YyeUX8Tj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX/tbexYHYJBQE
 lgG8/ThkFSC7OXi54uSRWqI2ZB5b4SClo2vCqc+cJaXsnugqw9GFOpYCrO/jkeNxBYrchvgPLC0
 K3o6JAOfLA4/WMFiR6fUvX7MQqcmex7AsiWJdms2v8gqmMf+7xob3zaVPk4E6pmLd885kv6EcOm
 9Pd4GleGmaIt1elQkH0oHxKDtIaZarOEh8ePz0j9v388QsakmaiZWW60OqyVAk8WIL5sAH2rjzX
 OdHXunL7D4saZRUnvT/lOrRmLMt23ODoPdMUptq+pvspbSbu+KPUh1cG2NUgo+FR+P1sBKQxQWR
 1DX4eZ59oAx+XENNcp3HOT3UF6vnomwRCvmhsRrDGCEZgHrozo7m9M4ey9h5BON3D8vzegA0Uku
 1xg6t/C5TTZAR4o6uCVPA1jusT1auUSpT1x8r6dPV0tPwfgVk2qVMlBId0goh4SgpCntcXBc
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829c2d0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=qMlQlRrnqS-ZJRghOD8A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4-1nrfNDoANJ56xJC-EBx4v2YyeUX8Tj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Move panel-related functions to dp_panel.c, following up the cleanup
done by the rest of the submodules.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 195 ---------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  11 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   6 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 209 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_panel.h   |   5 +
 5 files changed, 206 insertions(+), 220 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 10dfbe94b627855b5a0e3cd4a3d77498d8d43ab8..e9db5585c1325fe5e067526f567e39387d5a4f47 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -23,8 +23,6 @@
 #define DP_INTERRUPT_STATUS_ACK_SHIFT	1
 #define DP_INTERRUPT_STATUS_MASK_SHIFT	2
 
-#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
-
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -590,199 +588,6 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 	return msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_READY);
 }
 
-/* panel related catalog functions */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
-{
-	u32 reg;
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
-
-	reg = msm_dp_read_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG);
-
-	if (msm_dp_catalog->wide_bus_en)
-		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
-	else
-		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
-
-
-	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_CONFIG, reg);
-	return 0;
-}
-
-static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
-{
-	u32 header[2];
-	u32 val;
-	int i;
-
-	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
-
-	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
-		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
-		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
-	}
-}
-
-static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 hw_revision;
-
-	hw_revision = msm_dp_catalog->hw_revision;
-
-	if (hw_revision < DP_HW_VERSION_1_2 &&
-	    hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x01);
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x00);
-	}
-}
-
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 cfg, cfg2, misc;
-
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
-
-	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
-
-	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
-
-	/* indicates presence of VSC (BIT(6) of MISC1) */
-	misc |= DP_MISC1_VSC_SDP;
-
-	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
-
-	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
-
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 cfg, cfg2, misc;
-
-	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
-
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
-
-	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
-
-	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
-
-	/* switch back to MSA */
-	misc &= ~DP_MISC1_VSC_SDP;
-
-	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
-
-	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
-
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
-}
-
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 hsync_period, vsync_period;
-	u32 display_v_start, display_v_end;
-	u32 hsync_start_x, hsync_end_x;
-	u32 v_sync_width;
-	u32 hsync_ctl;
-	u32 display_hctl;
-
-	/* TPG config parameters*/
-	hsync_period = drm_mode->htotal;
-	vsync_period = drm_mode->vtotal;
-
-	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
-					hsync_period);
-	display_v_end = ((vsync_period - (drm_mode->vsync_start -
-					drm_mode->vdisplay))
-					* hsync_period) - 1;
-
-	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
-	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
-
-	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
-	hsync_end_x = hsync_period - (drm_mode->hsync_start -
-					drm_mode->hdisplay) - 1;
-
-	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
-
-	hsync_ctl = (hsync_period << 16) |
-			(drm_mode->hsync_end - drm_mode->hsync_start);
-	display_hctl = (hsync_end_x << 16) | hsync_start_x;
-
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
-			hsync_period);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
-			hsync_period);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL,
-				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_VIDEO_CONFIG,
-				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
-				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE,
-				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN,
-				DP_TIMING_ENGINE_EN_EN);
-	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
-}
-
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
-}
-
-void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_p0(msm_dp_catalog, MMSS_DP_DSC_DTO, 0x0);
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index d120a4872d444a4f8eb1e638d0e293033bf1334c..60f08fe888cb110e3fc3dfb1d763a57bd5bf47f6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -148,17 +148,6 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 				u32 pattern);
 u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
-/* DP Panel APIs */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode);
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
-
-void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 4c0a19e14492dde92e5707ffe520681aba1ca5c0..17f645495c4a3e6603fee688090a6ffb3f263cf0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2050,7 +2050,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
-	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+	msm_dp_panel_clear_dsc_dto(ctrl->panel);
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
@@ -2076,7 +2076,7 @@ void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	/* set dongle to D3 (power off) mode */
 	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
@@ -2131,7 +2131,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	phy = ctrl->phy;
 
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_panel_disable_vsc_sdp(ctrl->panel);
 
 	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..53eaa9d3629ceae0bc127a605056419bdc4ac7a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -4,6 +4,7 @@
  */
 
 #include "dp_panel.h"
+#include "dp_reg.h"
 #include "dp_utils.h"
 
 #include <drm/drm_connector.h>
@@ -11,6 +12,8 @@
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
+#define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
+
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
 
@@ -252,9 +255,87 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
 	}
 }
 
+static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
+				    struct drm_display_mode *drm_mode)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+	u32 hsync_period, vsync_period;
+	u32 display_v_start, display_v_end;
+	u32 hsync_start_x, hsync_end_x;
+	u32 v_sync_width;
+	u32 hsync_ctl;
+	u32 display_hctl;
+
+	/* TPG config parameters*/
+	hsync_period = drm_mode->htotal;
+	vsync_period = drm_mode->vtotal;
+
+	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
+					hsync_period);
+	display_v_end = ((vsync_period - (drm_mode->vsync_start -
+					drm_mode->vdisplay))
+					* hsync_period) - 1;
+
+	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
+	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
+
+	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
+	hsync_end_x = hsync_period - (drm_mode->hsync_start -
+					drm_mode->hdisplay) - 1;
+
+	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
+
+	hsync_ctl = (hsync_period << 16) |
+			(drm_mode->hsync_end - drm_mode->hsync_start);
+	display_hctl = (hsync_end_x << 16) | hsync_start_x;
+
+
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+			hsync_period);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+			hsync_period);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+				DP_TPG_CHECKERED_RECT_PATTERN);
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
+				DP_TPG_VIDEO_CONFIG_RGB);
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+				DP_BIST_ENABLE_DPBIST_EN);
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+				DP_TIMING_ENGINE_EN_EN);
+	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
+}
+
+static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+
+	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+}
+
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 {
-	struct msm_dp_catalog *catalog;
 	struct msm_dp_panel_private *panel;
 
 	if (!msm_dp_panel) {
@@ -263,7 +344,6 @@ void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 	}
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 
 	if (!panel->panel_on) {
 		drm_dbg_dp(panel->drm_dev,
@@ -272,18 +352,113 @@ void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 	}
 
 	if (!enable) {
-		msm_dp_catalog_panel_tpg_disable(catalog);
+		msm_dp_panel_tpg_disable(msm_dp_panel);
 		return;
 	}
 
-	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
-	msm_dp_catalog_panel_tpg_enable(catalog, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
+	drm_dbg_dp(panel->drm_dev, "calling panel's tpg_enable\n");
+	msm_dp_panel_tpg_enable(msm_dp_panel, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
+}
+
+void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *catalog = panel->catalog;
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
+static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
+{
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 header[2];
+	u32 val;
+	int i;
+
+	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
+
+	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
+		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
+		       (vsc_sdp->db[i + 3] << 24));
+		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
+	}
+}
+
+static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
+{
+	u32 hw_revision = panel->catalog->hw_revision;
+
+	if (hw_revision >= DP_HW_VERSION_1_0 &&
+	    hw_revision < DP_HW_VERSION_1_2) {
+		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, 0x0);
+	}
+}
+
+void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 cfg, cfg2, misc;
+
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+
+	cfg |= GEN0_SDP_EN;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 |= GENERIC0_SDPSIZE_VALID;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
+
+	/* indicates presence of VSC (BIT(6) of MISC1) */
+	misc |= DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+
+	msm_dp_panel_update_sdp(panel);
+}
+
+void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_panel_private *panel =
+		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
+	u32 cfg, cfg2, misc;
+
+	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+
+	cfg &= ~GEN0_SDP_EN;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	/* switch back to MSA */
+	misc &= ~DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+
+	msm_dp_panel_update_sdp(panel);
 }
 
 static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 {
-	struct msm_dp_catalog *catalog;
-	struct msm_dp_panel_private *panel;
 	struct msm_dp_display_mode *msm_dp_mode;
 	struct drm_dp_vsc_sdp vsc_sdp_data;
 	struct dp_sdp vsc_sdp;
@@ -294,8 +469,6 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return -EINVAL;
 	}
 
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
 
 	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
@@ -322,7 +495,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return len;
 	}
 
-	msm_dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
+	msm_dp_panel_enable_vsc_sdp(msm_dp_panel, &vsc_sdp);
 
 	return 0;
 }
@@ -337,6 +510,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 	u32 sync_start;
 	u32 msm_dp_active;
 	u32 total;
+	u32 reg;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
@@ -382,7 +556,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_active = data;
 
-	msm_dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, msm_dp_active);
+	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+
+	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	if (catalog->wide_bus_en)
+		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
+	else
+		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
+
+	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", catalog->wide_bus_en, reg);
+
+	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 4906f4f09f2451cfed3c1007f38b4db7dfdb1d90..8dde55b3a5ab64c0c12d69cb2dd5b5c733c83432 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -57,6 +57,11 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
 void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
 
+void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
+
+void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
+void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.39.5

