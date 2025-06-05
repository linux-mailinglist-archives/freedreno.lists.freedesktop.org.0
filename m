Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C656ACF6C5
	for <lists+freedreno@lfdr.de>; Thu,  5 Jun 2025 20:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F372D10E98A;
	Thu,  5 Jun 2025 18:32:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nCgqBwvc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F0D10E9DF
 for <freedreno@lists.freedesktop.org>; Thu,  5 Jun 2025 18:32:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HV3rV006413
 for <freedreno@lists.freedesktop.org>; Thu, 5 Jun 2025 18:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
 vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=nCgqBwvcddObPEvajmL7730nKjU
 /vphKVp4/wfzO9IZG+mUCSlP7tSU3GaTGt2ZMXBkf7xHGVtxhVEtF/0DmdxQIz57
 XY35OBMcI5sEtRteJjWr5EYXSSJGDNe6bexcOa1MpqCEaQrVMFpBjmAdaJvHSBnn
 6xseS24P4kwMN42wZACQ9HZS+39/zL7cFBtbpTOJgjnhzWDw6VHhAEdtb30p4JV7
 o1yVwyuLt08w6dLObLF00I0yThX/jaQQqt+/FQ6zQ8trW3cQE+fwFyhBQw89b57x
 iMbDEOEk4jzepqsG4HjCxcEYraW6BdMpUU5rQYkb6/CVQMRuO6sN+ZMnuuw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t2abs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 18:32:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2358430be61so11041405ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Jun 2025 11:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749148374; x=1749753174;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
 b=PpXjrsix83PsKYCqX0zdvcLUo3Onl4tvBufjY2c9WHlFRRPhpfiFH9GnZFOOyNsxI9
 LIWUx2gM9izC/u4/klFTQ03NaUYFoic8g4myq/25q2RVbgJPBJYusA2UmhOpbD6DFsNi
 gIBikjnsJ7iVp6Lx2tcX8hxt2MAhySQ3Q7O/UhQL4RcC1YqkVJQVLkwCzmoDgwmhRN+h
 3Cc/esUizOFHzLVv7kYUXsUaQ6leq2NNwCYKXItSH2B+jaRml2uZWKdqwaD2yN/J2EsB
 u7HsmuGBlgnW16GyVNj0lkELBZTX+8qqxWns/3CjzsRz8DPWobwuoGo/Xft11mdpVbUE
 vuSg==
X-Gm-Message-State: AOJu0Yx/U8ouZ6Y00Ek7Iu47Aci94wVK9oBRa4gHSAGd8mFXsP5y0KA0
 XYmKM1Y+uv1EMKHvuBbXptautXsgu5u69WnhEKJ7vMy+VEiL91zuhQHfiCOp+P99VL48ytfQuDa
 t/KR9Q+SKa8w7GYi/DeaCJ0E7zt3NbVASKO6k21e5pS+BAUK6D0t6suM7MoeI2nIRmAHHSb/LLX
 9dPLw=
X-Gm-Gg: ASbGncv8cCBBDzErEtvGAXaI3RcbHI0uo0txJO70L6bbCxJFK1f1pQl12QjRE5VWhVd
 XhteznmuR/yTTnVDWQJzo8zd6LIOcn4451/LQJn4PqBn+EnWdUOcvsAgVcJ/b1Qb9cf7ACkdfPL
 p8b2q+ZUVv7/GxpHoe3C++pbl6rJmOn/cDwgtVaR3lGcdQKPz6ejA7f+NI1HHsNxu5826i0SdGC
 qVM0/liQX81oGbfKbPW7Jvq87stL3sm3GLm20X38EXrK8l/6CtW0hMOMi3CtelrpTruyLT5XY3A
 bm+m0p+sROS+d5rtaR1akJ52K4+DT/pm
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id
 d9443c01a7336-23601d04741mr5714615ad.9.1749148374202; 
 Thu, 05 Jun 2025 11:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5kPTJZ9p7ITwX2L2PkFEST+pWrFDoURTl9jpp7xvKlXfywvcT8Oeg8Fe8Ntp7oh74HigMLA==
X-Received: by 2002:a17:903:8c6:b0:235:f55d:99cd with SMTP id
 d9443c01a7336-23601d04741mr5714185ad.9.1749148373797; 
 Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cd75f7sm122855085ad.111.2025.06.05.11.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 11:32:53 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 18/40] drm/msm: Drop queued submits on lastclose()
Date: Thu,  5 Jun 2025 11:29:03 -0700
Message-ID: <20250605183111.163594-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F8MhvEJZwt1V3nWvFvc-9EXnJigFrY33
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=6841e2d7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: F8MhvEJZwt1V3nWvFvc-9EXnJigFrY33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX8Xqzhktkwrp6
 rjniUEDCwJ6n38jHn6zLiGG8pM3pYye0KcbaaDS8UXxK0Q0ujw2+sRfltGRFCaRjx/4LWKLTVXD
 uXR5luplbOuQV+Zl7rePKJcMICZNUcUlkbMsWfe9UqNdQu2GIKAtdR/JYDrm6zkSly740dxM3nE
 h9n75URNmNh+OzSZ/KV7W59PH0W0Dgwirg3tKKqWpBQKSIhpRHQoQqnpstwYuBd59MlOV5Na3yk
 MYTHlwYHHfWquhh9vd66op8UOUI5HY/cTi2JUOFnnoN5CcG2lOYr8uyKd8CQVHjd+A9d1du4sfl
 V8jzh+KjZVbeXZZl3IXhqYWX0VLDhOcf4YHOIpHw1Dv6tv/rdf3LatT+6ye6JPYxZ7SzsG4Nhlm
 CxKKK4w6/HkZDAn6gou5lq6hrbobcR1kjWmF4gK1UsMAJgyXrfGctX2obit74wwiIaM6poyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050165
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

From: Rob Clark <robdclark@chromium.org>

If we haven't written the submit into the ringbuffer yet, then drop it.
The submit still retires through the normal path, to preserve fence
signalling order, but we can skip the IB's to userspace cmdstream.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 6ef29bc48bb0..5909720be48d 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -250,6 +250,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d8425e6d7f5a..bfaec80e5f2d 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -362,6 +362,14 @@ struct msm_context {
 	 */
 	int queueid;
 
+	/**
+	 * @closed: The device file associated with this context has been closed.
+	 *
+	 * Once the device is closed, any submits that have not been written
+	 * to the ring buffer are no-op'd.
+	 */
+	bool closed;
+
 	/** @vm: the per-process GPU address-space */
 	struct drm_gpuvm *vm;
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index bbf8503f6bb5..b8bcd5d9690d 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -17,6 +17,7 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	struct msm_fence_context *fctx = submit->ring->fctx;
 	struct msm_gpu *gpu = submit->gpu;
 	struct msm_drm_private *priv = gpu->dev->dev_private;
+	unsigned nr_cmds = submit->nr_cmds;
 	int i;
 
 	msm_fence_init(submit->hw_fence, fctx);
@@ -36,8 +37,13 @@ static struct dma_fence *msm_job_run(struct drm_sched_job *job)
 	/* TODO move submit path over to using a per-ring lock.. */
 	mutex_lock(&gpu->lock);
 
+	if (submit->queue->ctx->closed)
+		submit->nr_cmds = 0;
+
 	msm_gpu_submit(gpu, submit);
 
+	submit->nr_cmds = nr_cmds;
+
 	mutex_unlock(&gpu->lock);
 
 	return dma_fence_get(submit->hw_fence);
-- 
2.49.0

