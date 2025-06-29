Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC8AED089
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DB110E37F;
	Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4+Ea8mB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E64610E369
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TJRfVw027960
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=fDzBgQEKZYU
 G26jz6qIHJn61zKgVSXScxT3NVbL/LOU=; b=R4+Ea8mB1bbZgj8rNwYI7Q7gj/u
 f0ZOn1qDVXl6TXzE8ixXPeuHxrGJCw+CrhBF43oNDGIvJF8LESlgG0QoeH/r/e/2
 CxZ42oCb/0jn73QZSGe2SLv/fnWjSQjcigTt9mk5nqTpYtlM9pVPEfLDOCyW7U0l
 +2szWLga2shgsT9xdhabwDzyj9Px0bdqzpUNF1OEiUwir1gz0x+/BxTu1b7eOr1+
 5+yjwUVCMkgy1MfmjBcG9w+KNzbhR+xweXe3+axPQJy2WwVFybwJ1kfFOy+7Pa+8
 Q9B5NuzzssWvFDdnofpefc53v/dSGjIZoiSTIPLemSQWiOUJ1E3MF4FxQFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxan95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:17:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b3510c0cfc7so137050a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228222; x=1751833022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fDzBgQEKZYUG26jz6qIHJn61zKgVSXScxT3NVbL/LOU=;
 b=ogJXIuPdkCdWYCyRdPXlK33Ge/Y2nNK8z2kpe+vxLIQOA9a2Zx5XAUxmHIXe3HcUEj
 6tcPqnPpUnhgk24H7FUOF3Twm6M8TGt7rs98ZgMS/+ZFPEd6XEjBIoQ3dI9FvNlaE2nF
 Wn+HKMaOknUcGqztJC5H5QRHMKRTgWG1I17zRPB1nC7qrp2BoCbjBeBAG9tymMuD1Dy9
 wQ/sRQP45JVfxJgo5Cgb3RNJtUq6BrcQzmacYtcb1glBN0rtcC7axjM2G11xNStINBfj
 QxC3kTFDCnlDkxgZJ/c9ZD95AvKqgwbdLkvNbj/lzjawrq+1o4M7Cv5H5PHTzv6x61+c
 GEXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw5lHmdHLhzZ46CL8ZAJ1Dx1P7ksSTCC1YgPqhx9kwXpetEqMpIqitwv0yx+R2jHqcyZT9SAgrgnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7hVDLjjrh98YzUOwDHp5bbNH1B3oK8XYrxcQCiR61g9xk66Rt
 H4r/Fw068S8XOhPoIfZDaGC8/cioqbW6bVlGgqtl5nywvn84zBtP72FxED1yJscnYARDLnvdbC+
 6Ab2N8BX08Cu7V6vHVQ7t2RKoNLoRJQKJ911wx7Ba1O3q9QKecX4jT++3RH+HEQSL8sF0WO2ORh
 RDJxI=
X-Gm-Gg: ASbGncsQudW+TjzuPrDSf6Sa+gylqouf/SSiNeKhQ3hAZxxL3qFF9m7JXJEY6//H6Da
 BYOFjWdFMEoEBhbX21wqdLytg6TNrnQQusRlItw2sdHPg0vUXwBe+ULMNCYT4NzMwG27R+/jDPl
 vk+1mcmOR2ICRgujOwA0eEvSkNOA5amVi9FlGC/uZ03BTefzb8iUGvu5mkW6Nx837o29O3Bns+z
 BXXZT/AYjJ3rGsJ17L+wQrK+SRvVZUPqn1JFQBIMb2kN8n0mnqfmkIrYKqKwgDzm3JFaOOA+5DJ
 /rAsfbfbkmuao0fFim0A+xPLp9I9X7X2Gg==
X-Received: by 2002:a17:902:e945:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23ac460a998mr204143845ad.44.1751228221726; 
 Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLpQD5GICYIqvvFhdJkmfy/Ovg7wYpC3gynOWCpzMdtDIXI235tmasxFkPxlw9AML6z9VilA==
X-Received: by 2002:a17:902:e945:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23ac460a998mr204143515ad.44.1751228221362; 
 Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3bf1f6sm65561795ad.204.2025.06.29.13.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:17:01 -0700 (PDT)
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
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 30/42] drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
Date: Sun, 29 Jun 2025 13:13:13 -0700
Message-ID: <20250629201530.25775-31-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX5AZq3MJHvS05
 ZyjV7FrPpTTp6ygGA4IPyWeaLQYaAtU4wE7TtL7eFG5rO1zUEAd8eLmCGYBChJwlkPc0Q7xTamT
 0Xy1R+0V7hxQO3j3z2Oe01IZASobIQz77pX3r4TqJpoobOL6gPs5XjUbRTVyLmfEq1c+nQ6u+Y0
 kTh8r6z3Cj+NojwHLbrJzIiMAjaMyArHoFKmsaqbbdTP0YCX2Ktm7QmwGrdlN5/l1oSknu4igJc
 1O5mQuHuyeXy0nk2gN6MWczNOCEqGFLWedbnAhZuihjDZbonwXKlKjodQBcsLIXq1FkXL3t8vcp
 gOeR2uZs/90GomGKFalas/+9H8e7eoYWbC8x75E46hkhr4xn7XC4jFDfC3iPnY9bKzVX2QcVUdt
 69cIiEpvNsYSXJ/54PiHZ9nPPbMulCKzjoQ6JNYQpsjIj0oYJByWu5SvOkeSbdLUddGwrS0r
X-Proofpoint-GUID: jv8GTX8FzIZEP4uzl3ntcUFitxWjYcjx
X-Proofpoint-ORIG-GUID: jv8GTX8FzIZEP4uzl3ntcUFitxWjYcjx
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68619f3f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

