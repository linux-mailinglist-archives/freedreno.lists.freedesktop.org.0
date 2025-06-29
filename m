Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B268AECD41
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9D210E342;
	Sun, 29 Jun 2025 14:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8KtDQ7+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEEB10E2C0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCIgZQ000721
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
 G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=H8KtDQ7+cji0fJIzrUl/zXGdgqM
 brV9B5h7udP7kKwVaaeC/bphrM4sg6sl15tQaH80GAu7rg6eFeypRFlWOIf9ebYM
 VI8q/JIuiRZwZHtxAESM5XZZu26s+pqWR/QwA9T7YyNfrlBzbuedAT+krdxWfX9Z
 wCkXRR36xJFvREGsbAk5STh/F5a/o/C0WxYsQQcgrTquELfXXVwxAq1s8UWDgGP7
 LsO6HhQjm5LE0hpJuNM7fpyIU31ZSkkv1G6aBjTz5spAhQFhXVKKIBkqy/5Fwmxq
 CjfCXCJx1daD2hhSjietLeHWyFczxIR6cb3WuNwuMtbcIkt/loomiXZVY6Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm284t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:08:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2354ba59eb6so20377315ad.1
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751206084; x=1751810884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
 b=DmmAOhqUpOeMKvvmN0mPHaTEwrk8YOcRThfdBeuGfCibkawyglxHjX8gSZZ0Ni8Ks+
 TeJ5/NAvgEVEMEWksOU+/NM+F6KeCUZXNZjoSe8PCJqCkHVTfvGgybgOTsT2W8nekDV8
 +nTiBPRE82dUTrJmSm0ZM4nHMV5J8vatO0M92xx7da6sgYgL/Jd+nrsPDd/Pefy8MIkT
 MkFo/mfESZV8roV/1vFA7lo1UX6uVcixeaX1d/0n9vAm1Fc2M2+H4H38CxDaEvnvQtG+
 oM80+hs8cv0kaCgPkRL/O7C+Bq/AX79rdi7NhY8g7NuBCsE6Hj/QFk/NBoSqBTIXcuVa
 Jyzw==
X-Gm-Message-State: AOJu0YxMBU7M/bRCY0C1q6XY/1i6NxeTXupR1DD0+GfV0AlVlrLqE33g
 Z0EI2UiM5FZKnGgUWidNf4sXkCuZgXqO6K0ygocvQzANOgAONe+KcNOBsdWAPtLl6rltyKTFrMC
 Zf5HY24vML/lr8UYpkdViIpbDBkyTDaWgetjvQHKbL0azWpUhuwWQUhp1Z0NUaIWqKXdQ0bY=
X-Gm-Gg: ASbGncs+4x+KQQkFj3km1dkA1SgLGyTEz4bgzeEpZ6hkC1o0Csrom/Tw9s6mIu/hUyt
 l7SyQfMjqL1BmlMlqaW+g3j587UpaPf9SOd57HsZ8hEjJX+AMyTKN9lpoKP3S1FyHUJP92hn+jx
 +5Mfgwo0JspnbFo4VrV0heX3hsnBgif6TI3SXNQ2Tc1r2hVB3tzVg3ZSGEqv3eIx4vXiBN4E0tX
 2XzHiURjKeVCj4JxY/4xt+SVTv7Cc9fQ6g06bDNRgJONbBH+WkyX3WeI0Hqn+xogmWioWntr6fI
 XhvFFwbescQ5wYYrcNhczDlT7yYrBOWx
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id
 d9443c01a7336-23ac463470cmr169136415ad.36.1751206084539; 
 Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkyc5NqpGoUysSULZkt4YI8T4ojjTyZxoY3YnC9AbbMNNhL19AVyCjD/gR1PB/UUJsbTP6lQ==
X-Received: by 2002:a17:902:e54b:b0:235:eb8b:9968 with SMTP id
 d9443c01a7336-23ac463470cmr169136005ad.36.1751206084070; 
 Sun, 29 Jun 2025 07:08:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3adeabsm57654565ad.159.2025.06.29.07.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:08:03 -0700 (PDT)
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
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 07:03:33 -0700
Message-ID: <20250629140537.30850-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686148c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: okJwgXWFspJ8N9cYdv6HIdYZ-TiXry00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX2TbX+HGbJSeW
 f2LIH4MV3e0JGPgXPwFY3SkZ8+3LW3LhjwnOxUqsXHY6jrpQSV6exy6osGHjp6YKKrZzWgEsGIY
 SxoSIq3pQsEqX86p3gz/Aph7mN1/2+Hnw2crBEewzx3YdAHcF+wPXI5vrVVSxzVp8vnkEjq+VKq
 W3LdDTd9PiZTyB3h4Cf1pmcdge4lHHOJfwKQagjS5Z+GOdUhF97TOtLYKQ0bIeIxVb52wuQ/FkR
 gerHtWuwrX0Jfia+LLOPbgVCYAS0Kt7ZZZdtflR26t6WtqHtauQsFFNhRCLVkBCdz5kxMKLQsaD
 4BKJYNwu9mXe/AsQ3fie1jCVuSS4ToT21P4ONKWIa8ucqp9CpNHQPHJ3bAVNwVxOJDtnNKgv2mj
 Gpko0hve14lfws9HFj6ciWcveUPtDCnrBcApubYwjA8g+p0R420evB3BQ4nskOyEveXB6Gxz
X-Proofpoint-GUID: okJwgXWFspJ8N9cYdv6HIdYZ-TiXry00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290119
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

Any place we wait for a BO to become idle, we should use BOOKKEEP usage,
to ensure that it waits for _any_ activity.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c          | 6 +++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 100d159d52e2..b688d397cc47 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -93,8 +93,8 @@ static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *file)
 	 * TODO we might need to kick this to a queue to avoid blocking
 	 * in CLOSE ioctl
 	 */
-	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ, false,
-			      msecs_to_jiffies(1000));
+	dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
 
 	msm_gem_lock_vm_and_obj(&exec, obj, ctx->vm);
 	put_iova_spaces(obj, ctx->vm, true);
@@ -895,7 +895,7 @@ bool msm_gem_active(struct drm_gem_object *obj)
 	if (to_msm_bo(obj)->pin_count)
 		return true;
 
-	return !dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true));
+	return !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP);
 }
 
 int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5faf6227584a..1039e3c0a47b 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -139,7 +139,7 @@ evict(struct drm_gem_object *obj, struct ww_acquire_ctx *ticket)
 static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
-	enum dma_resv_usage usage = dma_resv_usage_rw(true);
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
-- 
2.50.0

