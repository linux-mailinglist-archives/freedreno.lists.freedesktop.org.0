Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D7B486F9
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEC310E415;
	Mon,  8 Sep 2025 08:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqgU229t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52D10E415
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:27:50 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MuF37005773
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=; b=nqgU229tcFj8ljF9
 nUifj4avGfh7JDdoMTPeFRsPolELSloHpT+VVWbsJilpefCLQztprAAp7vNeJZU9
 alHYzaRcUdEBLhJ1i5Qy8DZQBWs03vGpmbNiUV+1OkRk/xUiAOyl0FYxmaywt+Zp
 J/S2tlXWDxhgna2sfAm0FG+FmZ0gtkT4DWBgZ3O46T+BflchZMnlv3YrnhkdqYRK
 dpx+ROt7RNiZ3HEWKmiWIfd76pMh6Q7qO9dIypQzsEwB7GSzeNVukbu6/P13NPLm
 WEzYyB9XzXTikWdQKyR/6e9pQMWhQgwTH7JiigsaJZ7DjAk5eYhoBAytytNi4yc0
 7iNOQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uw3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:27:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7742e89771eso1651055b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320068; x=1757924868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1nUyUpKi7e4ePG1N5pB+4o6pcKvcsMs745pR85FFLuM=;
 b=AdG2VrLpgju5BT2tpj6NtydsuxNo9fYNYVDyoNmytiUWka9wwdNB5X1Gn568B/dB9V
 XqiBp0+HKelSCWjyOvPACDe/z1R6XfD1hLepJp/FIORgjcShvyJg2/WvKVFXEXeSGEOr
 OvntKCxQI7Amw1KBYlctYis8AXkbhHpKfrciRkPRThVBG6OyGxk+RjpAAmWKAtXSog2b
 jh9tO2GcI7W0j9kffafVJYYaYZ1wXqQAjo8m9MKcZLbABgf0jM9hKGC+mVpfzJ+r5a8E
 mFwcE0fBw1cILZb6P941yXRALXwL16wKo+n+rhsQp+QEsc0TDrx3JyVxcZFEzdzzbFR8
 CuIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw8rK36/srOJW+9gMKkIEvMQwDn6pJalF5O9r4XbpueLYIzeCA+ysug26Juxz9uzxvLaXrujCAL5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyiMhDbisO+vBt8j3FnHspeg0R1eRSQuHGEzx+4/mTP+gtGFD6
 S7QNOcNYqHSsOJX8VY1Pwc/fkTczTdeTQwUeVEQVv6SLbH3W6F1k5itNshRglpccmt605oVm0ok
 0CDuvb5JePKN82azwPpGlkJ06K13ws/PMF42oY58u6vW+lrnlehRONZ2xi7T+9kHBwsgLCJkbrj
 FZ+D4=
X-Gm-Gg: ASbGncsDAQjLOo+thsw45NsH/sYxy/seiTn13mcISdHgMGwc7Wuna67UbdWJu+vU4P6
 IVoa5v/FiPTaK6rFn/BwUf8UnwUgV7Tav+zGmlF1tT4d/6JMTXIvCgOhvZDECQOxHPJqJHSuIfk
 CVpCXJqGZ5dm07oz+iQvpv304JwgEwB4pqk2sqKBnKyFdim0Cnk3WrXbtG/EfoYopdn5mJNx8If
 e+qkEnYKHwzYZwmtXJY/nKHmHp1OFVfca4mkY0Wq8d4A6mtCY7eSjWNootsRZiAt6vQkqNAiRB4
 aKRHq1vitKt+MU0cn1wpkFxwOscgsR5dT+B1w+SeBQN7cgsT21Q8M5BdMZBQT/oS
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id
 d2e1a72fcca58-7742e4744e3mr8523401b3a.9.1757320068388; 
 Mon, 08 Sep 2025 01:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVjuJK/G+P4YvXM69DGczHhw72zFeO7sf37Efafvi/Vxh1TICLvoz+DFmTAkwbSZSkIWwwyA==
