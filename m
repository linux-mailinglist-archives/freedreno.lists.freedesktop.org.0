Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C2A99A1A
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC41C10E2F3;
	Wed, 23 Apr 2025 21:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfYqH4wF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA010E2F3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:49 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAU2Qs014698
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=; b=cfYqH4wF7EXHHt7B
 FTYAKjigkrBOKB2A9++jxLJP+FAiKW59Cn1ibC20qctTjYdhZXSQTIC34boEaaVn
 0cXkSlrp3eYvQ6U6Oj4cFfLWL3gtFZIcLAzXK6uuLEK99T1V5P5CwjClQmyfBBVx
 nfIvhZLdk2MpUwZxA9hL73nqtFiNaiPfQ13DTZwtvPy90GHH2hfTbGoOwxr2c7mL
 1GtClxIhIby5Zu5X3TK2fgFxUXVZux806oVGAn0JQ8fzq1JiHkqXWBmxZLUwPdtT
 uVEcy+rMYwwdNpsmj9NPWStiBSV3qzg6QcZe5R0fAZGsxJEinahZYjjNBTu/5Tvq
 HQRJjQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e916df0d5dso4980166d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442641; x=1746047441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zG9tzSmSs7vELgPwRjqJOaR0OarGdGoWbRrRUzki/oc=;
 b=n89B3es8NqDWtn1HCN/HCFRLq91hoXNVgErhWITPCqdg6utbCoaruCWrQKQWnnNlwX
 iwotrC5ZOGN10TEgWsshSczKBqxL51AjgrkPMVSrbfpq98hu6BFCHf/UueAGxFB7u61d
 73XNuGeIN9YS1IjIsLeUA7LBpfgfwG8s11kK+DVEbFoGUWKEdPAhDllgNYpj65rNexXS
 9eBmejzqEwWE0+EGqZ6bq5LEBTxkZqkF1/4Ujzhoagy9i9vODsE/3hRqWCXaIYonRK49
 k0GJOl9CvsRzjigKjZbJDFXkD5HiGZ8rieonniofrbj7VdlgAJ3MtqakhzGLrz+FvuIQ
 a1Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTHl9JKVa8TvfRVBP5uJTSmT+l3yla/3GC3BbUbJFR5/s5WBQeUDgcVuzNmayN2hNv+N2QewX78CM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiJwtCJikF0wZlMrA3kAcgxezGSNij4k6yB+9HbdfLOUtpckm3
 ssU8BfG2Jyu2j/KIgJY06v2YY3iyyns/FEH4EmaiJAjmyc1/zxL4o7MOKWoTwwWJVoCXsIRbfyx
 TYqk5JwHwdY6rmM94AMbLrQH24C6EXbl1ww2Qz4fH/EnFajQUSrD2WXe5+ozMWTnSCNI=
X-Gm-Gg: ASbGnctfnUk0nWhb513aYC3Gxk41/xNZ9jNvB4TPSyb6mqgDrTOYbaw1TsqlsLg8LfW
 SewE4GLceuLeGkO5HXGm/B+//RzSbCjdy2zMq3w4x+kB+amLp2vbLvYfW/ZOW9rmFbpyMXn3TAt
 NBQxpirHAqAe39YY13Gw1adY5+zQueZ9eWjVDwvjafWudWMsXVm1PIQquAGqVaDY4jzlBKQUzWG
 jMNQRZxAcKC2+qCqBCKBAy3YeHnw6IO3qN6klzSvpqlrVL5a0rHCZp4But4LODEpBXnmti+3t0n
 WM+s5H4NodCmj/eaRD3QtXdmTQ2lYTTWAHPcfZZ1rM66cIqTAkHRWrj7Es7a0cfVmrtVEkG0Bo2
 suAwfjnZ7osdqaB79U2SMo9wt
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id
 af79cd13be357-7c956f66bfbmr45973285a.42.1745442640825; 
 Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPy+46hZonIHO68S6GxeHeSfyUZSb+0MN0t5zKg7gumhop9jxpqvEslKjNNwpYiIz14V5+Q==
X-Received: by 2002:a05:620a:4694:b0:7c5:4b91:6a41 with SMTP id
 af79cd13be357-7c956f66bfbmr45970485a.42.1745442640448; 
 Wed, 23 Apr 2025 14:10:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:09 +0300
Subject: [PATCH v2 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-13-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcsgHXSRWQsQpb7cjMEJ4q8XMjB7P0NtBHbO
 UmFK5Vs7QuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLAAKCRCLPIo+Aiko
 1TjcB/wIbmuUwTeNRUvW4dGyL85rL8ac8oHysgu2g9gKUuC9oYDQaeqt2enNDmjDMIBWEo1SsZi
 EW61+QeJSzm8t3YnJJHb/fid0qGpMRxeYrAXqP0x9r0bVAiglh3Ye96Yi+VAxggdGX6mNdTqvTo
 kJ2Ra6ZC8wB02tPdfpdskdxRiB8Idwy6b6bE7UILMANizhDQkY1kiuY903XwbSHeArpVTgNNSfq
 E3S68/AKz0I770W25Q6hNohRbaOSfQ6t+Ke+WTxt8RpHpPcrfjTiYkRFLexY/AiFz9V0HJGsOYq
 iZatFbp2AcQTe9swXeDmyoBfg2Mopct6BJPfJvFlkJpqyNf2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aMT7qiPAwRZQCc7SdZNcDQpAx5avvzwW
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095758 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aMT7qiPAwRZQCc7SdZNcDQpAx5avvzwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX4YFxPLSUB9oo
 RRYkuXXmCfuagnlyusZS/DrjR+c7+ECMuakASGXI0MYP/gddYNrooD66zWgqzyeNauZ2FrZCnoH
 cMsdM0IpcYUW9oi8gQssjW0EeXVr7aKDxln2JR29SG0+fo7cg2kW7PQD/cAgRrueVOMYFPyHj8L
 mPmyPO0SRwqxydlgCGR/rJgZ8K7P2LDMV3401olOEZGwbZv6CSHKkFDF/taORotgD+Zd/d1tkZD
 jU0muarmRjgWwd8yC7PUm1H08idiu7ial5FsG9Gds8HVKie3deGuZbYbcCLGRZ8acjoDIQxkhv+
 EymTlMy7DrRetelofgwS1rvwCqiv5m0H059X194IMhDRM93b5r3eabZ0S8uOCvw/FOxPytBe+vj
 r2wGBjhimYJFvTlIhpvYt224X6Nmd+iIhhWNvFpp3KKPdzWWFzQ8S8tuNtL5vLRcL+Qe8kyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

