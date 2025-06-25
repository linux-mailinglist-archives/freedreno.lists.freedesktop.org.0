Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B540CAE8D87
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6CF10E7F6;
	Wed, 25 Jun 2025 18:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2yRjw6+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE5410E7F3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:23 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmrx015564
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eqq9rbaAioE
 9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=; b=F2yRjw6+OVLjPctkQ7sN/SPa2Dw
 9I0eoXTefhTcUVJuB44zerx7wk9plj3WgmZuB+U1NDuOkBpjgYQcanCPgttNDshZ
 LHjG+vrltCf1AEry4+JKwdu9sSWZ02G5naJKvSMsQg5Z8JKeiy9R3/Yd6nzG4BYn
 s8X+WgmXDKd7rTxqiFSUOnKHK5a2BpPVFoW1NEKlhTjBeO3npBS/cIOjhn+9e6j5
 UTxIXgzyXpKuyL6PNx2SNAZk0QDls7E69jcx4ej049FUCgLJt9PS27MxaP60f9dp
 cKxpjB0Ix3eQIf/kl8UIy66kqb7yahG/p7KEzezj23KejTA6AUHVwsM1tWg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqdke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:59:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-236725af87fso1966695ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877961; x=1751482761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqq9rbaAioE9x/Vr1cLJypF4bAqJQvBM2Xsa5cd3ZNI=;
 b=ozyinlmg7VfUEJG7hvJuwCUgs3HN2BKmuDRPszB/eYv+ZvNLFkK3kWjM5ANVmZDHus
 rWLaOwx34kw01rahRklh/90R3gbrBZcbMAwLrut/mrpDytslgZbbexktndwDBDzDsugH
 bpzbWteKjnZ0cPSvS1IPPymDsxntESMXFJgDyrf8k/qGAxm2/Bl0YF1x17e+gZWeOEcr
 484JtKupItRMikT0ebgNMWEzK/9SItORC6TWCr63amIoqvGpD92UORJ0IBgOm3oNhlC/
 jqrpGtIzaX10U05E85zfFrHIxMvqStmtYsIUfrtpNce4yXNhbP+WuXfqlVvfYKZOfJJG
 XfFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4h95hMdoY+SI0tqa9HUHM+Yes6ex97paBDwIxDvYMTdWYkMw9WHzxeJiAmgiC2XwEHMOo1TZ6X3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNZhqCqWgxwitXnkjIsol4CCQz++94vVYzzbF+2lU/n9rtrwx7
 Z5luEoCdkIX1vVE9JZ/vZQAH2zZAk5HWgF/c0EEQSdBecnI7KNH4ECgUBWvKiGhclF2jZWw7NLv
 zyUnwTm5u1m0LWaov8clkhlb6pt6VudLZ7MOaFivHShi0prxJg3hAemBv20yOy6wFbu7UDcs=
X-Gm-Gg: ASbGncvT/9yKdL23LAu0Mb1psPXiUhi6Go7OI3i3kKLEnCfmaNYR+hJNp8N++UYAVvV
 Z1qQ3eFzYCoHi7F3xEP6KpuRT2DVEDOS2dVWWSj+zjf29d8glBGS1rxBCKWL6iSPQqtZ+mz65RV
 k8QQ+AhpRXwKWPyuqjtuNnuwD0+eM1yzsjT1k/3uChMkg8W5a1xUdSEeAEiLTm6irWmyXJ8RvZw
 ZU7oYvFc+aif3EwJrbDFKBFjJbdorJNPYhEas54fL43eqCOC4MtaieTNrBJk6K0dY+S4Rk/aBex
 qnHH8bE4EZx071zhQx/tgo4aI4uPBANd
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-23824087b81mr74601385ad.51.1750877961036; 
 Wed, 25 Jun 2025 11:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH/9u8r/LxodxXtXwo7w52l7fdtoIYCsGzY2nyZs0qLi0VBSXghq7mfLQgk/HczC7JkARW8w==
X-Received: by 2002:a17:903:1aab:b0:234:eea2:9483 with SMTP id
 d9443c01a7336-23824087b81mr74601115ad.51.1750877960671; 
 Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860a8a8sm136322695ad.132.2025.06.25.11.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:59:20 -0700 (PDT)
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
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 39/42] drm/msm: use trylock for debugfs
Date: Wed, 25 Jun 2025 11:47:32 -0700
Message-ID: <20250625184918.124608-40-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JnQED_8IjbCIycq9bIvLLA3Pn9AXXGey
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c470a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=UIWvmcERRd2or3XT2GcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JnQED_8IjbCIycq9bIvLLA3Pn9AXXGey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX1/o9p6G0yOY0
 8M5Zy4Js9oJ/GpJy//25HM0BkxIsurB/r1kKZ2MPmPjnmWSC/CunyhMZ85dqKxJctTSF4iM/VHt
 /2wka5qNeREKKQz5c/Et3vrBsYnR0aHpkUOqG1xcg3wV+lZUhlpo34UvJXwDJoDAEfE+2Ssp2Gq
 k7PY6EPFPWMHmtojQkotKlKJiWgUmMFfieDi0CAAiS7/M6TlFmSnEHEd9ENh+Yv36ltvWhDxvDB
 plhw88zTFPrGAViM7yDY5ji4qsSCokdbc2pxae96qoD+0moiuS5+sijnzr1W0f8x3BWc3ZTW4ZB
 1mqc21Qv01btraFo9Og4mtiqecWZcA2Ol5nXJ4uKgdhcEzH3UvlOY8lyWCm5R7+5ZLSSBXAXvEI
 oKEZfnIHMGuRmuL2p4TygsnhbufZvnnvtYLDlfdA0uc0vwbEPMUFO4mKP9NunwsuPq3JwF5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e415e6e32a59..b882647144bb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -946,7 +946,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 57252b5e08d0..9671c4299cf8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

