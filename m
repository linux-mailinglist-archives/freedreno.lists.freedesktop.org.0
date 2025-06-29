Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A6AED071
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2844310E36C;
	Sun, 29 Jun 2025 20:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWIAqm9D";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187E10E36D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:48 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIklH0011754
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hadax31kM4+
 sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=; b=dWIAqm9DjIy6I+bHiuy9AGa3Llt
 tljGI8vcWhDYeWznraeqP3dLKCFULD9GJTP6o1ZllXUvS3OVuMKD5+T0giGHaemg
 gToChcO0Ab0fMZ53tnUzbZs1t/h1NEP+I7PrSPmaqNYro+/+qkTPHs750QW7pRP1
 YlVvAmByiL/WTTnSOmLOuH/6J9Mb2z2jnRFOY0u/F6NvXxxHoAAjicUAD94CVaXH
 oeTZU5R2cCnbGSgIgm31zZ6ZspwQiejE+WnXxjhNzA4mDYQqIzELx1Mj9V8P7v2V
 hZXV5oa2RrWO2dNrHVemGlFb+s6QWOr863DAM5AVq6GX6XFsDX4c8Wpm4Ow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j5rq2uyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3138e64b3f1so1701463a91.3
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228206; x=1751833006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hadax31kM4+sOKW6+ZA9wpUzRSoBTDuckmpOBYZlztw=;
 b=wxYQKXMK61xPFc7GQ8jSlj1g/RE1rxMDh93XH2BBsWpNx0IT15fySeuAu4AfywCtxI
 osULgHDhdMlkRr4PHNVti+DGQt0HiL10CJyembhlLhhHyhuVXEfQe2e2DjCDgrvEvJOX
 XGWz3EUyfLS8x0YH4jksWx7wCOJUYt03rfiJY4Jvp20ZSUkpTpElj2RI1ZijnvjqzuV8
 Mkf9XAXk3DDoDMYY04rnAgdMVKMctFC002H7jqdZpYJCw7F6r2F6ukt/+bhr7LuVVrud
 DesKzoZEasmXVu1JiUChn3kRwAPkgzH5ub3Cs/da8bpIWrD4X5AuuOpmeKzwrOeHczKU
 TQrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6fhPk/gUQgdKyz9NUz88gsX9zdVpwKlMX+PjqqBjEV6U1JYaUZUQm4h+LUTL7+EZ3KzCx4qsunls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG5jO6F3gD1hwXin4uW4PFxZCgNiyG5ACf/TCFGiTOBKT1G9ei
 LQLBLX8tD/HB4IfqX2tcjqnEIrvHh1ZoATrX/dIXTbdp+SUTPDG51fI7hYR4eaDqNh3nLLYBzf7
 duJzVNxZ8NIarqfFIke/hdE1wr0VSlzvKpoZQAdplAqXh2A5yGrVPaGPgtYmhVtQ8lQUYaOo=
X-Gm-Gg: ASbGncuGIuzRReZYrQ3OG6Mp4BwtcgTxtNCRzZUd1qzfMpXNvDWCsl2bh5TZ7fyXbFh
 ibJQy5JxUx1UisB27AUB6cinnEy4Ot03jmugEX+5dcPVpky5PZq7nqh4PfG7QYQqZ4dQ4nGj/mg
 52UdwA4MoISKNCC0k+kegaD7OfA3OHeOEhxfDI9XawTPh2XAS+5bS4yJiSXntg2qmEecQRJQwaU
 LDUz1XCHA/4Uba/wjp/mpagUHv5iq5sE7g8OtAcM0iz3GvfAaiVo9X0Hmpkvtd704hNp6aAtYbZ
 D371YF4/9A7DbLBZ+v1OnHfFGOjYGdVhEw==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-318c910a238mr15355606a91.10.1751228206363; 
 Sun, 29 Jun 2025 13:16:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr+QQ/LPBQuRXSDVeP1yQmlH8FH0SOjYXUqYKGHVd3ZKkPXg2/4lxBBqn444PNPlZLSOChww==
X-Received: by 2002:a17:90b:4b0d:b0:313:28f1:fc33 with SMTP id
 98e67ed59e1d1-318c910a238mr15355587a91.10.1751228205899; 
 Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5382f0dsm12695469a91.3.2025.06.29.13.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
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
Subject: [PATCH v9 20/42] drm/msm: Drop queued submits on lastclose()
Date: Sun, 29 Jun 2025 13:13:03 -0700
Message-ID: <20250629201530.25775-21-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ryIvzg8ttM5wGCq80KSQY-D-76dpXGd4
X-Authority-Analysis: v=2.4 cv=eIYTjGp1 c=1 sm=1 tr=0 ts=68619f2f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Vc5hAS3c26tUa1HFGawA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ryIvzg8ttM5wGCq80KSQY-D-76dpXGd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX7PDn40Jg94pX
 exDa3Vjmdx9PjFu4PkMkngPDAjD+5ZIjsXsB+ysdSorSgUPgnZ5Lz+Zon0mbFlC9/tD8mY8Dxgp
 SkEX6BjSF91xHLBEqDRKS1/imQijLW6Eds/22kyGbiHvxxhm4tQ2Cad7+VhJ/mg8xYbWWuMia1l
 aKKuumEemhhLM8SPifA0tCdFS3hmEt+XU+g8HHxgeJCGbiBI/jipPjMZ6BQYV6JYzsqvWpQSynQ
 avdn6KEtK5hnzAPBDRBfhe2GWm+QjWs2O3W5tmj4Q5PmcnVzxpQRATj+c3Tf3k18t0w3899ZjAj
 tXUrngqXFh2pInmxB+4fU13fwZOjwSbytuEC2RDjTcjg08tz9i+SY34z0KDpy2vr1PM+pYVrYn+
 16SJQfjA3aeundRQct7VrnBqHHUYBYQJtynU3JO7l+KGV6WgVRjT+b5p/nbVNOvDQIsbRA/v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172
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

