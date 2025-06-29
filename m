Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E778AECD31
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30AD10E2D6;
	Sun, 29 Jun 2025 14:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7p2+MR1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A5810E29D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:52 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TADXsL028542
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
 sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=G7p2+MR1tEeDzDKPrPTuONNUP9L
 zniDCHXGtc1yGhFtQi6/f+A0mjHa9KRGDipcgix2StQjXvu2K3jqfBPfWwDGLZMa
 k63IE5FIeaa1VYDLcl1OizbMArLJtKEyg88mCWHCp6h001QoUV6lYQ+wUWfsEqC/
 6xkSxNkonSlxF9JR2i3gQdC5AlP89yk016J0Clz1t9faeU7tgKOi4k1fOhiORnpi
 RInMtwKlW75mt9jtpn8mSOcWKqILYUDhFKxKDnuE04+miR8PiqomEF2z/4+nlq1d
 cGTTLKndwWk9yxIsWnb7ymZDJiv5SFRFlhsUJ+K9OlZVEdMkQBJSSmaFfhw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9t9dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:07:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-23536f7c2d7so19745145ad.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206070; x=1751810870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
 b=COzP8M2P1aNFfCecR7YGft6//i0PifdITPEAXVPNs82lCAN6ckvq6rgojWp5eryhil
 /9fAD/oBMLWzo9fp9Fb3HtUGWTm+I8D4x2l4ZekwGhlcDmzt9s3vynOTm2FoHqjvycC/
 0bJF+6t1QR62xNOLrW4DT8bUSTuDMpBiiqMMQBoDLEzjorNoWtpYr7iaRsTpN/DI3EtK
 1DJMyvasqLk1H8iNX12l7xtKPUcawfgKRA9UD4KiRAimYN1Ek5tBWL9x/tYUfGiw29hH
 Sv240e3El21954oaa8h7YY0c4qqSLjgsalUt+D/IeHNTW/CGIzOW/mXoTYE8pnplXQqP
 DkkQ==
X-Gm-Message-State: AOJu0YzYAH8rWSSH6Or/6BtGp3PdhC168638hzXn1rqjZgVUyt1vXooZ
 h4IwQ/cG3Fb96trAtSBSeueq6IIqPrGujNjtkiPg24H+DFsQDX135vAcattgsgtiOiMvfkrEaU7
 cyWW6MNZbEIeNPWSr7aqLuuxMeDWyXg52G1trbAksak89mG2cxydGelIeJ3gMLQWYS3hSQYE=
X-Gm-Gg: ASbGncvIKOebpClxN15QVKeWwn3tsp7BElQCoeMHEkaI7xkL7PKLozhXFvVUCnejJ9G
 3ECgvHkIDc7vkJvv20StF3X810ofgX2uSHJXje3tpiOk8BN8KWI+TVM5sd3kosATaqKhuFyE29M
 S1td1JgycbUop2SDl+NmUh9/wp5nfqIPWLawJaAsXb15CjdOkpjx0ueQYEJkPzjF3nsX5wCs22B
 ZYFbmXzmDZVxY/c4gHL7vcV9XZovFGRct/sfS0Rm99nB0fZblautH1I6lXWOG74g0azKWJGMwnU
 7yabk1TwKmiYh2GfePoOJzx/Az2UrgmX
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id
 d9443c01a7336-23ac3bffd8bmr147181815ad.7.1751206070492; 
 Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgyBQ8WKKcLovdC2oavEyunsP/RHNeiUVkDACGNy5ppa5wMTeH1fWoAqZmD8XHl5viNYZ3A==
X-Received: by 2002:a17:903:2449:b0:234:ba75:836 with SMTP id
 d9443c01a7336-23ac3bffd8bmr147181445ad.7.1751206070100; 
 Sun, 29 Jun 2025 07:07:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39baf5sm61278095ad.123.2025.06.29.07.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:07:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 07:03:23 -0700
Message-ID: <20250629140537.30850-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfXwSfA/9vJbLPR
 jC3a0VKepZcTgJDWOPCEj5AcjJo2mAjy/evM054rsALolILCSUQYYEmYoSCmvbbZfVxryCU4EP9
 nm+WysF0ycK2fHjiKznkooQappIrC6JOP7wQPI2S3lOOReigf0PzFwmDRYBN8f07ir0xpaGby4N
 Ctb66m6la1ThAV0uh5LHr9IP4zBZ6scH6SmZhenhV7AAv0TWQV9rfCz91YJiIETWXVD9PiBUbsJ
 nUSRmJyfKaJMM+DdjQ3riUSiSwLlGzbKSL8QMXB4m/P4HE1Uska+xOLYuFehrD7WYZXPYWK2nbP
 iPoHtVx0RQpCPRG9sRXKHqLFUdkUCPDtY2ZKfG7eCrTECHVcjC50DvlfvHKlXXzj2sNEuVuBKHq
 0kLoVo8agYNV8Yes5hCjYdhQFad9xGIobGQ0eDhe8Xk5P47bgXLEjBx8za5PNZmhOEuDgYqp
X-Proofpoint-GUID: 4Vz0IHSmCHVe1U0UbjuarRzLmnEEPVPA
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686148b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 4Vz0IHSmCHVe1U0UbjuarRzLmnEEPVPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119
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
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c        | 1 +
 drivers/gpu/drm/msm/msm_gpu.h        | 8 ++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 488fdf02aee9..c4b0a38276fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -254,6 +254,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 
 static void context_close(struct msm_context *ctx)
 {
+	ctx->closed = true;
 	msm_submitqueue_close(ctx);
 	msm_context_put(ctx);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 231577656fae..a35e1c7bbcdd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -356,6 +356,14 @@ struct msm_context {
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
index 552b8da9e5f7..b2f612e5dc79 100644
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
2.50.0

