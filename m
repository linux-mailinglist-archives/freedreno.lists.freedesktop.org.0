Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23313B3431B
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E724E10E4B0;
	Mon, 25 Aug 2025 14:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky2dY1Jo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A90710E4BF
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8Bp0C012519
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SQqij1jGWxzBm8gURjEdpAUbQ9oAC7XN3MeHI9CTA4k=; b=ky2dY1Jo3uqR7bQ/
 Nn3IorllXVv4e75Si1edKc3lYgl0/7bAsR7kwilY0hVc3PaZ23v+tuBgPIgIvAgw
 LFV5vScPWVchCNKwqORO9BiemoGmOBRgoW53ZVJDMp3ps1dkddIgygTNFKL8+owV
 RAIgyRW4CfIIsFx5bhAEOnzdebIcgINe7hgBcJ9VbEujtoFsdSSJTKD/K1oamZuF
 0Gye2NOuTRQwQ4AGIhWvl56Q7TZ8KEwEWQtNdCAagIgLNMA97pF45sfE6MGj9Lwq
 7u5SC4++GudUMxq2xfNOr4ysTizxqvogRmyFV8/f3vWPUqxrkmuvpD5djTA4LWmG
 m2QeLg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2nfbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2e5c4734so4476262b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131493; x=1756736293;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SQqij1jGWxzBm8gURjEdpAUbQ9oAC7XN3MeHI9CTA4k=;
 b=s+mrep7kG6TmAN6RZ+T5xwoVdxDS4ZtNKw44Pm0YdvaX4gCOxU+i5b2dQ1Wz5ZdGhq
 s1d5D/UNAcbR+Xiu5VgsMhwYCAGkdA7vhvEfy51FzC8mNIGDLw8HSpSq+kRMxwvHGC6t
 79k2jHAVLUdY2QYi6o03BrQa+Jwx+YGhifAgleSKBT+tzvrg/poZYUSRjCF/cntl5Mng
 2tSeezckddpmeSLav+k266eAz8tWm9cku24dOutQJSfl/bPwL4TouTYOe5Zf+hhOG6zS
 ua+Vk2gMj9Gl/iM+YawITU6PzqlhgZZm9E2pioZra+Su0YrePI0YL5RyPBB7SMQ7zNjq
 6p0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUORiG2oU3jxB45AeKiQfnvYY9pGwEpeCK6x4CeWFXZsP5SsONOfs3T0M28BHeVTX43U3PjZcQbBMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFhBu5nJTfPcOsLP8ZSzHdcHx0UQWDdD1/UkWuCw5bb7/YTKCU
 SfHKN5toWIFBh2tIIZs9MgeICsNNvWxVKApYvb5qWCU5ga49hvj8IgSyIaO3pU3WVnu0uYmprCJ
 bNmgbRtCNV3/uMYZ2YTqBAgGn8Q+AHBrkhi+4vju6LeTGXktDQn+zN37T6sgP5V3PBJbpJWY=
X-Gm-Gg: ASbGnct0tZ86Ku/BQ7NXxIsTl8O1XMR+O0trsb4MlltG2nU4TzZUyJuguArpu2MwyH2
 E3iLUlGFTSvjGo0DhenxD69nbA/lon+GDeLi6Qi/WD5qYbcvpomSc3DcW/oOfr7TA1WrLiFUFJ4
 LwnvOBCZ65x6nfgrSUbjbiox9bte/tqEptHabgEODqO+fYQ2Mofnf9Rxd1lt970bhZbcWnrPiew
 RG7Rc/1poXwXUgICVs4WkRTd2RUb3QO4Ak1DIEcD0o1d3/H4UuZbjAzMcE9r6n8dK0b2MUEu/0O
 oyxDIa7D6iTwVIpwU40u3b70+cjH3vi3+iNK+0Zk4+wPIHiSgar2Vza18adhiouRA1c3HwM=
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id
 d2e1a72fcca58-771e8fdabcamr3403962b3a.14.1756131492463; 
 Mon, 25 Aug 2025 07:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOkosCNNmgagRfH4jIarvCF/G0vBwYCsMmGDohXZNaLp/4H/27hznHCWuKa7OF4Nxoczf1YA==
X-Received: by 2002:a05:6a00:2e21:b0:771:e8fd:a817 with SMTP id
 d2e1a72fcca58-771e8fdabcamr3403896b3a.14.1756131491735; 
 Mon, 25 Aug 2025 07:18:11 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:11 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:01 +0800
Subject: [PATCH v3 15/38] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-15-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=13257;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=HxyDaRVDmwYb+OHnu8wIjDP1k65b7RsUFqoIm0aDADM=;
 b=NyKExz5PKczrBhUU6PDR/qu0PEFPkClZubXLsVb0lqyIAu0bUjCfpjjwK3pBQVxtUm5afuOne
 j619vlL81nvD6hG/lfjgv/lSSW5wVvsOslKMkzUGfylTI1jvJffDni/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac70a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=r9jD7K1Xdm-hk8nH3QwA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXypm8MW1H5ElV
 dFOLTdWWGRVxYno9prKb5m/zb0aEgPf2JzSpuCcHT8oVSyIaJd0wM8cLdZ/llpkmelWAQRK4gI9
 4U8KiXmiaU2uV6NVuNFNl0hJqGX+TWahQRuXjTTmkatQROxhpip0UTxZq8N8yJDfARCcA9eV1zf
 Jh6X6RBCAbDpMmy5/Chl4fEOpEdPUSS+hBDa7+65vekjx8pp5V/Plu/Xo52uHu2NyeTS4TMMTmT
 w+l5Bv+aOmyetQYMRkI/ZuMzIlktQwKCXGbUlEYuBqvZ/mk1cPRKTDw8VuwxfNBRm+ZN1FuYy2U
 JmUSJ5JNY/Xn8gQBZTpUfJIlJhxjqoccldZx/av9m5lHLOXWPmsCRQLEJubUrt3pEmoFtTa1IkQ
 5Mld49X/
