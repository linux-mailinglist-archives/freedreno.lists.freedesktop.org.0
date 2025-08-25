Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB687B3432D
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 16:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384210E4C9;
	Mon, 25 Aug 2025 14:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Np8PC2BL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82A210E4C9
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8SYrR024522
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=; b=Np8PC2BLCVYephNs
 qV4IlpbJc3c+dR2/fQEQZCPlWA7CaTOYoForXBC0Hu0I7Vzi/lgZ2vqplFic804N
 eFs/LLT8ziQLznkxnCTNGlv/6CWxSeVaJzbdULVet1ITrfSvAztzi6UZAlUyPnc/
 Nz5sckNlLn1cQ6lzH83QO11HLp9ifmuGhq8IjDk7lN5k4uN8ftbvEIx//GwUZCeT
 KuqgBdIz0jDCw2gg/HkzIK+JdRVrJm34AAVsvC6xTSZFHmjfQDaoLTSRYJc9Zihu
 hbbMGLce6rhyMW/O2qNgvKBHFDyCfuxLbKWVnoU86NXMCc4ZDsMSTyZLejUNvDsM
 SA3Y7A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 14:18:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-76e2eb6d2baso8844346b3a.3
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 07:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131522; x=1756736322;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2yrIKVtSgCYOAK2wm3ompeqK3ltVqzQASfDY9soWxg=;
 b=CYgCTBWNtoJqgMKwjzXS8OFh+4GRff/KjCM2oXw9+4w/YBHIIr4rSYTuskMVeVvfK6
 szGGNZATVlsaPqZET0t8ZdprvpWJaBVyKbL1W116SJRo1v5MiqJLl2RTbLYZn9An8f+o
 bIs36+1dtCym9GRS/jReM6wsn3mQPnf7ZJIyb1X5k2IeOL9k7TSBzo/PQ9qJfBrG9r8N
 DkWUJi5kphCJXlNNDVYMg0kk8Kwe3WbqMW44J8v0pzBiinZDP/VcpasOnma2X4mL+Zs/
 yukUu3FFdJzHFlIS2pP0ZJfEgDeLAxrVqBQvWdw681Xntup0JnemMBeVcCqx2od4ME47
 uPJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV3VkoXZf9YOkJEfGohsyzjWqlRIsfGqyz9DHKUwM66u448sta3LmMqppOcqd5VYhN8Tt5J7nUfDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNpRm5wITsGPCSkNqKWtBhr2aPv5zb6RrOFkADVz+JybMElIuW
 wdfJyiBHRyj4OzOknSCH2ULYmGqbnpq8Iw0x36IHeXS4cakSRgs8lVXTTrmeVi+MZas61K4jnqh
 W138iUoi+n0zriE2VkbYmc6aLr6jd6RNm4JDFo1Z9iUBZ+1VHDY7dOKiUiiXHNUwXbXFkpko=
X-Gm-Gg: ASbGncsKr65mAqqduKvUimhz1K1/OuEvKDfKdSKDa196DDBFS4PMaSlTi9j2onuwu1d
 TMWJIPKOdSBFnwMMjpKjB7qyc6d4fCT0i57JWJUUR9sT+mmE2GWgP4XD0XwlMCZd+NZc1lUIf4D
 5v3nyiV3xUfcukCKRtt0pAJBeuBW2SebC0+yssexOBT19ughWvb4expq1hCxENDJEUJKTAhKX0V
 kRGHhLjZ5d7jYMi4AMP2Nm1qGGID/xHxnDjz9Q2hxUIotg6j/t5DUNGZeK/74t8rPFbKL2JwXpL
 18R4AGH+kLB9kd4DQskfK191GGR4DkcGmqx98zYDZYytfjb4nY6gAzBFKl0X5ualmFqBP4Y=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15470403b3a.3.1756131521570; 
 Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdSOkRTXVNCTQDFfDc5W6vzuFdTII0EdHm/SKbunuThNTE+6ampSQ99nwTQsw8BnknCh8P9Q==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-7702fa09144mr15470371b3a.3.1756131521078; 
 Mon, 25 Aug 2025 07:18:41 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:18:40 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:08 +0800
Subject: [PATCH v3 22/38] drm/msm/dp: Always program MST_FIFO_CONSTANT_FILL
 for MST use cases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-22-01faacfcdedd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131422; l=2648;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=PrNjVGA2xHmx5gJIf7BbEQxTGZtpIGlEvLtwzJXOzsM=;
 b=plNGlZvN1wDw5lAaf+a7NON7sJMcGsC0y4yvNqCKHVHUDe4MumXutSydFBwEx12wozakyGBj4
 y65jmFlRYDOCnF6o4Dv23+z8iPBH/fRA0xjNqtFZmKHCOqIzLx0IAKC
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX+hkib83oCTez
 ++8jqMrK1ZTu1bbwKonBhOKZ8KVx5L8Eu3qf6Dp5JArWm4eCLfSlDokwaDQ2bILpZQ8YJurW+j/
 MVVXhka9oZhjRVnu7n4rZLpNuftEi/2g76vZ5pphrVT0C3Bs+sEhYHD5zWDU1fq+7nF+jIuGNzI
 6B6UKaMgBrJ0L8NXNc5qCZ4m4FXWCJxjQDm1OoZ38qnZGmVMWk2kYBMMLLrgrI82ujbGedmU6sd
 CKoFb5/BODAYo31jKxdenSIRMULESLuthbqUB3KO7TZCqAdP31ekglyhymf45u2fynr783ydpWa
 mFBM88S/Cla9YEmvk5QV/a9y1jg85yL2IMW9z4iHx0wgNgTPFw6l3MaxFlXebdLDsASpQF6Q7bo
 mGvTIS32
X-Proofpoint-ORIG-GUID: kXBLJmKOGuMA5Nzipy7TSFrjHKeMMm3x
X-Proofpoint-GUID: kXBLJmKOGuMA5Nzipy7TSFrjHKeMMm3x
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac70c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HaeL3RsyjvW3zFWBFcMA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

As per the hardware programming guide, MST_FIFO_CONSTANT_FILL must
always be programmed when operating in MST mode. This patch ensures
the register is configured accordingly.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_panel.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 58e8c526253f77f306c669d474bdb2d1751b49a5..9f8733da78cea20593b4fd4d4a07583fd17d316b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -693,6 +693,8 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
 
 	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
+
+	msm_dp_panel_mst_async_fifo(msm_dp_panel, ctrl->mst_active);
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f792687c315a2c8203305a20b7290a93b0d791f4..f58cf38a47a119790f86b40ee86d45a3ffbd951f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -694,6 +694,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 	return 0;
 }
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en)
+{
+	struct msm_dp_panel_private *panel;
+
+	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
+
+	if (mst_en)
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x01);
+	else
+		msm_dp_write_pn(panel, MMSS_DP_ASYNC_FIFO_CONFIG, 0x00);
+}
+
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 {
 	struct drm_display_mode *drm_mode;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index cb5bf6c99a6f7a68995f0f0ac48382dc90beca31..715ffc739ac4bec4d41bf4176a04d6651e81bbd4 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -74,6 +74,8 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel);
 void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sdp *vsc_sdp);
 void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_panel_mst_async_fifo(struct msm_dp_panel *msm_dp_panel, bool mst_en);
+
 /**
  * is_link_rate_valid() - validates the link rate
  * @lane_rate: link rate requested by the sink

-- 
2.34.1

