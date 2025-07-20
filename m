Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 870C0B0B5DD
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6141410E373;
	Sun, 20 Jul 2025 12:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1lNwsmu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C5110E366
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7uh0G010985
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dR6sJoRx42AUBHrEb7MmdRjO9rtN5rgEN4p3npPlmaw=; b=o1lNwsmubhRzA/MS
 hLpfMpaha9gGnARu5/Cv1lRhRzNcttZd6Ik6Bn/kWu3M6Z0AUOG5VFUqbc3c0qUA
 A+rw9X/j1xSQyPk/EJsuKd5bBCuK6tum5yE7l4XSNKXKY7dAFpsrGwnEbiuihZ64
 XzpW8FrCD9Ys5vrn682IM3qIkeskpQYLVFBqMTHzcJbQOqI21s8xARLalmo/jPCu
 fqii/qScMLpBrPFT7MA+C8PncqWcFuAi2hjwMs/y/bkoZ4Gm85RL6EPYN8oSpSpK
 I+1ZfnkdvxI/xq4kOrgUABR+urkbj31XwrodsN/u1x1AAV5ZuL1GSy3ebMUNRWSn
 8RuHTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74b4d2f67d5so3050546b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013835; x=1753618635;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dR6sJoRx42AUBHrEb7MmdRjO9rtN5rgEN4p3npPlmaw=;
 b=PCrO4uiliA2c5Xqwngdc8+UrxvKTJEuoDbcd30NOtCblPorgkhtCvYeMKoTBc5T1zQ
 TlDyqAmzXksd12kvl0uYoILq9+8HGDiOTpP2RfDMM1HCKlT1q2nE73r+bznvjrLR7COB
 j51LOyY3WkfWUFTRvWh/7IREF5ASwpVP7zANrCqKaSi/ELBG9kiAu35ifiv2b1pyS8Gk
 hBEklC/0uF4/jDPwiMKAfdt8kU7lJ73NGLVnG2Y2FwXgRDwVC2D/IHEqt3ZjumuIGWkM
 0sHjULsL/rIQ1qPgaBjdetRPJv6t+EvkVU65z9g2bCguwvRQRKHUF9zXqxnOIEYCmrtK
 4Hsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUacj5zGm7bkFN/d6ljiygjIUNO7Mds/WcB3FlXFRX873VTB0fFc2AytcKv9m4+gGmv2WbKu6M72Mc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpN/Y1h+GleY3EInsoTCstlETs1RfSCnfKJ59+CYZswIq99lMK
 DFmyzSzmGZN9TcwITE2rwC1YL0Q2UIJyIbqtRftyBJHZp7FzP8F8Tf5InebCUK4jduCvQJspnyM
 QOVc8PO5dBlK3pYA6bErYUoglwjD0WaIpkzSx/JU0R+dDebHBHlJR9u61dev35C0cVCvD9S4=
X-Gm-Gg: ASbGncuf+A7c5Th5jlbd08vzPMGSXdxv0SGRsKKMnMOa/P8YeMBfk7GUdAll1FgJlyq
 jbPxQJqJ973Hp1feZFIBpFSvdSci45B6B0Jpc1rkNMcQB8ZIMiCatoBZM0aYOilG77EDjNIR7fu
 fayR9t+IIiuiRi62wC+RGsNe7I8UI2Odhd2Tnu9kGI0l/qIfk76plKJrK0LOWRQ84f8qu+sRKxa
 GSXAJheIO7RZRQTwY3vLvMd1U48T8bkP1HzeTl1h+HCOl2XDiBq5enl7GU5cFYgceyVA8ctr60M
 6kN2wvm5FPzWQ6QVaLwST2tXewEN1P5okB6YLbiKRpQRTiZh9YCgrELqwSOsJoMv
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12673886b3a.21.1753013834634; 
 Sun, 20 Jul 2025 05:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcUStfPYDQTBrk5cKGxg9YMZv8SDo8dk5ZyQbi7KZdgKDGTRDIDq4rMokvtBoMwA8YBTbBSA==