X-Proofpoint-GUID: ndi-sHeW-0VN1AcrMvqTiMCA_mkZbGgA
X-Proofpoint-ORIG-GUID: ndi-sHeW-0VN1AcrMvqTiMCA_mkZbGgA
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

Use the dp_panel's stream_id to adjust the offsets for stream 1
which will be used for MST in the dp_catalog. Stream 1 share the
same link clk with stream 0 with different reg offset. Also add
additional register defines for stream 1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
 drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_reg.h   |  9 +++++
 3 files changed, 79 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index d4a74c6b70fb182ad8a0a786f85a0f50982d3858..b8b6a09966aed96f705bdd54cb16ea63e5f0141f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -384,6 +384,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+	u32 reg_offset = 0;
 
 	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
 
@@ -400,7 +401,8 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
 }
 
 static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
@@ -451,12 +453,16 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
+	u32 reg_offset = 0;
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
 		msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+
+	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -466,7 +472,7 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -2431,6 +2437,7 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
 }
 
 static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
+			       struct msm_dp_panel *msm_dp_panel,
 			       u32 rate, u32 stream_rate_khz,
 			       bool is_ycbcr_420)
 {
@@ -2440,6 +2447,12 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
+	u32 mvid_reg_off = 0, nvid_reg_off = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
+		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
+	}
 
 	if (rate == link_rate_hbr3)
 		pixel_div = 6;
@@ -2482,8 +2495,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
 }
 
 int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2559,6 +2572,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
 	msm_dp_ctrl_config_msa(ctrl,
+		msm_dp_panel,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
 		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9..d1af389dffcfee2d21a616de6ee027374997aaee 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -377,27 +377,35 @@ static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct
 	u32 header[2];
 	u32 val;
 	int i;
+	u32 offset = 0;
+
+	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
+		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
 	}
 }
 
 static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 {
 	u32 hw_revision = panel->msm_dp_panel.hw_revision;
+	u32 offset = 0;
+
+	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
+		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
 	}
 }
 
@@ -406,16 +414,25 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	u32 cfg, cfg2, misc;
+	u32 misc_reg_offset = 0;
+	u32 sdp_cfg_offset = 0;
+	u32 sdp_cfg2_offset = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
+		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
+	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
 
@@ -425,7 +442,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -435,16 +452,25 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	u32 cfg, cfg2, misc;
+	u32 misc_reg_offset = 0;
+	u32 sdp_cfg_offset = 0;
+	u32 sdp_cfg2_offset = 0;
+
+	if (msm_dp_panel->stream_id == DP_STREAM_1) {
+		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
+		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
+	}
 
-	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -452,7 +478,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -510,6 +536,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	u32 msm_dp_active;
 	u32 total;
 	u32 reg;
+	u32 offset = 0;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
@@ -524,6 +551,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 		drm_mode->vsync_start - drm_mode->vdisplay,
 		drm_mode->vsync_end - drm_mode->vsync_start);
 
+	if (msm_dp_panel->stream_id == DP_STREAM_1)
+		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
+
 	total_hor = drm_mode->htotal;
 
 	total_ver = drm_mode->vtotal;
@@ -554,10 +584,10 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 
 	msm_dp_active = data;
 
-	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
+	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
+	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
+	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
 
 	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
 	if (wide_bus_en)
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index b851efc132ea03884ce2563990fbc24c9577e724..43a9ce0539906e1f185abf250fdf161e462d9645 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -141,6 +141,7 @@
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
 #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
 #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
@@ -159,11 +160,15 @@
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
 #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
 #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
 #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
 
 #define REG_DP_MISC1_MISC0			(0x0000002C)
+#define REG_DP1_MISC1_MISC0			(0x0000042C)
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
 #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
@@ -230,8 +235,10 @@
 #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
+#define MMSS_DP1_SDP_CFG			(0x000004E0)
 #define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
+#define MMSS_DP1_SDP_CFG2			(0x000004E4)
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
 #define GENERIC0_SDPSIZE_VALID			(0x00010000)
@@ -240,6 +247,7 @@
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
 
 #define MMSS_DP_SDP_CFG3			(0x0000024c)
+#define MMSS_DP1_SDP_CFG3			(0x000004E8)
 #define UPDATE_SDP				(0x00000001)
 
 #define MMSS_DP_EXTENSION_0			(0x00000250)
@@ -288,6 +296,7 @@
 #define MMSS_DP_GENERIC1_7			(0x00000344)
 #define MMSS_DP_GENERIC1_8			(0x00000348)
 #define MMSS_DP_GENERIC1_9			(0x0000034C)
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
 
 #define MMSS_DP_VSCEXT_0			(0x000002D0)
 #define MMSS_DP_VSCEXT_1			(0x000002D4)

-- 
2.34.1

