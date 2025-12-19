Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3662CD0064
	for <lists+freedreno@lfdr.de>; Fri, 19 Dec 2025 14:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C910EF9A;
	Fri, 19 Dec 2025 13:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL6mbnBv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgExg5ES";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B781F10EF18
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4cgYI3992412
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=; b=PL6mbnBv7EfMa/B3
 G/A19Ugs8x7no5uZnLc29BKl5Vn8kvur6C1cWp0BD6B1yAEL46bhrEpfcdmUJYlA
 MlUhdBP13GpNKF7CztRp2h3Rl/X+GwnC+iphFCsnCl7LXcBxunss8sfRgfeduSwY
 NQulyM566QcMI+8rgGko+9m8/K1S7D5MmjNzzlZx7nvROqa5FIFPAL/OHxZ66NR9
 OyedHIjhIsqSVTv3pBbl/6/8r7WnQYdsY4ma6gMPrB7MHKBElv+Ov1CrdTHxZbMu
 ZJgrti+EpWkMyNssU+vC7PcmKI5W1AUxaLJHh9LOWSDp9k6mq3jr74AvbchRF3vn
 Hh5fgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da9hh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b6963d1624so368284585a.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140765; x=1766745565;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
 b=YgExg5ESHROL4/KbYD3QjNyVVOtry24P3ggzvvvF1/1GisP9kWTiq5wZ43YN4aFR6G
 fE6bZgUoBhCEOraEiEUO6Ihkyw9okP1kdWHw1VqoUUw1zsMP8nFM7kEi9Qhi33drP9NM
 OJBRjGI40Vu1n1JmpDI+AT1eITh3TE45+RdC2ru6zi6CCTNvcbiF7yvt3mvjVMCXg0Zy
 jLrSYHSineZEZcZh4GXqutqSWZ9T3oHCq4QdYdKLGb0j0lgnz8E0gJfE6ooJn6pHw7w/
 8Qq4nqxJdepnAdkjMW75dEI3LFhPJTD/PS6DHIdYROSV/S3UUHbiI3sMmE/yjaWJTCmQ
 uDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140765; x=1766745565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
 b=H3dhPpQ1w/bEPGfeYTrqrusiCrQoKA0iQfpXacTb7N+frR04NPSXW8nKFO+9nEOc3A
 HMUu53VZTkWlVgO33JHb05HI5jG72essTc07ZufdyxuFKzNtYu88bSqvbCMiEPqRdi97
 3wNl+iaTk3tYqfsBX7HNWde6B2VY4S543mtXyL94Ty+deO0rDlbR3uvsmgyQ7CrQ7QLb
 /QEdYzxdg3OMzMifU7czn2mm1aQ7K/lMV1NEjCi4BZ6X9pQEagv1aSEo6fOMc1ceflts
 NFf+f1I02vX6ebxgCmGl4TVELU/zsBtkZ8FZ/kB1HJ37nzZywW6xAB+29Xa/PmYsekJl
 1cSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaN406/nseEqt5qHVZEbHyQ/VWHjg3yo0N3d4RB2+x+tlF7Xe6APdwQO70BYU24W5UeqtOon3QsxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNyplz/evmj5w7TW2kAE24ihYKkvsIFSJfGXrUtWoCDZnAmdBF
 576KDF242rnvK2bnBzzkkhJgo3gj7YFCXUqQVfe8jdykYpHq3QCH4e7Kg8qRXsdBJpfyIqbDfSI
 2yD+qIcLnFannM7aRJPAdZVQ0jmJTIg2slV/UiZZ4CgIfGT5gmebTbBtNVJ9/ADk4vVU8SQ8=
X-Gm-Gg: AY/fxX4rXqyzt1pBM81o/Sc1e4ety+V08DMv648q9HJ/HvO2CUnhj6xPMfium4s8sVz
 KPSHVIXttNPQVRXvxrZiIKXX7VEYDtsVjytnukUNyCFcJF1fQn7iEBKP7gebMVkGhy9jEOOaSaY
 11tiVcI0DF0TFzjL5jj0yuMoB8Cg+URvLEaHyGOTv3+yJNVkSHAkf+7FrUMedpM0QJ2lT0BzLs3
 HUAWE5NdQWxuigufRpt/5ztrJI9Y6fnoz2PL87hKObbginTIBKWPRyGeuwfNqT8VWpSA5Opl9tr
 UV+ziEDdvNW94oubUyibiGPq4Pp4cdot61qPyAUmQIDMGbARzO2+kbtmHifBTCwuNhd0bzw48V1
 /nWu3c73c2oK95lc=
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id
 d75a77b69052e-4f4abdb50afmr28813891cf.76.1766140764947; 
 Fri, 19 Dec 2025 02:39:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8DdSG740C5NPtMnK++fiGar0BQXZYGFlOhBwei0Gw+oZGsGEVWCVcw5gfBcVRV33F8o/4LA==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id
 d75a77b69052e-4f4abdb50afmr28813631cf.76.1766140764354; 
 Fri, 19 Dec 2025 02:39:24 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:39:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:39:02 +0200
