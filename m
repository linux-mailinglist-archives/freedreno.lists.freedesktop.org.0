Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDEBAE8D64
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A418910E7DF;
	Wed, 25 Jun 2025 18:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RluCK2o2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791E110E7DD
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBDwYl021620
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ffdUUPweRzg
 vpO3v9DoMvCSyNHDyemApNNm03T9kbrM=; b=RluCK2o2vLtJJnpmimfjCEGt4SF
 HpILbEhqSZg6S/LvsfJMADHiwSNZZENM9MvuHNZazy6iMNs7iw4fIa8JD/f4V0W2
 7uoCjdAKHMiMRwDMi2drF8RujBPRvNw0EtDyYjZXTWjmQrTjU7Z/0mjrHFk5xKfU
 NB/B9bLQzHL6paGWjExlP3zcfoj0tNJ46UOELvBllGmxgVcE4PwJssJpyUYWUyGz
 O7x8harkijKoAbYiGiEQFMuLU4bmT03mL/K9TNulNvEpRJ0I9JS4U/qjJAOZdz8L
 xQNzh/R+/qss+e7xIWuZNTf/FFEGZ1y4eEUXQ/bZYkQg37Jhsa2aiPwHRVw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26b67j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:53 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748f13ef248so169201b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877933; x=1751482733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ffdUUPweRzgvpO3v9DoMvCSyNHDyemApNNm03T9kbrM=;
 b=aZm9SQPOvLDOx5FMaxTzr+TNz820Jk6w4RGwXbTjKOWgtYhB4UP71Dr4xu9ucrVjTW
 bU3tgABV5XTAZNi/o/jdLOnlxJD6wiE3jf3nQoPKCEsJvP/jwTyGSUX/9wclRCxtIJqA
 nXkq57xPcNoIuHkZsKmbzqf0Xb1nQWxIa7UpIbVdOLDCeUwckDGRUWejEjjilX2G0r7m
 iNS+1YoUjni4aBd4lx5DlxOmjK7DoGAo3eT8VJk28dwZRT8xQPyYnShFOBySDEMpj1r6
 dxh/BVel/OXWBlkH3t4hUXUN+nlc+3RTaInyCCdQM2V3o8CzprkAYc6npC7wY/gn1ofm
 qoKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEfvq8/m4XM87aL8ePQyqNXGMs3rveNgGret++jAJ4PE7kbQzFnbgmyPqtxpj5MlC1z4FH3tYwIC8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQahfqJ4Bm8ntHUkcLk23t7Q/FSJggNhEv7CgtWa9IL5XWRvAV
 hykgNhHwLincTEK/+hzVMucJdhDvPld5qjxBmQx+1+eUMMFH5YM4wygsjt6WpzeFaLNKiNEhEIb
 PHVEwFPIlMHvBbuGWGW2UKAV/tXf2UmKhnWd6RLhHPQaHTnaoLiByBNHfSoPE3/4tqtC7qXY=
X-Gm-Gg: ASbGnctUXRKHdWKJpdIDsWBfSXCBhbJLiUi5SjT81tSh0sh8SAzRyk7GmsYP0ItO5mN
 h06W+YMQuNMHr9RXSI/ZcGYU8jmhU0n7I4R8CFb+Sn8i2h8jqwjRdHHMdDrYW1s4mK2fBKh1Pm6
 /8B9XpvTelDlt1VkvDRvoQm5qIIHVRZ+IDzC7c9eAUCho7CAyOcu0GbZzQhY0t71pi5bs3fg+d6
 7XOtH9GNGusW2MoXrU4X3BIz2AX6NXYAIDmPRgF1lCoC+VxNowa8SJcvQnN5hcu7nkHoA58CUtz
 wS8CyOPsqs7McbmW2vftRoP+TFozJdM2
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id
 adf61e73a8af0-2207f33227bmr8106698637.34.1750877932961; 
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0kw5bnLdP6IBPTLphpUWcdTRJzruak++T3jSrLRaNiq8qRkCEOilIj6df1ql7bzZsWpPBQ==
X-Received: by 2002:a05:6a20:3d85:b0:220:193b:913 with SMTP id
 adf61e73a8af0-2207f33227bmr8106655637.34.1750877932520; 
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749c8851b26sm4805260b3a.122.2025.06.25.11.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:52 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 20/42] drm/msm: Drop queued submits on lastclose()
Date: Wed, 25 Jun 2025 11:47:13 -0700
Message-ID: <20250625184918.124608-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX4Mibnvx026T0
 3xFBN0WtyvNVf42V7Fch9XEU8kkiLuvKNFNCKkife6OKRd1UNwv3N5etaDP3sPBd1MbmLV0nIFs
 xgjdlyLdvmzIUhlbjkgfv8SsiRIzOUjeBXa3NwTOQridgVIjehszWhoV6ARNFt0eUQhO/ioiz1V
 szDiOlH/W4wbRU5oCzvvYiCNnKnxtwO+ybxbWcUhvetTrJ+Ja5xhsDcDtdlU6XIhCmcEnQagl3k
 cXzNxCaAC7IrtuyoF4muLErutN/9COmgNa2BGZdLqAPsMmDhRXdoC9sQFK25ibrrQWrbPYlu9zr
 pH9K5ASrVg/UrSQBkijh7FlYb9Z9OIqnyF/awTM5n6E/XoKfbRcilRuyuCXq+VpTp1mAViRKl7g
 LlkEN/3P2XfbClncqZ4cpIwit9p5u64gqeQbkeiLnieBhcZDjwAsmV3DTMrMlTgLz4/yyoTA
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685c46ed cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: UervDfq0mUfKhW3S0wc125eOrd0PJDyh
X-Proofpoint-ORIG-GUID: UervDfq0mUfKhW3S0wc125eOrd0PJDyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143
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

