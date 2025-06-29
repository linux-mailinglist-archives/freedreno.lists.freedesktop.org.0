Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D534BAED06B
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFD310E363;
	Sun, 29 Jun 2025 20:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7ALFKfM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F96910E369
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TGTmrS007996
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=F07tE0vJpnj
 OaneIx6xxhc1GKaxYebaabLke4Ul+Piw=; b=Q7ALFKfMm4jtxOyMHeY5EvUsq9l
 61NeJT5RolmYbyHuoiatb8eVQF2oSjXO4pFTJAJuyb4/9Oa8Xy26VyJMLyqOc0wc
 NoeaixiziPKm/tDFHfcGmG0Dl3lgsi+yTz49pgmSpKB3nSRWCDgSBJNLlbcBtjbt
 qGDsnIvnooFT2Dvh2GlBUjCepQE1jD//ALAcLEmnYZHkfOP75uioT9764trMl5Tx
 34cevQHLeC/j6WGXQrWAwVPmMa5IQNUfXYIqPlKkOcLh3fe6Quc0Bm7nqjPGv5yw
 3P06RIHL1OSeZTTTLE/hpHkLdAlw3TtaU22dTkb3IZRXNQHkvB3hMgo5zxg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ajy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3510c0cfc7so136957a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228200; x=1751833000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F07tE0vJpnjOaneIx6xxhc1GKaxYebaabLke4Ul+Piw=;
 b=cG/EFQKu4rMtH9p2oCgMAujsA9whNx7TPsJz9fsc6JFzku/gSbXX05TVAERW9UdvPJ
 +9Kn87nCadmWh3iHMry12gREDFU5zvHJMp26fJW8mxlR9diGHElMl4mOhvsexddV+viJ
 nE/YDZXoFzJQu+mlSbp0PpoL+ItosbKA1K170hU+b27Y3GvY0n/g99tf47uJWZRt3nW/
 MSI1esUZP8qBmfvcx5hNmN1qB8GdfvqAsGq9k9NxLktkEqdAJ5hA1+cin2JIyo3e/WlY
 PEmAJeVlsra3369rnID9Rmexo7veSYo8eoadWnxvVmZegcyDaZc+r1Gqd6MI9fRgrjMD
 yNgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5MK7h46f0aYhXw2rQE60HsTO4oKF4D7ftJNmP/vlk0QENGybHgWaNWIdERbQYtCLNdNUDHs3wD2A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa/UpkCrS31tIht57tPy3TxTC+sJnbUxzNz/YIjG8mOj0D2DC7
 V+TKFFbQWvrtuUGEDvKUBScOQNeg8F38NaYPNUWPtWUmN97DFFU0/tBCWAnyUgl9oYh0X9EbiOZ
 Wv7hZFHAvZ03sMuPnCdEyzdRGow+GQrEytAuw5J3hY8E7SsmErN6PsBOOnM8GJvAy+Xxnfw0=
X-Gm-Gg: ASbGncvdl+6RUG3MY9k9OTjDRHlh4IYCeGUQwzFlf7rLD/vgp7G6Ev/fO9RrXGAU316
 NI4UxiYX51npXquNvBh+9ERVS+nRcXMINwe9TQBURdp6ZXpbl0P3lpjLXvJipa3kMASH3/9REXw
 w6C7kPD1AsOxZt9AiepXnRtwD82b2j6Ht40xClIzrdgpKDvo9tj1RwONDAFoilTv5f7XLrTBoAc
 PZTAtLAiupV/lxVDmt1h2dAKryZ3g3imZZ8qzajKKwdWhPIFf5+pGtuojYR1LjXpMn2otIQH+Wx
 tfOqUxkBplr+u1R7/skvnVJ7OL9wN4jdmQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id
 adf61e73a8af0-220a16e46d5mr18754429637.31.1751228200533; 
 Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELqQu+0TYmCQ+TNpM1MfGezE3TlblWt0dkgODaaYVhQOuwJeIcM6JHGprl9661zvuA9IyEQ==
X-Received: by 2002:a05:6a21:329c:b0:220:7994:1df1 with SMTP id
 adf61e73a8af0-220a16e46d5mr18754407637.31.1751228200109; 
 Sun, 29 Jun 2025 13:16:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e300d808sm6372068a12.14.2025.06.29.13.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:39 -0700 (PDT)
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
Subject: [PATCH v9 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Sun, 29 Jun 2025 13:12:59 -0700
Message-ID: <20250629201530.25775-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68619f29 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=8Ft5guHMEotweHOT_P0A:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: scjGPU7ehzx1vz-fjz4xdLZd1GMssMeP
X-Proofpoint-GUID: scjGPU7ehzx1vz-fjz4xdLZd1GMssMeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfXyBVnqMj2W5ip
 awQi7k/h7S2vAzbOsMCLzHrH8omLB30dSL1U1fNJ85BruyyW+ufepHoGjZjrBe0P4ZxmqCqEJwy
 NymHOC7O4woZd9w1f3cb8QeTYTpnXbKMvQiUiMoyM/6jkJn4aHImqFYqx4AaEZjfX9gf1W2gPsb
 yS6MhfFd98XLFWRwuCgdYagkzBAF5aIKRHqnyoim4c2DQOoTC/7Z0QRZ2dIt1t1gB+xNtOh+REQ
 PGALkezmf6+ALjnAy/IawldfAMmr5BpXOBt0Pmg0rs+cm0fnhY4oHITr2wsFQ2O5vWcuazK2hS2
 PiiXkp4aYk0dVkzojk241dyPELoru5CKhgFBz7KI82hSTAdz+ZE55i3gJzMXAraUDW7/ajgmJ7n
 z5nB5EmJ1Bp6s9VGLRjaOvfpWjIuC7WMeRA/U/fqrHD6mxwRye5tUkva3YMLm/d9OC8bC21v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
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

We'll re-use this in the vm_bind path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 763bafcff4cc..20d5e4b4d057 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -462,10 +462,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -477,6 +476,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	if (msm_obj->flags & MSM_BO_CACHED_COHERENT)
 		prot |= IOMMU_CACHE;
 
+	return prot;
+}
+
+int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	struct page **pages;
+	int prot = msm_gem_prot(obj);
+
 	msm_gem_assert_locked(obj);
 
 	pages = msm_gem_get_pages_locked(obj, MSM_MADV_WILLNEED);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 892e4132fa72..a18872ab1393 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -158,6 +158,7 @@ struct msm_gem_object {
 #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
 
 uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj);
+int msm_gem_prot(struct drm_gem_object *obj);
 int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma);
 void msm_gem_unpin_locked(struct drm_gem_object *obj);
 void msm_gem_unpin_active(struct drm_gem_object *obj);
-- 
2.50.0

