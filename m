Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EEABAFF5
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 13:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8570B10E2E8;
	Sun, 18 May 2025 11:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nl3RAOgh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740C510E2E5
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9u2vA030139
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 isfUBVm6Apse7WiDlSt1bPl+dJUIlh4slCRg3yURJgA=; b=Nl3RAOghrwUPyKIu
 OHHzG1lgI9WFqc6Znc6SynY2HqRNuS7dazNuOK7pL7+rjNHjflIyVbCM3AfmYo9F
 M/a8RWLF+oNPteg6wjBkDzu++aeuCmT74XBATAI2dZZFapXj0HLx6PLTMwXlAoxr
 OB6k0JPcY9p7+kjIL5jFfiAXncLCgNnjVy33/qW2F2cc6RFTYskaE4m1ylcGAd0e
 GnVgo3tjcWN0QtMIBI4U4FXaW/D7GxlcjoefANOC+FeQOj1eI2D4yyLJkdADpx/D
 ls3anhjdiOPsJ9iJJGDfNBesrPg+yG0E5fBI1AGPhFdjmWKnBvmGpHzCEGgJbcar
 j+xRPQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1uwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:22:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6f5104d07so93682886d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 04:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567327; x=1748172127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=isfUBVm6Apse7WiDlSt1bPl+dJUIlh4slCRg3yURJgA=;
 b=WPlL2SUmY/vHBMoaSQ87lA1xpwSYzvjUR/o3XY45ATE3uoG7a5+n5DdjuxaCMHfG3Q
 hhK2MmaAaehVoM1LirfUGHhjNBX9PgjnSkCUqOVoKG5Spzkl2WgE6lKvZEGwGN/z/Z2j
 GUxNPDKpHKSAzexUcoAFS7/XdU4s9Kj6BcgchCbTZEIARmX9kaLWLDZUMT+1cCak7zrw
 zH9shgLYUQxZk2IEsUPCEWgfOzeg0ZsYPfnyFASJJ/KcuDZxfsJWdowDqBdavkl2m6PY
 ftp+/4jbIIdnwM4jdkltx9KpCBtNitrwG6Y5It5S5UkCdtyFgyvHBQsbcNgvT/6kZpAh
 cVdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW937n642TwvbpxIoeeoXWrB61/WKSxZsr9n2tQIp+5pj5lvyFqfZIcF3HYqlrMBVLMS6/NcnQCSFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdfxYBbBYYGnnioNyJfyBlscCB3+EL/mqOy4UDkzIaR3bQB3Yc
 xhIIKcbnErRqBJKB3X+uPMOrqmH1X210tATNYd6ER6DaYYuIgU07C7QfzImVSrb4/9vf6aEj4YD
 jvW1ZlhpFsn9BdDemA1BZEAuQi9/zW7hmAnlJhvNQ7ahryDNo8CNN6Ft9YO/mkVc3odRbf+Y4Vs
 eilag=
X-Gm-Gg: ASbGncvgZ6Dc8iw2Se5+iJSLPt2xzBIiEKgR3oBaaXa3E3WBOfLTya+bjFi5N4Kiy6I
 5lp7tFb/LlxiPy+eSSE2hGJwjwjabFk0wHF/QYn6z9UkStiv+vZG8vIP5meN/9v3IwHck4esAi9
 0Kc5U5C2N2WhOUGA2IlXj0a0HbxYtmBYW1sR4OqYXUnuFNg8nP95FlFFIx7o6O4b0iBXfyNP7ze
 aHFGjFZDn6KKzmDwq9Zs80yA6rjctobYbHPTl4D5HyhZUWhZpIlS5/AaofNfofJ9coyz3j8IPSI
 f87BmuHWNT6k+MFSKc8ga6fEaIeVuM++E25vIoPd/Fzqdzdh/2WBE6zjh3V3y37g0C0xZeHmBBG
 9miPl9GcsmZ2MgVLPZMWyWqQq
X-Received: by 2002:a05:6214:21a5:b0:6e4:3eb1:2bdb with SMTP id
 6a1803df08f44-6f8b2d3a73emr128460786d6.43.1747567327068; 
 Sun, 18 May 2025 04:22:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9R4svDnLocfCiG3esazEmtjr6P/3200O06sTIq56jLvCLyXyBYSw2sFtXjZzu0q09wv/m8w==
X-Received: by 2002:a05:6214:40d:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6f8b2d2bc99mr132843656d6.39.1747567316286; 
 Sun, 18 May 2025 04:21:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:42 +0300
