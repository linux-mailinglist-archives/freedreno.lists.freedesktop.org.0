Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D62ABAFF2
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 13:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEA510E2E6;
	Sun, 18 May 2025 11:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoqry9p5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E259A10E2E7
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7LlN9018103
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uAI51aqtvMVB8xFAYDC2axTFVPxOxw/woySkF6K476w=; b=Xoqry9p5yOwMmyXo
 lcjsnEeEAANF+u4v7WWzZOC6jAI+4dgwMwHTl07kdn/jwycPevrnd1K5AWxWXlXy
 GGrlY0wfp0vA5KYJLGsPwdCY9FyCAfD7wlB14mjZJKo9PnEoLzdIbwKklY+UnMPj
 7DPyOtxV3bmEfO2vpEhbIsJYJcBGNRtLHANrDMD+yaouELpV172ae8VaXHKwe74Z
 yQ0T57f7265EEs6Mi7hnHf9tChC4BdFeEMZhbz10ZlpB7XFOH/Muo8ciuhNhJdNg
 dFC0aCMQL8u29+125w2GiVwu/eqZ7psRiu36wLpEWzSsuo7z3ZIzOTUx3ZwYEtoe
 9sXIFw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4swe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso37158776d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 04:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567319; x=1748172119;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAI51aqtvMVB8xFAYDC2axTFVPxOxw/woySkF6K476w=;
 b=i9wXmk7Xut6ykWvOaL2tFbT/qHdkAMbRy3GilpoR2x1hW1tXKHmc0Ef/0DiOAfkbIz
 /i6HPQc/ODdCGjZnx+SRLQgG3tVxK1Oz4XxZR3aF/T5srvoq0HKGCS3tspa9BwzVyag5
 Ku+S12qnKh6GnJM/malJp+aeZkH1Ku9KZZUpIzK2Qnk/zpb66L7/hT3cadGpRjnNHVQc
 xEu2DFNl5fPSk0mnQa3bpWuzl5Yndu6gO919cbWqVbcAKLFhwcq3yrv58+8CgMvl90C3
 oOszL/P3EsPIfX9WB4ZmnMeg6NJ6Zl/SEYib4d/g64JxplbL5p4GSJOOwa7ObfzTjS/8
 3Edw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1tchbkJY1yys3ve4P56Rjkgh3i+B3A98CJaQN92QKAjsQXAS5XJ3gA0NHXINFzE/gh2ZV8KngHp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjHs7F506YyQoLvkP9fAJqK2A8MuJ/Sv0kpjv6OyHwVYImumRz
 KJLtpM9JO1x8Tu9kG2zj7N5yxWD0lSzQPAcy0SuIgwWHZz4zzaycdzI4ttvWNucJUn4acmJ1yzB
 m4O9bpEGizDZ86jVwjxx/zRTU6fUfGoOnaVAB3h2xlMZ6bo25cpxNiHhAjgfifM87xnbnRGo=
X-Gm-Gg: ASbGncuuNK5L0HWGki2hTEoTXvzjXyo+ciq9x5SK7Ss5vqRd1yT5FbW8pr8hTuNPQkf
 lWvehvB7M4rc9HCWH0mcaum38Kb8CBl8sdmi+8/dDR/5xSydPp0ORDIsCzMyyTd9izskvuYDX7G
 rnF1k5cHOplETPytZBcGuxZJl2ESGaVT6NFgLbAaYPvXjGjbTOYtynlZOCTY7Ahl5+lDX8n+gOz
 1ZItq3LibgxOoJjB1jTGnzBX8H2sSPRLoYmXWunN1uklEEgND9OLn5XhYF3w8NL6MLCuiQiA2lt
 i552K90BfwPIbB7zcaZOaM1zlMZJ8HN+98AwavQzt1RpEbxK1loTWDAP7wCKH0807ZM6cwmkRFS
 y0HKGsIfbzM9b4dEdcpGMDAw/
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr168086286d6.38.1747567319251; 
 Sun, 18 May 2025 04:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVKZKBDevq+ozq+BtpgkV4Aj3H6AQmG6TfS4uOdfcQzxQCxqxFJKGNws0zbJ+IRGHRuWtR6A==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id
 6a1803df08f44-6f8b094f396mr168085836d6.38.1747567318789; 
 Sun, 18 May 2025 04:21:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:43 +0300
