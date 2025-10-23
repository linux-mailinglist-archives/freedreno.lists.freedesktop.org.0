Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE4C014BA
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D6710E8FB;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo4C36Or";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7057310E8C1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fNZN028863
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2+NE/Af1iO8
 IikWgwbLW4+s7TSryYrkY5597Cn42VwI=; b=bo4C36Or2X678XLhHCUndFZMhMz
 yQ25fxDnxRYWsv3Aacu9H0FI4VXgNj/84LJU4ElLmAo6POqapgG9BxJ1gN8K4q/G
 nhqJy9J/XgioGMQCA7cuKw/nmH3OO+luZdHzwbHDa3DExrm09BJ21/nfJFE5ITrG
 C5/tJxmD5dnvsaBpbtRydKhILEn+GnRE5QSBDVh+bkzu/wY0x42mMC3OI4oDZygt
 7IZj7ZlznFefeX/6eiAx+SbammfKZQoYWZfCfpjYn0fhfut0Wmpk9agLI6RbZfuy
 9/SWYRrgSOG6Mw6Qm1UZhh2Kjbs0ZochMAZ4v+mzMXt0oAuJyOZsvafL7+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd5wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-27eca7298d9so14618295ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206121; x=1761810921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+NE/Af1iO8IikWgwbLW4+s7TSryYrkY5597Cn42VwI=;
 b=CBhubwWRxfsH9tImsn6PDcmr/IaXF+GvyQb9B89ft2T9YYzDxLvJTzqeK/3GxAWIBB
 ueZ4O+S6aYKBk9VgZ4V38REzCY0eS1hMcyKMl2NpnrJ6Ruvkrah9MYOc2Z97lXRhUb/r
 HaFtYr/Yj3EYZPNREJ8L+zUfBY2wmfssfZhWxfvuG8OgalSfulQBbfQDxv2lomqSURuQ
 cIbtqE8J+swC7E3dtE1dCaQx6yNZgELQW7xJUX/r0Hb6Oii8Q7EJhm/uHxwQekdE2H2A
 yWClVWd1E4HURXK2qt0iPpDvpTnvaZ9YTJDL0t/vGS2yCzTfwjEqucS5uTRz8eFYETWg
 hvGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2yUadrYyOwahBttpOo0D9ZB94lLLy4t/MK2mwFAcafNwwT6t3FQV0qjt7WAS9Wsivi8oTbEDmsZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9OE76tjnx7VPgVFKUliSkmB3U5NnS2FuN+pH/WD5w1ac6LCEO
 JN2Va52itJ4bRNHuY0luv6stYTnUfVn/5lzimTJHkr2cR4NVfWQEiHydl/Tfw5nghrbyc5EHwYR
 Lo5234nqMDSHMwaLTcLq/Kkax52ZFHX8Dx6wADG4mM2H7s37bpnkV2g4j57n4jucmqGU7kFs=
X-Gm-Gg: ASbGncuMX/duLOnNNliruKF2vkoH5+o+Qncqo3P0q7yAfGsVlznSD4Wrux1nuViX/2W
 /XsdOtyJpTtt9EYzM7V6Gd3nazQ3b1YUUZFczhgfK13oiozzBXLd7Qv27cBuo2eN+5cHFDPdUmM
 bSLWGMmXPZ0HG+Cqg0KlObqghhoM1W8PAyv/sHtV12eId5w3lZ1Kp772Kmml5jCgd5IsTOu4Qsk
 pJZf2HD1xdly1I1vi3B9AupP2Yc16Lw9xGq7HAhZhtDl2ivfAAYlhixfuiqXdmlOQ2W8AIt7gIG
 BhrkbBdnV/vnHZnC8zpK/vrT5FetQ2JJc5r6EeWWlN1VU3yplwgrB0uKPbYG9mC1tsLptPbIHiL
 YPDoTa4zxE7hcDhyl0c1S9BQI0yNTVaDqVutMtfeDQ+zVODjijw==
X-Received: by 2002:a17:903:1c3:b0:26f:7db2:3e1e with SMTP id
 d9443c01a7336-290cbc3efc4mr334314365ad.47.1761206121118; 
 Thu, 23 Oct 2025 00:55:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ9mxG0mQE4e2d0wtdtC0Pzf4q1nK4RIrpRbfpCU1mVr5UFw6tRXlVqC8ZjctkbkmykKWyhA==
X-Received: by 2002:a17:903:1c3:b0:26f:7db2:3e1e with SMTP id
 d9443c01a7336-290cbc3efc4mr334313815ad.47.1761206120651; 
 Thu, 23 Oct 2025 00:55:20 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:20 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Date: Thu, 23 Oct 2025 15:53:52 +0800
Message-Id: <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: M9Sehv8-tAqH0qhFjrn6SRJ2sT6_0W7b
X-Proofpoint-GUID: M9Sehv8-tAqH0qhFjrn6SRJ2sT6_0W7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX1j+BxtpZK8YF
 QMpFA5PfUmQN82UFmcC2bvV7G3gCfnTg7Pfv+jhO9SAtc12WPRb6lbaVbZWGmG9xHfER+ejyL/k
 umSqHWlWzydTAXwOT/jmBmt71w+25jBV9e9m6VGOCsakVmuVxk+4tz999VHVmbLIK9mDKL4st7O
 11fXLt3hpxVE+6tW6FAcy6qf1N6GfQ9bEe2yL5FBZcdAI8HJXYFk65xPwhWRcUHF+FJd8ak7Rnh
 4Odtm3xuTSynoddH/JcHfXO2dI42FgU3Q6M84xU3b40dZAY6D9A8YymCRgFKz6R3xxVF4RCH14y
 YhKJGRs/E8cxZ4bNRQsKHLWM1Xw6vmxfzJJNlYyrvavW9HK3wqhILh3Mmx5oiODTXIe5vlhyqZ5
 WObOhMGxyq564jVD6L6+m7gQSRsLZQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9df6a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=53IYeV4kbo9ohMI6A7gA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

DPU version 13 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..8d265581f6ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
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