Subject: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xi0isO2zj7u63F4efQxBlJHUzywGMfOEhn2zIGrUuP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStWe971J3fXTWEto13F48xEAWlKpa5UIoGw+
 D+K2Ywjo9CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrVgAKCRAbX0TJAJUV
 Vhq2EACMJmriHKHHwDFtldQFgURBx4XUWuTs2XtI6i/Lz1PK+mNP3KE6bb02hHOT9IQv5viiWMu
 Q7f/wqUQX8WTlW27jFbpxXs+AusXdLV5Tjkx+KlAtjuJ1GkRiKGBCa6nvc8Zml+m9mTsA4sCm6R
 xN8/Nqf1955BF2X+9qS7t27e1dHFl0Z6bov60B55+1+V9DQmHARRDBnabvRTn2ttIrfapZfxj6S
 9PsJG0d4MCqPZ+6Ap2TAVP/1x5qL9Le1vDR3dChYL3rlxYXLjIpzKDwqvw20rolUk2HPBoKOhZA
 IoumZx27B8wJP1fouA4tXkP3sklTjaedbdvZbBdfdtJ2Oqw6S6cSUJ+P+sF5V4t0QytGRm8lVIV
 m1M6h8hgIl6fEE+OIF+MdOHxie9RpgNV+Bn/Au0X7MaXx3hAEAMllohmUrvn+erTNzSzuRxwS7w
 U60+NY2ypnELM3YT6p6ZVwdAQdpH2eTFiSyqaxMGQRXbFD4y0KulWSWCb2rt6/2FrkIo7NI0/0y
 lKSYhb60Q6tAStYRyJBTNVOJWNwzX274eH2zLVIqR9D8MX0sQ+shMiRPN+2WQlasy4UQUiAKGNe
 3LXjhrbdhacEsctzY9VMnAboKO09+7NpxVh2h4afqs6wY6yU2cOh79KjXyVXBTKlW4Q7wZl6N5c
 sfQV7olIOinz7XQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69452b5d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8
 a=ZMc9qBuXswDIMKfH7wMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfXzgridfUm4eKe
 DS/GamnSURJGVdZLIxr3Ac/mL8PqZ7StVLHFmHjThJbK0yqJxR4uFB6tIm4BIbZh0Ren4l5vJp8
 CE0vi6Ynjp/VWVhKcFCoTm7tne0k0CQHsQ6g1lN+gxHwJi1oHeX8GerGs0sj+yG2NEJb6/NzDXf
 j3CljyTSZPTXMOP71+vcF4sVhmxfwCOXkMUiS4pRAw6L9x+BQTwujJikfW59s52tcaTOYa00oZx
 CCNkiDfRTZIHjkwxEEpyZRBpgkFL8AhOeCvbEF0d1oi4wy9Dbz68DgPD0Vl3EKAO/d57z9Ow8r6
 iePEX5CaU4aV7kHe3gDLpF6yC2eRTDnBOaGP9luwp+P6itIqwDJQQX2IfJUa0ck0kWBjAI+LqyX
 FfMIEenXM4gysTmp8TLbRpNkJzTguPcTrDjRQRuckKRk9I1DdnGWX/S4qbSgQYo2bB2STnSEp82
 AkVNW4L3tkuf1R/5R9Q==
X-Proofpoint-GUID: Qj6_MXz-3Hz8gCTae_S5nzIlHcLehP-S
X-Proofpoint-ORIG-GUID: Qj6_MXz-3Hz8gCTae_S5nzIlHcLehP-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087
X-Mailman-Approved-At: Fri, 19 Dec 2025 13:20:32 +0000
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

This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.

The dual-DSI dual-DSC scenario seems to be broken by this commit.

Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 011946bbf5a2..2d06c950e814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_QUAD_MIXERS];
+	u32 crcs[CRTC_DUAL_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1328,7 +1328,6 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
-	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1342,14 +1341,11 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
-	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
-	 * resource. Otherwise, use 2:2:2 topology.
-	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 *
@@ -1361,23 +1357,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	num_rt_intf = topology.num_intf;
-	if (topology.cwb_enabled)
-		num_rt_intf--;
-
-	if (topology.num_dsc) {
-		if (dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
-			topology.num_dsc = num_rt_intf * 2;
-		else
-			topology.num_dsc = num_rt_intf;
-		topology.num_lm = topology.num_dsc;
-	} else if (num_rt_intf == 2) {
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	} else if (dpu_kms->catalog->caps->has_3d_merge) {
+	else if (dpu_kms->catalog->caps->has_3d_merge)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	} else {
+	else
 		topology.num_lm = 1;
-	}
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 2c83f1578fc3..94392b9b9245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
+	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..9f3957f24c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 4
+#define MAX_CHANNELS_PER_ENC 2
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -661,6 +661,7 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
@@ -674,12 +675,22 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/*
-	 * Set DSC number as 1 to mark the enabled status, will be adjusted
-	 * in dpu_crtc_get_topology()
-	 */
-	if (dsc)
-		topology->num_dsc = 1;
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
+	if (dsc) {
+		/*
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
+		 * when Display Stream Compression (DSC) is enabled,
+		 * and when enough DSC blocks are available.
+		 * This is power-optimal and can drive up to (including) 4k
+		 * screens.
+		 */
+		WARN(topology->num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
+			topology->num_dsc = 2;
+		else
+			topology->num_dsc = 1;
+	}
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2169,8 +2180,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[2];
+	struct dpu_hw_mixer *hw_mixer[2];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 09395d7910ac..61b22d949454 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    (dpu_cstate->num_mixers != 1) &&
+	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 336757103b5a..4964e70610d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_QUAD_MIXERS	4
+#define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 31451241f083..046b683d4c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.48.1