Subject: [PATCH v6 10/11] drm/msm/dp: move interrupt handling to dp_ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-10-2f0ec3ec000d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=19061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cFB/1SPdrLDKUZGU0gY44Ya69wm6tzku95/Qa+NMhDg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLAc+RgcxPtqsHlrM82y02hcjl1KskhOAHg7
 yK8thmIVMOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1UllB/9FA6xSNSn5kCXhwm6y+GNthIPcqWTGch21Klg/+j41mHzYk2U15m7e6cJqz1WT8HNjJNf
 ZQuzb7f7AoQV1TO6ZirDNHQeQayZfhlQkKQrrTvnKi1VpMfJHBLCxVJ7zLqktC8GgWPdl36ojkX
 9cBx+31kCtfhNLpkV/x4TYmlSRSqVSLwvSCojT34kRMDHaqr3mu/956yoU1gGPEn/LznwS3Hfc7
 jKGKovA0BTNAcJ2h9DHkY2YQjRW1YN5C99W/UdwwY0Lm3SHdrOi3AoOHC93C2hHTFraspoZKLbd
 YRArwRiMICGZJuXkWF0MTkNRKT1KKXOMdQ8OhOtZUNrhoTXb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829c2da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=cQV4YECOshyG1Dae9JAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ltUMr49uTYmazle9ExZZmT1lXhS0zDK0
X-Proofpoint-GUID: ltUMr49uTYmazle9ExZZmT1lXhS0zDK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX74UjULKbC8E2
 +bXvMWysxR95sZjwWPn+ykPqxXCN5P95uK96b/Fa6YdwraXOITWe535veYjrJk0dl1z4d5E0bRD
 +XKq5TQTQh1SJX2EHybZcEwDo7QEzjdEyc/021Nkpzh3G5/SWFjxKZhuVSefCH3Y0HHd1HupOsZ
 xkxzdrAZJJE/2MODo6gT96M7IDu2Hfuqtb3yoaeP1gTa7XKumzENbbF9R/6b454f0WHOutGZdVy
 Hc7kv0Qi3oGSPgkkR11YAccaAtny+Af7p17fpV0FOq1UYL8K1IDQPuiPFSUf1vYIRc2Uu409pnB
 PSYfwNbLroMMBr4zpId+BCgWkUuV2+R7l+sjZftIlCwsMVDw9DSWZ1jvgSPShIk51tzlv5vkpyW
 X8V/LkfRuykNvy5bPBWF/paJlt3gfmifkvv3Oom934ItvEDB5I2I86j9tuFuXrMQEkHGb6/K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108
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

It makes it easier to keep all interrupts-related code in dp_ctrl
submodule. Move all functions to dp_ctrl.c.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +--
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c |  95 ------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  26 -------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 142 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   5 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
 drivers/gpu/drm/msm/dp/dp_reg.h     |  17 +++++
 8 files changed, 145 insertions(+), 160 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index f8ea1754665afa37ff9dbaf3f883d94c48bf07b8..d7a38fa5d64d618af463416edf13bef79d6b53ba 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -437,9 +437,8 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr)
 {
-	u32 isr;
 	struct msm_dp_aux_private *aux;
 
 	if (!msm_dp_aux) {
@@ -449,12 +448,6 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
-	isr = msm_dp_catalog_aux_get_irq(aux->catalog);
-
-	/* no interrupts pending, return immediately */
-	if (!isr)
-		return IRQ_NONE;
-
 	if (!aux->cmd_busy) {
 		DRM_ERROR("Unexpected DP AUX IRQ %#010x when not busy\n", isr);
 		return IRQ_NONE;
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 624395a41ed0a75ead4826e78d05ca21e8fb8967..83908c93b6a1baa6c4eb83a346b4498704008ca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@
 
 int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
-irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux);
+irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux, u32 isr);
 void msm_dp_aux_enable_xfers(struct drm_dp_aux *msm_dp_aux, bool enabled);
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 9d6d59264a592cc3ae312b35e51d48c11bd141e6..84adf3a38e4cf0619b15850c31416f1e67049a42 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -15,41 +15,6 @@
 #include "dp_catalog.h"
 #include "dp_reg.h"
 
-#define POLLING_SLEEP_US			1000
-#define POLLING_TIMEOUT_US			10000
-
-#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
-#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
-
-#define DP_INTERRUPT_STATUS1 \
-	(DP_INTR_AUX_XFER_DONE| \
-	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
-	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
-	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
-	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
-
-#define DP_INTERRUPT_STATUS1_ACK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS1_MASK \
-	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS2 \
-	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
-	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
-
-#define DP_INTERRUPT_STATUS2_ACK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
-#define DP_INTERRUPT_STATUS2_MASK \
-	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
-
-#define DP_INTERRUPT_STATUS4 \
-	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
-	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
-
-#define DP_INTERRUPT_MASK4 \
-	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
-	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
-
 #define DP_DEFAULT_AHB_OFFSET	0x0000
 #define DP_DEFAULT_AHB_SIZE	0x0200
 #define DP_DEFAULT_AUX_OFFSET	0x0200
@@ -77,66 +42,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
-	intr &= ~DP_INTERRUPT_STATUS1_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS1)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
-
-	return intr;
-
-}
-
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
-						bool enable)
-{
-	if (enable) {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
-				DP_INTERRUPT_STATUS1_MASK);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-				DP_INTERRUPT_STATUS2_MASK);
-	} else {
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
-		msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
-	}
-}
-
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
-	intr_ack = (intr & DP_INTERRUPT_STATUS4)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
-
-	return intr;
-}
-
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
-}
-
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 intr, intr_ack;
-
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
-	intr &= ~DP_INTERRUPT_STATUS2_MASK;
-	intr_ack = (intr & DP_INTERRUPT_STATUS2)
-			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
-			intr_ack | DP_INTERRUPT_STATUS2_MASK);
-
-	return intr;
-}
-
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 5196188059f3ade2b6cc260ee65a7efb38844664..ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -11,23 +11,6 @@
 #include "dp_utils.h"
 #include "disp/msm_disp_snapshot.h"
 
