Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F1BFE65F
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 00:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB5C10E85D;
	Wed, 22 Oct 2025 22:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJWQ2Lh5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B47310E85D
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:58 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIeqTs016465
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbX
 y/fmUaPY=; b=oJWQ2Lh5VafWunD4Unv+UfZakS3vkrcf0DavngbD/HJYJlHDM66
 WLO7Who+AlUzOjhwImK5ZWis7KpLlukheN2BrBsbXVGHuhJcF0lpIsO9qZVirh4S
 9Ql6n8rCZ37mDKMZyx8pDTElM56Nb6+amyzZ67A65RFiZcmH+3d3+kA6Yqt22MxI
 En7hoHryEMqWqK+sL2POcJD5BNth1EBxDua0p5qPVwD+trQWJIODV5PgF6c0+8gf
 9w8bhm51xQUImYfMMGk1GFofOwmL0sHnrtZIZmQxzLEpJXGjmQNzv9eADhDtPiZ3
 JkQkdh6zcc9KbQaGYt55cYQXa8wsCb3+suw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsbukp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 22:20:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b6cd0ee184aso24349a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 15:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761171657; x=1761776457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0mvZxV1MDsJnYmRbT9+6JtzjrypiHsWcbXy/fmUaPY=;
 b=lcdkCF6UKJvI0yCtoAdp0QyQbHeIYF7JfvVpUM2Hdt5XOXaKTY4DjiMBDl/fgFeJVs
 p4HSLoaHpJU4l7mZy/TsH+JiSy39pbdd6XYi2cr61sztY7AFAARWHWZdfUj3qlX5CuRB
 aQUnq7Ev3uttdCwG2sH20wdUT+WHveBZIM4S0WTntPA4rDE/TQ6gmERUOEnY7wdvDVVr
 m4SctyA7ZX3sbbJ3f2RKUKvNRsHRnJdX5fxeyvCxeu40S4uLwRZ/RMXKeCr4z0zO4H+b
 Dwzikc2lva24HoXjQpDZPnObMhe30u/2ydlJJ7OaMR6sdEpTMSs3VAXNQ5vY/2E3fxBy
 lmww==
X-Gm-Message-State: AOJu0Yw/irtl6XKJZ0cxtM24At/JdfUq/sjrTxpgY2BDIqJuk8HvN0O7
 clHkE5rDhnogJes+wJLRXmrQNxZezziVZdBTQ+xuAGvoOW6OlX3+LzOC9CbhkLBbQf1jegoZ87D
 z75HxDI5Ff9LX4dAfLQkve8/+iazB9nXEA2eX2pNSoAiRUTv2yit2Wnfrc+H9Q7QEtpu+A1s=
X-Gm-Gg: ASbGncvbZG8oyYGzzTpmHVfF9shcqWHNNKMcZaGTu9/UBW83lSBBz1poluE+nxRO740
 Y5k/aRN9GIntkMf7d4W/wyW6cMbRWUA7TkswKvAJM1JSnFMWvaHKQEpa4vodlmr4kO/zjbqYfwl
 S07GJnZt6TO7xnMVteeQvXioK8kx6pCT+/sSd5x5eSNBVuVBYJLfSIZ9rvDOtM3yTRqU1ozj/kQ
 u1DyBiFoIwA4RR0SfgjDtJuT/BYxAKTzqDL6TTeZ4vT3dwAG8UT2j+PSvGoA9MTFpdJDRZT9EuG
 LVevoxEyds+BSiZATUD8UTt/rdTR6cJi7K/PsPJOtQkiWT4yIz4lPJ7NDJVZbrS5jTwlYMNsmGE
 +LTEiXrpP1w==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-334a8523c3dmr29215684637.7.1761171656706; 
 Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHcTg7biN0R67q7mojPROACusX0lr4TEu2AEKXPQxVnJV9gXrUyzRzXnKDQhdID1RaUTlQhg==
X-Received: by 2002:a05:6a20:3945:b0:252:2bfe:b65a with SMTP id
 adf61e73a8af0-334a8523c3dmr29215654637.7.1761171656232; 
 Wed, 22 Oct 2025 15:20:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6cf4e0a43asm115793a12.27.2025.10.22.15.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 15:20:55 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Valentine Burley <valentine.burley@collabora.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Reject MAP_NULL op if no PRR
Date: Wed, 22 Oct 2025 15:20:51 -0700
Message-ID: <20251022222051.10030-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX/wlFYWor2t6x
 yHItxEQRNaQcLL4TdUUX1HjXvWc+CTsIi7jFKUMKENnxsATrDShJKwVRt9EcMTNo+WKjh4SJLzX
 VtgDaKf53f3LyoRY/rEkZ9tgXL59H93YpybeawjgNt+CMQYMzKGhumI9zCMOF4gobT5EWaBdThK
 Z8bOBOLes5Qxq9meL8+plOdVwTN850v7qm8VS6zcmLsl+eBiekFbdYpHA+KZo097s0idMQmwv9D
 LeRrxe3BCGcLjFrQAyNn2jRv/mDVkZPXff0HRU1Q585mBzW+qYVNd3b0uwLOhmzvwhIsVuH97hx
 InYOCc3DUPxd+pM8b58TXw1Y5U+9xjfBX4jVtr/Kpq6tKHSAbPLMr+gwA5FBf9e2354UhAgAMZ3
 2Ov2//jzJpWIYIDgTDjsbQTHu+Orrg==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68f958c9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=AzObSZ8MGmcM1bWaoswA:9 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: LVHOcIVGqMU0IhcPLCFUGcqCmtVyXd7I
X-Proofpoint-ORIG-GUID: LVHOcIVGqMU0IhcPLCFUGcqCmtVyXd7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190
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

We need PRR support in order to implement MAP_NULL.  Userspace shouldn't
be trying to use this if it is unsupported.

Reported-by: Valentine Burley <valentine.burley@collabora.com>
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37935#note_3153730
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  7 -------
 drivers/gpu/drm/msm/msm_gem_vma.c       |  6 ++++++
 drivers/gpu/drm/msm/msm_gpu.h           | 11 +++++++++++
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 19181b6fddfd..f93eee67240d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -365,13 +365,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
-static bool
-adreno_smmu_has_prr(struct msm_gpu *gpu)
-{
-	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
-	return adreno_smmu && adreno_smmu->set_prr_addr;
-}
-
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 90712586faac..96925a0f3965 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -964,6 +964,7 @@ static int
 lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 {
 	struct drm_device *dev = job->vm->drm;
+	struct msm_drm_private *priv = dev->dev_private;
 	int i = job->nr_ops++;
 	int ret = 0;
 
@@ -1010,6 +1011,11 @@ lookup_op(struct msm_vm_bind_job *job, const struct drm_msm_vm_bind_op *op)
 		break;
 	}
 
+	if ((op->op == MSM_VM_BIND_OP_MAP_NULL) &&
+	    !adreno_smmu_has_prr(priv->gpu)) {
+		ret = UERR(EINVAL, dev, "PRR not supported\n");
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a597f2bee30b..2894fc118485 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -299,6 +299,17 @@ static inline struct msm_gpu *dev_to_gpu(struct device *dev)
 	return container_of(adreno_smmu, struct msm_gpu, adreno_smmu);
 }
 
+static inline bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+
+	if (!adreno_smmu)
+		return false;
+
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 /* It turns out that all targets use the same ringbuffer size */
 #define MSM_GPU_RINGBUFFER_SZ SZ_32K
 #define MSM_GPU_RINGBUFFER_BLKSIZE 32
-- 
2.51.0

