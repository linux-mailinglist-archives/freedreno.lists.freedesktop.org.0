Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7434ABC3B5
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9CE10E392;
	Mon, 19 May 2025 16:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="grqgZ2fF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E4710E392
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:20 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFkMgE023215
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=; b=grqgZ2fFQ9BTdgqv
 yCZh6AL7rJj+RInWywzUr/B2eIKUI+OtTXjAbpiKxSG4DjW67IXaoiXdRP3Nqjmo
 8Bt4N2yzjYWY1yExF4ajwKmphNSFaCDpAoFhiVLf3B+En52caYR4MSyQsxsPHtb4
 gN9yJRQVM7+tXlHt/JvOys5LOgp7wUokyrDLd/sK7K1GN7jdwn9jKIR+w945iA18
 g38J0RmIop2JuqzvP1thKIoKqnczIueyoAVmadeCDiOET9w0UrSkvHeUqGQyeYbt
 IS7/06FZKSIDfIdUEytVdcfYQP+ojeOzOzfM1HfQ64s+/1+NN7pB2leZ1LI8ttVX
 0ZSQfA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041sg47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:05:17 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-401c6b8b66fso4435671b6e.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670717; x=1748275517;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YsTiHmb7isyOGDE8/KruduhKbyDLygH1h/oqB0G8slw=;
 b=pDczLMTjpf1UNHFgOmNgW967Peejc7S5oPjSgq9kd1X7VRYWx8XBX4Fu8Ls9XCe/al
 0TX8P6UUFTFdsHQq+e+Ss9N73Nq5NkaVGIGTEqAls3qNYzMGly75pTHSTvZWxnHQNcbu
 rV5SWofJRNnFHCEUGKIoqNcn58pa5JKc8j0jP5DzswrD3Wp89fMDmsRK8464HSHd9Ba7
 iQyPLAQHZuTHe8jn+ax6WKhbTJszIokpxrWL7LrrNV0YFgU3rOanUoa7SyHRyRdqY67S
 xQ4VlPOfB1BpclY8iyvdRgKQV++8AF7cOBCqtFC9u8Rwu6AKp/8sItigxGwnK3PBHv5c
 5IzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW35TglY5gX5Mk70YHHwRIAoS51eqmlLPcK1CthekLjos07pxclTu5/eEuNT/7HIF62VrZVKXPHOpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPYhcwmm7sUOTxu4poh+qKGLu6rC31SsnsZgrV717sS25wMYMO
 3o/+VnrvYY1aApcTKXTyLt3lpEi1B+UAbJrRSZR7bWQozkrK28gYGRM9qxvSESrCG5VoYo2wCms
 ZfGDk0QfiqK1UDfb08m+ha5kxU0+Renb3XZ9snwkcoQlSa+ThYlniKVpeHlDw8o///+8fpwI=
X-Gm-Gg: ASbGncs9C2UGTa0fVBpCaBGizLOn9aHZnR96Yq023fHd8CXP84jpc0ZTv0/tpxDU+V9
 tXmTScKsSb3pNRtJf1/Th1POPyleouvlorivPklDXphWtIungN3t+JcuDHsf/Afjy2s9yj2nRZL
 V0eP458bQr9fHywciRoT17YbpzZ3WIzM/2AavM2hBr/CdEREiMgA7Nsqfa8GoCGnaOwWLYjZ/Ml
 /uVMnY9Z0SYzian7WFfgxvf59lu0+sRIQg73psrlWLg3RSnhhirHe7RiGrInQptbFrok6EWmYcR
 kQ+xYOv9dqS0IqQLmgXedoG/qEXgIwr/1rNgQn99PxZerc7JQKwDSwmYtQDH7RZRBfWyQXeaxyu
 7LnZ6hKSCtZcWMWcfWfvKtRHo
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id
 5614622812f47-404da74dff5mr8212321b6e.20.1747670716691; 
 Mon, 19 May 2025 09:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEe4piQ562b4IOVlspGzW1msi0MQVT0roIPekkjKhApRunVY8STLa/lKHyb7Sfjigf0Vz9hDg==
X-Received: by 2002:a05:6808:80b2:b0:401:e61b:fe9c with SMTP id
 5614622812f47-404da74dff5mr8212292b6e.20.1747670716365; 
 Mon, 19 May 2025 09:05:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:05:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:29 +0300
Subject: [PATCH v4 27/30] drm/msm/dpu: drop unused MDP TOP features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-27-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=35MNqdGvRYdhOY1x12AD2ENSpIyXidrM7J4u6sckI88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9GtkSD7GO8np7rUoAPPvY9u3OyoyXxiVmR
 mTnJv+kZ3CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1dmuB/9l91KzLmh6ICG00cmsuDjo+lRclidTnIkHB3cZDpt7aXjjXGYF1PL6rF31Ybg065aUiry
 EpsHViQ4PU24UoL74miDjFbJHl7PxouVD5uwXewnDqeBtSSu11Gr1EWqB3tMBkhBgv1Cy14reAD
 vV6B4+cUXHeykRD5f+tDnXmqNCmAltwySmMPfErk45931ZGXGcuU7DZU3dzg7/Y5kINZZWMc7N0
 eoBVL8UT8817QgJqv2Mu8Bgb0EIBTrYD6q0cbiTTEH4WiGjm2XFAjZZZ99LFlwdCl5ZkZH03xKa
 yqIfL0vk+wVXXvMxQBGfFYYqOD3aVT6Ki2OT55m+v+I5fYcy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX2mLVOOcKogh5
 XHNt5Yn8DedhWJxJCvLxWOBPMN/4ZbPDJwUvrIF+9GwVSYm68iTFKfNd88iZYrqQ3qq/F1pha/+
 YVdRW26Pb2kzKfV6auILC0+YX2QPgw0cuqtRT5Mzw5ccOKG02wSRYIUtSzG6Ie+wKUw11vt/Byh
 vCJHkNAJaBjS9saqmf+ZIi+opfmeXmhNsT1vfzH/cEJHc6eb4uTxbEcYW6eqrjyAseEsufSJxxX
 +Ql9wGAziWmDNsomHMGGIQ8yT9Ja+RIbO89SA+z9A8d+YGOTwuv9RCSGjyjBKl/7hvA08TcpKTD
 QC+qiQTHlu7689UEnlDMl9gRVEU/X2w1rMM8gaHHDBNBiLJvitvkplcQtLiOpHRJmaI2cj8j0fP
 g8DhDtMKydt1GxSM4zfn2lGkFllkEFZhB+XIRnbhsyDif8EP/n1UFh5XhCqj0wTynzy2OXK5
X-Proofpoint-ORIG-GUID: Kn41K1FG61W-Ei02As8QvQzfS4mpligZ
X-Proofpoint-GUID: Kn41K1FG61W-Ei02As8QvQzfS4mpligZ
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b56bd cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=740 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150
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

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5