X-Received: by 2002:a05:6a00:140d:b0:772:7b9b:b1b6 with SMTP id
 d2e1a72fcca58-7742e4744e3mr8523381b3a.9.1757320067910; 
 Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:27:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:59 +0530
Subject: [PATCH v2 06/16] drm/msm: Add an ftrace for gpu register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-6-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2909;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=YQ2FW8mrQywbHukXvi9BRZ8Zf2lAQF8Asu7HWpVsQ6w=;
 b=FnEKqw7xBdZgbmj77T8HCgPsmNDKyxAmJ3IKiWW8PFY/RpSu7S3o7rVgi8HfZRBx2G/WFi4M5
 P08U8MzeCGKBhSzx7qW04sC7hddFrieB7QxtnW1+nsqpzBIt+J7Mew4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be9385 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=exQ2vEUdbx4SU7VtH2AA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qVY-rGsoPrLKOoa42pO8GA8niORboZlO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxgD9sz9lE4Lp
 eB3cAR6QiJqFWKAOJHf+VwD3iBzjeaD+3QPj7i4qSQqFU4wjDHUhntA50bgeHyVK7aQOYSGiNW3
 mDCsLn3RxKT+AoFMohq4eBLhLOMtCEYsXSZZG6EaUn9VUBNIV1FFNKvm+jyl6VXffwh16DMCB7w
 aMvTrba6AMB9+m76jeW5qwBH5Vuyy9DeCOnA/yz+/7ma+N6Y/uIbgwfSnYc2i/La2G2n9qvc+xu
 fwidprVs2zjG3YExeHBCPJaOdwayjSRSzCWy0i4ZP86tqm6NjggPuJMisLwick4rX+gT9APNLHx
 WrviltKQR/WXqBl+CHBDXbDaAWQ9OmLWu3AQ7sUTLc1d4S5iHYjet4RH5yENmPHACAxeakbrZGe
 k1mfUBWK
X-Proofpoint-ORIG-GUID: qVY-rGsoPrLKOoa42pO8GA8niORboZlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

With IFPC, there is a probability of accessing a GX domain register when
it is collapsed, which leads to gmu fence errors. To debug this, we need
to trace every gpu register accesses and identify the one just before a
gmu fence error. So, add an ftrace to track all gpu register accesses.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h       |  8 ++++++++
 drivers/gpu/drm/msm/msm_gpu_trace.h | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index b2a96544f92a55cdb372729498b8f0b0f9ca80bd..866bb090af064666586cea7125254bd375b7a35c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -16,6 +16,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu_trace.h"
 #include "msm_ringbuffer.h"
 #include "msm_gem.h"
 
@@ -613,16 +614,19 @@ struct msm_gpu_state {
 
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
+	trace_msm_gpu_regaccess(reg);
 	writel(data, gpu->mmio + (reg << 2));
 }
 
 static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
 {
+	trace_msm_gpu_regaccess(reg);
 	return readl(gpu->mmio + (reg << 2));
 }
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)
 {
+	trace_msm_gpu_regaccess(reg);
 	msm_rmw(gpu->mmio + (reg << 2), mask, or);
 }
 
@@ -644,7 +648,9 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
+	trace_msm_gpu_regaccess(reg);
 	val = (u64) readl(gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
@@ -652,8 +658,10 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
+	trace_msm_gpu_regaccess(reg);
 	/* Why not a writeq here? Read the screed above */
 	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 781bbe5540bde6d9cd6758050229fd0406fad232..5417f8d389a370e8d0b9c7e447050e2965011c0a 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -219,6 +219,18 @@ TRACE_EVENT(msm_mmu_prealloc_cleanup,
 		TP_printk("count=%u, remaining=%u", __entry->count, __entry->remaining)
 );
 
+TRACE_EVENT(msm_gpu_regaccess,
+		TP_PROTO(u32 offset),
+		TP_ARGS(offset),
+		TP_STRUCT__entry(
+			__field(u32, offset)
+			),
+		TP_fast_assign(
+			__entry->offset = offset;
+			),
+		TP_printk("offset=0x%x", __entry->offset)
+);
+
 #endif
 
 #undef TRACE_INCLUDE_PATH

-- 
2.50.1