Subject: [PATCH v6 09/11] drm/msm/dp: move more AUX functions to dp_aux.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-9-2f0ec3ec000d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14138;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Czg0wt/48pvtxl2fgAD7a+HrsG1hPvG76JcBIm7svU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLA+RCz9+bQZdeMlxcBAskFMx5DiBtV9dRg1
 QA/pqvd7LWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1cU3B/9v47HIlq18g6rJEjqz1rsW5octJfjFZtbUnf+O4KkH8FoK+G1iLsH2JrzbPwReE9N21mW
 IvEfbMsn723YKw/DnKkWbhvNDJV/pX93IETxm11nckgulm+kmM7WqJPN707y2F7Za1IbhnlXO90
 eiCCVrP/cVUHu+3g/cVeHoyYiTQwlWWAFnN8/1CDnQhWVhqviRthkZFKnqRhd1QZCJsazoJx3Z7
 ZSV5UtYv+ACMIRQqDS5oBLeHpd1ZbHhgjDfQpqQi3Leh+ToGF2ZuKn57Az61Fy8q8ZKUOQbo32m
 d7+vuhKVkNjKP6pB+ebE9ecdpIUb9zSA94vYrBb4xy05lVom
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uvtY2JG1FF0vEE4PqJ3UTDWMyNuVnlFl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfXxH1uYrbdpZgu
 5d8AKwBQC9R1OJgrtW7PhdCXon1QtmrSGcxYHTxkryGA1G+2yH7Ggsa/mq0PqLxVLSWYeTaPe3p
 MExFKKbEP4Rhb+C5cqOPRPoqPs2LHylRT0llOAUX01G+yMZDAWzexhSG/KaQE5LBP58HDs9BW2y
 AuUk7X/UMekR+155ZWkcPYvOW86zU/XQcNpa6be3cPhtuxugC9I/nZMn7wUm1nI9G5muw3pmM7/
 Mt/nZa1pYgA+ZPQBv9vWsxAIlYz2Y0qnFoLamXC9QDUKdcK9DPMXL3LN5d7e+owjdx5TDz8y5C1
 wGhnA+/2H74E27opOcTxN78H59iT/KJgSx+ZNhSi9j6TpVvb90BpuEdS28haIZuiXI09d/YHPiP
 gckICJKb8FiZJnN9fBg+tgnI6HXaQmAObu9CXu9KIua7sHEqiVMSNIA1I1mNim5dPQEDjrHx
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829c2e0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=2SZQ9eStiCPzZmF9uL0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: uvtY2JG1FF0vEE4PqJ3UTDWMyNuVnlFl
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

Move several misnamed functions accessing AUX bus to dp_aux.c, further
cleaning up dp_catalog submodule.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 94 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_aux.h     |  7 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c | 75 +----------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  6 ---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  4 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++---
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 7 files changed, 113 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cdcab948ae7086964d9e913dadadacc333f46231..f8ea1754665afa37ff9dbaf3f883d94c48bf07b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -403,7 +403,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 				phy_calibrate(aux->phy);
 		}
 		/* reset aux if link is in connected state */
-		if (msm_dp_catalog_link_is_connected(aux->catalog))
+		if (msm_dp_aux_is_link_connected(msm_dp_aux))
 			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
@@ -591,6 +591,98 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	return ret;
 }
 
+void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	/* Configure REFTIMER and enable it */
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg |= DP_DP_HPD_REFTIMER_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+
+	/* Enable HPD */
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+}
+
+void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg &= ~DP_DP_HPD_REFTIMER_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
+}
+
+void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg |= DP_DP_HPD_INT_MASK;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+		     reg & DP_DP_HPD_INT_MASK);
+}
+
+void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 reg;
+
+	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg &= ~DP_DP_HPD_INT_MASK;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+		     reg & DP_DP_HPD_INT_MASK);
+}
+
+u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	int isr, mask;
+
+	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
+				 (isr & DP_DP_HPD_INT_MASK));
+	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+
+	/*
+	 * We only want to return interrupts that are unmasked to the caller.
+	 * However, the interrupt status field also contains other
+	 * informational bits about the HPD state status, so we only mask
+	 * out the part of the register that tells us about which interrupts
+	 * are pending.
+	 */
+	return isr & (mask | ~DP_DP_HPD_INT_MASK);
+}
+
+u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
+{
+	struct msm_dp_aux_private *aux =
+		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 status;
+
+	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
+	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
+
+	return status;
+}
+
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
 			      bool is_edp)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..624395a41ed0a75ead4826e78d05ca21e8fb8967 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -17,6 +17,13 @@ void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux);
 void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux);
 
+void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux);
+void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux);
+u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
+u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
+
 struct phy;
 struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
 			      struct phy *phy,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7021effc7020073b8b7f633b96286e3996d78d6e..9d6d59264a592cc3ae312b35e51d48c11bd141e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -85,8 +85,8 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, intr_ack |