-/* interrupts */
-#define DP_INTR_HPD		BIT(0)
-#define DP_INTR_AUX_XFER_DONE	BIT(3)
-#define DP_INTR_WRONG_ADDR	BIT(6)
-#define DP_INTR_TIMEOUT		BIT(9)
-#define DP_INTR_NACK_DEFER	BIT(12)
-#define DP_INTR_WRONG_DATA_CNT	BIT(15)
-#define DP_INTR_I2C_NACK	BIT(18)
-#define DP_INTR_I2C_DEFER	BIT(21)
-#define DP_INTR_PLL_UNLOCKED	BIT(24)
-#define DP_INTR_AUX_ERROR	BIT(27)
-
-#define DP_INTR_READY_FOR_VIDEO		BIT(0)
-#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
-#define DP_INTR_FRAME_END		BIT(6)
-#define DP_INTR_CRC_UPDATED		BIT(9)
-
 #define DP_HW_VERSION_1_0	0x10000000
 #define DP_HW_VERSION_1_2	0x10020000
 
@@ -112,15 +95,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 /* Debug module */
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
-/* AUX APIs */
-u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
-
-/* DP Controller APIs */
-void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
-
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 #endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 97a5f854f8344962c36e67d1cca480c1d5a3ef00..82ed6da67b44e56015efe6ceb6038c79c16a9fa8 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -31,6 +31,38 @@
 #define PSR_OPERATION_COMPLETION_TIMEOUT_JIFFIES       (300 * HZ / 1000) /* 300 ms */
 #define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
 
+#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
+#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
+
+#define DP_INTERRUPT_STATUS1 \
+	(DP_INTR_AUX_XFER_DONE| \
+	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
+	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
+	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
+	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
+
+#define DP_INTERRUPT_STATUS1_ACK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS1_MASK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS2 \
+	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
+	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
+
+#define DP_INTERRUPT_STATUS2_ACK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS2_MASK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS4 \
+	(PSR_UPDATE_INT | PSR_CAPTURE_INT | PSR_EXIT_INT | \
+	PSR_UPDATE_ERROR_INT | PSR_WAKE_ERROR_INT)
+
+#define DP_INTERRUPT_MASK4 \
+	(PSR_UPDATE_MASK | PSR_CAPTURE_MASK | PSR_EXIT_MASK | \
+	PSR_UPDATE_ERROR_MASK | PSR_WAKE_ERROR_MASK)
+
 #define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
 #define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
 
@@ -129,8 +161,10 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
-static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 {
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 sw_reset;
 
@@ -149,6 +183,79 @@ static void msm_dp_ctrl_reset(struct msm_dp_ctrl_private *ctrl)
 	}
 }
 
