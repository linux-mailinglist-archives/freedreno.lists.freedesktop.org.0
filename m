Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D10D01B25
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1510E6B6;
	Thu,  8 Jan 2026 08:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgyO5cpL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWLqHbOB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548BB10E6B6
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:35 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087VNVw1837902
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
 eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=EgyO5cpLCmQJtQc+ko+psolgag/
 M2vuNo6IauR1zeaA6kYPYLp2Q2nwQeid6mjhEaYQHvDr1hLjb9fwZv569AcmpHEF
 PFvUDJN+5J3RDHVFQ9sEoAQ/gZK26aZz7p+MxlFwcr86RsI8YsPgEc1iKqxc/uM8
 aQIubd3N4+dCAJDEaT/U9bmUyq9U5tflRFZipJf5aA3Ip2r/CgJg8AlpDIdJdDvc
 frNhdSC2dWGB7YkaliQrjzDDVSp72+vaRpdp9NZlNjFJPi2d5HG6Zz/XvBh8T5ho
 B5WxgrgGa/VTR9+dnN085pze1P48aPtK11QcqIx7MsjjF3d5K2EDCpl03gQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj892081n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b51396f3efso566543585a.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862713; x=1768467513;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=DWLqHbOB6yHdruyR7MBoGCEynPEY09X8qnLZGQjzsbTdqibZeQscuqULuN/S5HzNPL
 1u7bISx+F6sxa4IP4roKOAYMID1mF9wCFSnCUDuwjNFrA4h/rReNvjxDBChPM/kwd/gQ
 qizT0pyy7DTe5PwpcTdzwi5qzEpZ1fncI0sgDSR4Jp0gDvo1ECHMwBCgwVu0EwyxnuyB
 pbTnOikiPn3ESht91kxNkylOl94HRoXN7nahN1Zhk+UxMok8F9yI5ohAqRIOj1RxQfG+
 giKKntLZ+eT0jjCOjksJn7zq0Buk4bvfX+lOWhZLZ0j9dCwdneRgRQC3Yo9UNTv0klvn
 BAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862713; x=1768467513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=DtLAcjAHnFu/fli4CIYZD8eeG/nl7CWdOlcL92t18M3VtwifdXY2xOz+ww1WmujtTw
 ACCiDxe2TyUyxEczjq3S9AeMJ47mUFX4ooOEuaNXBpTrqvc5UMrvkcPzP7QDF5t33yCJ
 GvTv3MBo+5Z4vj5k+Py7x7UuBIG6JiooFeasBdh4oYobRj4mxhnPQxJloi/akA/cE8EQ
 uaVSvwq1RKmThs89RcxkWn7wprMCrc8KoyNApLfhdK5ejLMhHTxw2uzeNMqMIQrRQyrh
 Qn8l5G1l7/DP0+idNXzI93f4jPfZ8/fJ1bQYuSqkfZ3Ai40p/C0nxSKJYUNAYvO+saeM
 ymog==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL+iZ5Ymj009uBty15kJYbhe5fyTJqQrtUNXisLqBzGoTrP4LNeflw7D8K5+Ud0rSN8KAt23MDuvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAs7zrAXVHPNYRa4dDp4aiE23J6uAcoWnoMEv0gUo4+3psGgY/
 UBLY6hEv//z3BzhfFrFrxH3ytynI/17DPMgLhFixJkcSAxgEfnit85Weyqd+PP10Crd/9nbGswP
 0nyhzLa/qrAPs4hV4rErwlKMBMFSNdc74Vqwv9bhaHm0YoD1DqVbncUdoqeRgIfcgcVhT37s=
X-Gm-Gg: AY/fxX61yyEZnW6TD57A3hyzhDp5iY79R+1I42h94RsQR6Skydldgehwd+HJrMeIk6s
 Z6BAgoIUHVAzNjMIZP6lUFXsmJUKXirc4nT3Kv0LhFnDcZXcTU2UQCnxz1btSWX/Y5P1YPrcWgO
 gVscKFr20dnvAiujPK/mK0gY/CA6U7u9oFZ8vKR8LW0Zj15hBqUHBx98cdK+Jjyae/57hZ/4TzR
 onHi4xrLPQ12U14UKiy1JW4/p+pfyj7rgtxZmja5t5XhytwYIl1ni+DUO2wlCFeMSGUxOyCSfZc
 qvXuR/x4U5X8MbvzGArL+s4ejIGrjXtTvfgQerI5/SvyeBk/die+DpkSUU1em/dCKhhNyze46n2
 DozM39Gf2wLxH8/mXt/9AS6rjJClbFCkktxDXyM+OBTBS2avZGTDEoJHToyMwNgf8+Mk=
X-Received: by 2002:a05:620a:4041:b0:89f:4306:2a50 with SMTP id
 af79cd13be357-8c3893dca8bmr714701785a.42.1767862713554; 
 Thu, 08 Jan 2026 00:58:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfxm2xgH03Bu5IXbZUM440zcT0kVGZx2cBef6lPp0OA3bAIQjoWiw52T8xxLeMMMV86G9Nhg==
X-Received: by 2002:a05:620a:4041:b0:89f:4306:2a50 with SMTP id
 af79cd13be357-8c3893dca8bmr714699485a.42.1767862713159; 
 Thu, 08 Jan 2026 00:58:33 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Thu,  8 Jan 2026 16:56:55 +0800
Message-Id: <20260108085659.790-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f71ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: w3GSF52DcbdiJMVo8alTK5zs4Cdfq-BE
X-Proofpoint-GUID: w3GSF52DcbdiJMVo8alTK5zs4Cdfq-BE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX3TxT+dZMck5z
 cDTE/rnyHvPMtX9pbuv0c3Ui3ndkigH1TQidVJ2yuNccBBfM9I/S0pLa9xMMWhlldKlWtxO5dvc
 B5dxYTmT2jDmjPS5jeLyJ61emHgoTdnm8QH7K3xFJL3IuVgIwbgyQpiyAcXMSqOO0xOTfNvJF+v
 NN6TCY0t/UHGylDTcCHorUgJIISGCH0EZIAcm8rU3394KAwpF8hDXJt+NCMAgB8sHvMEy/YjsJu
 DTeozuJ0FMX8f89zc4t3Ipykhcv6n9LetpTdmngfnmkFWBHoVQ9l3kSuntgE4pxuTctZSD0Ejus
 Buu2HwN25x2stfCJIB+6dszw+1R8z+VpIJCNceCEaPiVGnp/2WKhtsrRt30z4Qjb5PlvQ4MtUi5
 Sq393AGTS1jKDRt23i0QLseKpE84FQgwaUL3bPJbx6ZPvbSkBWS4qG/0RbxU5+Qq8qUfNP3CxAN
 fe5RhtoJlnFLXltd3nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1