-			DP_INTERRUPT_STATUS1_MASK);
+	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
 
@@ -106,77 +106,6 @@ void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog,
 	}
 }
 
-void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
-			u32 intr_mask, bool en)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	u32 config = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
-
-	config = (en ? config | intr_mask : config & ~intr_mask);
-
-	drm_dbg_dp(catalog->drm_dev, "intr_mask=%#x config=%#x\n",
-					intr_mask, config);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
-				config & DP_DP_HPD_INT_MASK);
-}
-
-void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
-
-	/* Configure REFTIMER and enable it */
-	reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-
-	/* Enable HPD */
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
-}
-
-void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 reftimer = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
-
-	reftimer &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
-
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
-}
-
-u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-	u32 status;
-
-	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	drm_dbg_dp(catalog->drm_dev, "aux status: %#x\n", status);
-	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
-	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
-
-	return status;
-}
-
-u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog)
-{
-	int isr, mask;
-
-	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
-				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
-
-	/*
-	 * We only want to return interrupts that are unmasked to the caller.
-	 * However, the interrupt status field also contains other
-	 * informational bits about the HPD state status, so we only mask
-	 * out the part of the register that tells us about which interrupts
-	 * are pending.
-	 */
-	return isr & (mask | ~DP_DP_HPD_INT_MASK);
-}
-
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index a7b11fc08ea595aad50f09ca8d49696404514bad..5196188059f3ade2b6cc260ee65a7efb38844664 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -117,12 +117,6 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-void msm_dp_catalog_hpd_config_intr(struct msm_dp_catalog *msm_dp_catalog,
-			u32 intr_mask, bool en);
-void msm_dp_catalog_ctrl_hpd_enable(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_hpd_disable(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_link_is_connected(struct msm_dp_catalog *msm_dp_catalog);
-u32 msm_dp_catalog_hpd_get_intr_status(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_ctrl_get_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_config_psr_interrupt(struct msm_dp_catalog *msm_dp_catalog);
 u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7f676e53d098a11901ef4bcee323d3ea79e53760..97a5f854f8344962c36e67d1cca480c1d5a3ef00 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2206,7 +2206,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
@@ -2231,7 +2231,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed */
-			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux))
 				break;
 
 			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 386c4669c831ebc0d4b567086cde8d818bcdd095..8b79eebe68cb40b7c640c559e8eda400ee1b5f0a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1143,7 +1143,7 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	hpd_isr_status = msm_dp_catalog_hpd_get_intr_status(dp->catalog);
+	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
 
 	if (hpd_isr_status & 0x0F) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
@@ -1358,7 +1358,7 @@ static int msm_dp_pm_runtime_suspend(struct device *dev)
 
 	if (dp->msm_dp_display.is_edp) {
 		msm_dp_display_host_phy_exit(dp);
-		msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
+		msm_dp_aux_hpd_disable(dp->aux);
 	}
 	msm_dp_display_host_deinit(dp);
 
@@ -1379,7 +1379,7 @@ static int msm_dp_pm_runtime_resume(struct device *dev)
 	 */
 	msm_dp_display_host_init(dp);
 	if (dp->msm_dp_display.is_edp) {
-		msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
+		msm_dp_aux_hpd_enable(dp->aux);
 		msm_dp_display_host_phy_init(dp);
 	}
 
@@ -1666,10 +1666,8 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 		return;
 	}
 
-	msm_dp_catalog_ctrl_hpd_enable(dp->catalog);
-
-	/* enable HDP interrupts */
-	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, true);
+	msm_dp_aux_hpd_enable(dp->aux);
+	msm_dp_aux_hpd_intr_enable(dp->aux);
 
 	msm_dp_display->internal_hpd = true;
 	mutex_unlock(&dp->event_mutex);
@@ -1682,9 +1680,9 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 	struct msm_dp_display_private *dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
 	mutex_lock(&dp->event_mutex);
-	/* disable HDP interrupts */
-	msm_dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
-	msm_dp_catalog_ctrl_hpd_disable(dp->catalog);
+
+	msm_dp_aux_hpd_intr_disable(dp->aux);
+	msm_dp_aux_hpd_disable(dp->aux);
 
 	msm_dp_display->internal_hpd = false;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index ce7e710a0ded1fc2703dc16b1fa3bd61d47714cb..7953b09b2fbd5c512ffe7c217b7fce986e4d9262 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -175,7 +175,7 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 	if (!msm_dp_panel->drm_edid) {
 		DRM_ERROR("panel edid read failed\n");
 		/* check edid read fail is due to unplug */
-		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
+		if (!msm_dp_aux_is_link_connected(panel->aux)) {
 			rc = -ETIMEDOUT;
 			goto end;
 		}

-- 
2.39.5

