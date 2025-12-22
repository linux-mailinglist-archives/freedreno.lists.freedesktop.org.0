Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C779BCD590B
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6CE10E62B;
	Mon, 22 Dec 2025 10:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ex191p/q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCswXKEL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2F10E620
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM807iO3864031
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I87OukHNOgS
 eTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=; b=Ex191p/ql16sewZtIMwT6/qtmAE
 SlWM3WJB+jiBt8d0ojnVDpYcUPrEcHAzCQOuwSwINV2BMyDNTnToHRlU/lT2ytnZ
 4L7SdLpUuuK6++6NKqoO+Q86YAkGK8zw08YK8HJ8/kUvZZk/6l3nVg3rwHDmXuWC
 cBW/xvaZY3KliFmW5F2k+x4IM2HEovCYIcznts9/KTETyOzEzB2pId26XJenQWcE
 eqc4t6CcjacN/hOS9GaPt5yvKzD0QVMPVfvfgOR3QxLVITOP0CklFlhYh9kIJkeA
 oSoh1o0fK/Ep+sFNiQMwIy4ggd7b+b53og5QUDr7KkB1v5iu3xZ1KPphGMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4ndq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed782d4c7dso66135661cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399121; x=1767003921;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=UCswXKELsMrz5Ft/LGJ6TZsS+5Ho+8h4nbsnhqRCf5Ob86Y+byxKC3OZqa6LfLp5rA
 XTdW4AYkH8ARXzsEmcYDYFU264W9JnqY0kJgmrk9brKrmQ55e+q2fzUzFImVxfVFtHTy
 uvT+f4cGH3tLQGq28Ss04UP5ywDKh5WXdHGciVpixFJ74QfJV3HLFXuQkytvf/GnM3+3
 EaDrzlCwkiL18HKIncMZCzcGu86c5ZN4L2qArY6C62b1KYQnnUfYzO8lMJCQbUNdlXmf
 kA+zj2dHMBFTiyBlafWrtO9zLYxc2x5UONAqhlp8JIBJxCIHi0zZvg12ivLKggQlWL+U
 K0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399121; x=1767003921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I87OukHNOgSeTgoOXQALSi1N6P0XQunpMCBrwQ4g5NU=;
 b=pOkoUY0bm9l/dP8/nS/g1EYADC54105T+vK8b5JB/jeR7++RLRONaO9mDq6ltjEAP8
 mJrPbLjoVmMd1Hq7qOcfiPjxTZVSH00/hcvZ9y0m0oBtV+c/EmiOPlU6WeAhduhMGWcE
 d6Rg1rf4C33/NelmODZcyTkJfwPYeow2Z9/chYP4c2NgRBmmm+1X1a3v9tFohxBxQo6n
 TbEVWw79S/RamyslksCrdXVjqV7+fJPfKgFWDoCI7xH2eMfCdFWlc7OI2r21I7+DBpnY
 sS8tPIS9SV223P1FiwX/rCexfW7uFvEtqh1SDRqavdPJOiLrncInYa2CftCAtuYmhfzc
 x0Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDFjUDBi14ozXfoBItgJooO7xxWPxAL/ImqOMr5TbnC2egACsPncUHuxx9Hn1f3c/CaPexvx3e7/g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx45HVM5lgkZ8oWTohKsILoHhEv0FFHh9O7vj3wuuvGml4xtLua
 N7XolrBU9jiGaivKhgt5g7tGV2uzGwq71EROTj0A+yTSOKRNxlLfJEGjzw4DjCWdDmISGpfl5gE
 lrmMlH8ENMzFj0W5wfzaUE5UnmkLt0BZixRvRtg79/0l16hB/EijdHb3DKRI/Xr6PvOs6OP4=
X-Gm-Gg: AY/fxX7A4Py1UAnIWo+t+a2Gd4ED+1TM7QaibfJeoqORvhFoYnM/aOjtY2prO4XrpsS
 j4hAKF8kEGBfQD4pM4KkTMDH4kKIcLjnYZyI+RibDNu51mZhpo5ti+CqFefVgZkDnilzJ8jiQ+D
 20nMDArB5KzEbxIj/aF6/7D+BVtDPvx9zjkJY243E7vI32mqfLuElVf6orTiwJBDLovRbeiVu9S
 BSRh3CDz2a/PGbtnRjQBeXhZF+QF7yVRDESGGzi2oC113xgAZXv2Bc9myeeYoIAVFfETc8PMNWd
 JPYOhQI5lxUF5i2dCRvM2z4d8xbMejB+6b8GlzeiJ24A9ukOXOCdWGuM8S+SxkavoZBvZKzsrXh
 u9LkJeoYcGg0XhP2//4rjdfbR5zuFTXgRlgn+nKg2iSvgj39LHkmQYzDA8SuJPblVTiw=
X-Received: by 2002:ac8:6edd:0:b0:4ee:4a3a:bd11 with SMTP id
 d75a77b69052e-4f4abdb8679mr122548341cf.64.1766399120771; 
 Mon, 22 Dec 2025 02:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHv+prSihqvnWffihQ2+hcTUK9zU4sicwbepF1PbdZj8C/G0OYU4yxIBNqszK6WrFCBp1Z2gA==
X-Received: by 2002:ac8:6edd:0:b0:4ee:4a3a:bd11 with SMTP id
 d75a77b69052e-4f4abdb8679mr122548071cf.64.1766399120369; 
 Mon, 22 Dec 2025 02:25:20 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:25:20 -0800 (PST)
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
Subject: [PATCH v4 08/11] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Mon, 22 Dec 2025 18:23:57 +0800
Message-Id: <20251222102400.1109-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX6TAeCZhBOEzt
 fzMpae7AmpGuUJr3Vs00vn0HKrB9DNLOFXKuC8//LiHoB5V+atvLVLprSpYSmDPFwMcd+GIl2XV
 4lzc+6oWU/wuxOExXMu7ua89m2pbvIu33mO3uh6LBMfRo8NvSDPocSmsl3IHH7zACBYb08C8mn6
 EruxH57ul7ro2Jmgs2Y0qUIudhQBVLmIjTTcIExE04bkkRhWLoHroW2/aPOUzyimKtp0wafteK0
 3T6jogEs1xd/bpEjAqqavV/3Fas6KiaBk8dYKhx0Ad0rIHD3KxCqD9XOxD3P/jb0P9CltQmMTDf
 1ki4E2/1wKhyO+6N7s2QVdlXelnFGJFT/EaFd+FYwL9I7UsQ/LLfiF7j6EHuccyWIVd38+WHZTx
 3yfuWlx+sihBREkHwExb6DIvG5vTAgFvxJCFwrTb/G/FQvLfi7Pk0RjzVt3misKhd7sj/Q8oeBv
 3Zp6r+jy29TDj1QGlRw==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69491c91 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KeilgoeeRum-9NJrS-9lpHMpstdXbDUo
X-Proofpoint-GUID: KeilgoeeRum-9NJrS-9lpHMpstdXbDUo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094
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

