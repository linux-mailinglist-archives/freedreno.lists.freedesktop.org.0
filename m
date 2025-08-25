Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A86B34302
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C38410E4B6;
	Mon, 25 Aug 2025 14:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFtimOF3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0F510E4B8
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8PoTw007747
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=; b=AFtimOF3rqirlD3m
 InM/Vy4yl3Eo9+uQN8Li8wURib3geERHcfgPP9k/Ls96x8/uYjHukzkeXBcGa06o
 fiKwTAgPuc6g/ccwJkG7pq3piwfZXHhtNeR7ZaZ6mPldp+7v563nvmDuPbghtj1V
 aV83HXzUhLXXRFlAACoR/ZxNZe+SQu1YLeJrPPNvUSAjCF3ANn3ln+ByyUgEZx/k
 +p9K5l7QkCcp75XoiTdxgphafjHBDBbBssk9CspRj8q1UZr5iL9lKduy1vQ+LpGV
 i6U+Vc3oiORgXSJ4U9+NjKNO2HLpjji+7iZ8htQIpgwCOZD+DR0TMOY7EdmcHZHF
 piJM6Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdbk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:17:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-771f28ed113so171995b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131450; x=1756736250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=;
 b=qz7qRf3EY6Uw3NHBO0spndM07jtp8iOtKmPWaynX8RhLgw1NGMG/WA8jd52ssIwzOi
 oaXYg30WovxI0SUne6AUyTIlD/I/b2WPDwxvgYEMkSRHxK+bpzoZEnAL34s37n6fPFCR
 SXpmdENgpGYAWJIK5sLs/BjVaIM7b+7vBwASJuqCysmPSGJHUi8YuZhmADVZSb0DLtRz
 dnzHQCRSXPBWPlE5lqPcq3yJDu8yk8b8WRUcCazWm2/AXr/EF3s9cCNS/g2F+zumKpZV
 XShY7JhPgnsA8Xk5lWEKFRkZ77A22mOyqikEaiuxShbyb1HKfinyjY9mzfVRms+Mvn5e
 VEJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0A1+69xVNbTWkmmxJaKLPROZZ7ker+khKIVwFqquy202TYBZ89u16+kUM+8+JO9vjdMPMnZhetVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsKce5Ni3mXUOTUKSAncnO0CyLwkcaTOrriUqJkZSlcs31z3ZU
 9ELHTr7ZAyrEA0VWk5fj4ektYQOA+j7mVHTzMqmWzkAGfaRIVZV0Ee8GoybBxnRAnr9rcFqB+q8
 cOb/fEZR4KeGCsesmKSkhHYxbDZy0TXgF8+Av/QDHmISkF2n6NS6C9yMO7JJpbizA9CEG5G8=
X-Gm-Gg: ASbGnct80lt6oxXII9CEF2zrs6gYlvJ5XKnUgfMPl1gYFAQxAJ67XdGxWVh70DmhBLN
 ySKBPyOxd3AexV4ebMkfTF+SK/hSQzvYrbwBWqDWg9SfAc1JUQyAfqD/1KG2kNO6pwSyuDX8bq/
 XdPyLqfU7QypthSCnDd+pPcATpIKv7SLcpoc6paRg4f9NhTeDH9ZpHB/DhuuI442sGWI27RNeBG
 /I1Dh92R8tIcqYMMpFLmTikm1M682dHs8mWLlcG1HkUwZSl98m+8W8I8Dpn4waBkKNs2uAIP5fF
 1py27xfDuIhb9hUKy6WHkM+ObX1kq13VVCtTvsq/cklZwd3cVRk/AA8sL6iBEElDzlIYKOI=
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id
 adf61e73a8af0-24340d72168mr17478410637.42.1756131450086; 
 Mon, 25 Aug 2025 07:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nessZyA2NUMM89H1JrLWKePi/2394p08eRkWbRWq2iI3n+M5I1Y5+xYaNlVn6ePDJ2+MlQ==
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id
 adf61e73a8af0-24340d72168mr17478356637.42.1756131449523; 
 Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:51 +0800
Subject: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=4323;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xDy9ih89F5xZ4CDJXV+M2TH1QImXV64VcC6JWSBfCEE=;
 b=HW0FUIhch/TGL/hUGl5G89eaxl3x6hc0kAZXKDW69RK9I7wUSBciqoAT8LB2FZMA4r7TMO3ac
 01pCbpqhSTDDtZEvPDPzk85/8vGANoPWg6CEiUr5N+bvhqy54ACMnqy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX9rONxIZqq8Xj
 AmNHdmX2HSxrtm1NbPejRlmrQOZoljxxzk9a5bUwJ01crDS7MEiXJJbk6YPFve0WZ0VtpshqbYt
 gOFNA15UtnilzkRyhiT30Ehr1PTte6eYHVantqlwaX6pAa8Nwb0ImiItoGo9vXrY4+CfUomeMc/
 I8z6UvilzDLydSLx99s9LoZqeVp0h3yxHy1L7Ou5fIHeVk14h7yG6DgFnCPEX2n+0ROkKtPlE4/
 lH/yyEA6bofMB8D8I6jnYe0oNhUj8r3XOISj/SC7+U/EgbuoxcNHD6vmst0wO+rm6XZGgITYGwX
 CTNdwf77rVtBXi4HK3PK+ItUgZED5W+k51qqWPL+aO4EjjlYGa9nDeRahKVzlXAQ3z5cI59mPQp
 tksQYncR
X-Proofpoint-GUID: Lsb6iLHTgigsmXGwcVRrRl9zrHl2tllS
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac707b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=A4lVjiY8PA1Kidclo-gA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Lsb6iLHTgigsmXGwcVRrRl9zrHl2tllS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
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

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together, which makes it harder to support MST.

This patch separates the configuration into two functions:
- msm_dp_ctrl_config_ctrl_link(): handles link-related fields
- msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields

It also moves the link-related configuration out of
msm_dp_ctrl_configure_source_params().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+			msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.34.1