+static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
+	intr &= ~DP_INTERRUPT_STATUS1_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS1)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
+
+	return intr;
+
+}
+
+static u32 msm_dp_ctrl_get_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
+	intr &= ~DP_INTERRUPT_STATUS2_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS2)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+		     intr_ack | DP_INTERRUPT_STATUS2_MASK);
+
+	return intr;
+}
+
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+			DP_INTERRUPT_STATUS2_MASK);
+}
+
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl =
+		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
+}
+
+static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+	u32 intr, intr_ack;
+
+	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
+	intr_ack = (intr & DP_INTERRUPT_STATUS4)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
+
+	return intr;
+}
+
+static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
+{
+	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
+
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+}
+
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1674,23 +1781,6 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 	return ret;
 }
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable)
-{
-	struct msm_dp_ctrl_private *ctrl;
-
-	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-
-	msm_dp_ctrl_reset(ctrl);
-
-	/*
-	 * all dp controller programmable registers will not
-	 * be reset to default value after DP_SW_RESET
-	 * therefore interrupt mask bits have to be updated
-	 * to enable/disable interrupts
-	 */
-	msm_dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
-}
-
 static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
 {
 	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
@@ -1743,7 +1833,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 	cfg |= PSR1_SUPPORTED;
 	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
 
-	msm_dp_catalog_ctrl_config_psr_interrupt(msm_dp_catalog);
+	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
 
 	cfg = DP_PSR_ENABLE;
@@ -1868,7 +1958,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
@@ -2499,7 +2589,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
 
-	msm_dp_ctrl_reset(ctrl);
+	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
 	if (ctrl->stream_clks_on) {
 		clk_disable_unprepare(ctrl->pixel_clk);
@@ -2526,7 +2616,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	if (ctrl->panel->psr_cap.version) {
-		isr = msm_dp_catalog_ctrl_read_psr_interrupt_status(ctrl->catalog);
+		isr = msm_dp_ctrl_get_psr_interrupt(ctrl);
 
 		if (isr)
 			complete(&ctrl->psr_op_comp);
@@ -2541,8 +2631,7 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 			drm_dbg_dp(ctrl->drm_dev, "PSR frame capture done\n");
 	}
 
-	isr = msm_dp_catalog_ctrl_get_interrupt(ctrl->catalog);
-
+	isr = msm_dp_ctrl_get_interrupt(ctrl);
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
@@ -2556,6 +2645,11 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
 		ret = IRQ_HANDLED;
 	}
 
+	/* DP aux isr */
+	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
+	if (isr)
+		ret |= msm_dp_aux_isr(ctrl->aux, isr);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..10a4b7cf0335a584b4db67baca882620d7bab74c 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -30,7 +30,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 			struct msm_dp_catalog *catalog,
 			struct phy *phy);
 
-void msm_dp_ctrl_reset_irq_ctrl(struct msm_dp_ctrl *msm_dp_ctrl, bool enable);
+void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
@@ -41,4 +41,7 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
 
+void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
+
 #endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8b79eebe68cb40b7c640c559e8eda400ee1b5f0a..e0ce410c6b26e10c36fff530b6b07e537c7ed759 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -457,7 +457,8 @@ static void msm_dp_display_host_init(struct msm_dp_display_private *dp)
 		dp->phy_initialized);
 
 	msm_dp_ctrl_core_clk_enable(dp->ctrl);
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_enable_irq(dp->ctrl);
 	msm_dp_aux_init(dp->aux);
 	dp->core_initialized = true;
 }
@@ -468,7 +469,8 @@ static void msm_dp_display_host_deinit(struct msm_dp_display_private *dp)
 		dp->msm_dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	msm_dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+	msm_dp_ctrl_reset(dp->ctrl);
+	msm_dp_ctrl_disable_irq(dp->ctrl);
 	msm_dp_aux_deinit(dp->aux);
 	msm_dp_ctrl_core_clk_disable(dp->ctrl);
 	dp->core_initialized = false;
@@ -1170,9 +1172,6 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	/* DP controller isr */
 	ret |= msm_dp_ctrl_isr(dp->ctrl);
 
-	/* DP aux isr */
-	ret |= msm_dp_aux_isr(dp->aux);
-
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..d17e077ded73251624b5fb1bfbd8f213b4a86d65 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -21,8 +21,25 @@
 
 #define REG_DP_CLK_CTRL				(0x00000018)
 #define REG_DP_CLK_ACTIVE			(0x0000001C)
+
 #define REG_DP_INTR_STATUS			(0x00000020)
+#define DP_INTR_HPD		BIT(0)
+#define DP_INTR_AUX_XFER_DONE	BIT(3)
+#define DP_INTR_WRONG_ADDR	BIT(6)
+#define DP_INTR_TIMEOUT		BIT(9)
+#define DP_INTR_NACK_DEFER	BIT(12)
+#define DP_INTR_WRONG_DATA_CNT	BIT(15)
+#define DP_INTR_I2C_NACK	BIT(18)
+#define DP_INTR_I2C_DEFER	BIT(21)
+#define DP_INTR_PLL_UNLOCKED	BIT(24)
+#define DP_INTR_AUX_ERROR	BIT(27)
+
 #define REG_DP_INTR_STATUS2			(0x00000024)
+#define DP_INTR_READY_FOR_VIDEO		BIT(0)
+#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
+#define DP_INTR_FRAME_END		BIT(6)
+#define DP_INTR_CRC_UPDATED		BIT(9)
+
 #define REG_DP_INTR_STATUS3			(0x00000028)
 
 #define REG_DP_INTR_STATUS4			(0x0000002C)

-- 
2.39.5