X-Received: by 2002:aa7:88cd:0:b0:736:50d1:fc84 with SMTP id
 d2e1a72fcca58-759adede58fmr12673847b3a.21.1753013834116; 
 Sun, 20 Jul 2025 05:17:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:07 +0530
Subject: [PATCH 06/17] drm/msm: Add an ftrace for gpu register access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-6-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2882;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Bix42dg0qNYgpzOcauSDsSEviuQA7o0gZ10lc64yFRA=;
 b=YDcbRCw8zDNRVcb9x3+mPngvXNp74oc1PZwPDltZ9H3uAEhptH18/Sp1nZ5fWdZhqFXz7Nxce
 p70pMJfYquPADo46uV6P3ZE8srdpoHJ6xSt6JO7r5zRcvJ9CNUbWZb9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 3JSSgFj2fqOcUQl9b-5YZLOROrPu5og3
X-Proofpoint-ORIG-GUID: 3JSSgFj2fqOcUQl9b-5YZLOROrPu5og3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfXyBrU04wX0fvV
 g69tFxa7qSP5XxIWJrBbgi7CEeZiSgpst6IaEHzInaiD4ubPhdNhZfW2Bs7tINUmQQJcJeiujm6
 AVtsVPTptVm0zRjWr8gIatcZIpV08MAt/lKFCGiQPBGIzMhqFQr1vAxUNLTELTx7OSWPFyGW0Tb
 kXFg8Cj3uEVVsMPbJVtWQ8VXDFj94XZU15WWsJCMeZKTgcyyp1bTCmwh1qQq8UGTF1BoAMJKJsV
 WknJ6s/eOsKtuY4Hj7gWloC05VBejXzWUT2yNYwvdZbz6qGBhmQ+iAqaobu0j8ktZdnpo6zc/LD
 ccVVMO94+IWlP2eT4XhhY3Er/953k2yBl2Rit2S6lhTZlzP2OeEdCoIBGe3ED9Woos1nHi7E2LK
 mn35TXdXhY6ZRqciQKELFJ/F+96IJ9bO+8Gj7Ce1oHFg13Ek3+HGYI5deNMJPizWO04XX7fh
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde4b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=exQ2vEUdbx4SU7VtH2AA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200117
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
index 5bf7cd985b9c50e38468fed695234f787919a8aa..a0a0cf9efb3a8035a80cbbbf30ad294a72ccbd48 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -16,6 +16,7 @@
 
 #include "msm_drv.h"
 #include "msm_fence.h"
+#include "msm_gpu_trace.h"
 #include "msm_ringbuffer.h"
 #include "msm_gem.h"
 
@@ -555,16 +556,19 @@ struct msm_gpu_state {
 
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
 
@@ -586,7 +590,9 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 	 * when the lo is read, so make sure to read the lo first to trigger
 	 * that
 	 */
+	trace_msm_gpu_regaccess(reg);
 	val = (u64) readl(gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	val |= ((u64) readl(gpu->mmio + ((reg + 1) << 2)) << 32);
 
 	return val;
@@ -594,8 +600,10 @@ static inline u64 gpu_read64(struct msm_gpu *gpu, u32 reg)
 
 static inline void gpu_write64(struct msm_gpu *gpu, u32 reg, u64 val)
 {
+	trace_msm_gpu_regaccess(reg);
 	/* Why not a writeq here? Read the screed above */
 	writel(lower_32_bits(val), gpu->mmio + (reg << 2));
+	trace_msm_gpu_regaccess(reg+1);
 	writel(upper_32_bits(val), gpu->mmio + ((reg + 1) << 2));
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu_trace.h b/drivers/gpu/drm/msm/msm_gpu_trace.h
index 7f863282db0d7812c8fd53b3f1fc0cd5635028ba..193dc9c8a7705c8988b8c4b60aa78a74e00af932 100644
--- a/drivers/gpu/drm/msm/msm_gpu_trace.h
+++ b/drivers/gpu/drm/msm/msm_gpu_trace.h
@@ -205,6 +205,18 @@ TRACE_EVENT(msm_gpu_preemption_irq,
 		TP_printk("preempted to %u", __entry->ring_id)
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

