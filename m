Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59729AE8D5A
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151FE10E7D8;
	Wed, 25 Jun 2025 18:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ2KRNFV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BCD10E7D0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9b7P1032301
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=BEMRIRtPgB7
 xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=; b=HQ2KRNFVzgHdRLB15LaR2n7rCIq
 DnEXyjQAhx7gJdmYIYh2GKjQ72x1vtNs1ah96RWUMn+XgPLDT16NMrBy88B8Dz19
 ScTYonCVUsUfs82L6rHD7zNJTcVlICjfAeaN+pcXrDvVvzQux9XOHol9Vvaw/JSX
 VJYvdAhlwBtE3oHVYb1GffkqyDr817jEyY92gnPcQaGcEV7E1kVvh+pwxCWxeFWp
 wXQIiPl3tmipsXWYY+kLceU9u64Edc9V5Lwwxdch5BlJqfQ72s6MRGBqTnna8T7q
 JZzhttO741kiNWreYCw+WKokD24+5RumYjxNM4/QLsFbdzmv63xfkro361w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1ygyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2358de17665so1743005ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877927; x=1751482727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEMRIRtPgB7xj7eLCSE0ieGk3YZPnc78Gz5XX/Mz3mY=;
 b=SgMZ9GYFNbaBJ3yG//gvtN7crtOsoY+2xdFESej6Va8zvLnvZQRXILmjdmFdFYdrnq
 y0IQwb74iMXTA63jWAyTXQJTmTodrDG3yYDmJV1/EDw9ujVg1Dxukry6YQpY3JStqFcl
 jKGfin4cc32jW8GYBwko4x7vYbFE2eKF03Z/gvwsOGKXm4CZr6aKhTmuwLmFIQOmK0KS
 D2bT8Ctsz/av/Mofc1IO/gvFDzQMT0EE7Ev+Qk9YKwOkoveSnL+Qip1wZG6thAD1pYS3
 E2fU8OMq2tWKA0uWvQwaEs745J9XleaUxa1V05e3NakcC8N7Ium4gnx1zxXpc2c4d7Th
 JKOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz7wBJkTSv4yNa+G86WeSJ5EVtsvzZKv5F0Rvqe0FfxXiES0w4I15bAeBCQjBsFU6DdCEia3+8qlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4L7rOuf+USiS6uneRTJAOj5RPIniUssoxAT9wcYd0BODlAUeA
 OIrbnIZ2IGjWzk57mFa2xzqiPnP0MqZtugyTLZfbCJPqMaXXfzgrnwkoUNWcvNvdXj4hZT1YWl2
 YhgR3nT1tMuqaZTP+ugsOewVYHQB/Poecc3mVIXHfnqx5GVS1SQOm6AbekhIfOJuyitxX5DM=
X-Gm-Gg: ASbGncvkCSClF3qZHDqlG3mgdS3xQ53yETqPASRw0UTxu4g5BuR8U6Q21RodJUOlYMd
 W4+5Kiz4ws9rTv+kTApzQlyVYFNl4YGqAuPmedTAgNuIjluZy9cw0XYQgeJxAZutdX1jGAP6p38
 AW26Fdzw2eoH5cOh38K/H7lq2ozFDDgGQDQJU7I5WHPETt4eLkN91AJIDXwNfclGtDCAGASQ8GK
 mCIb3KeDTP+P0cCRu811WjGIX8DcjnNM+3WxxfrT3ZPzPm+rakfxVYOzA8NDy1e2/lUxDxexWk/
 klYB03gCMKZAzMDK4L6nolLmsHNVBv2x
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id
 d9443c01a7336-23823fe14f8mr72556795ad.21.1750877927355; 
 Wed, 25 Jun 2025 11:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFuXPf9rljBk9fO9uMHuDT5eLJ/AwD6fL7woWfRkVupOMVq+NgBkPNYRPET7WG+oVc3xFc5Q==
X-Received: by 2002:a17:903:228a:b0:235:f70:fd44 with SMTP id
 d9443c01a7336-23823fe14f8mr72556455ad.21.1750877926896; 
 Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d868f878sm144060625ad.184.2025.06.25.11.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:46 -0700 (PDT)
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
Subject: [PATCH v7 16/42] drm/msm: Split out helper to get iommu prot flags
Date: Wed, 25 Jun 2025 11:47:09 -0700
Message-ID: <20250625184918.124608-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c46e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OSrUe6Dq-pPfCi782CAO7Pz2khR40lpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MiBTYWx0ZWRfXyHMJIK4cGiNd
 e+DVgXX/hPk4AW2q53G58/SAU41B4UREfLHfIWZb0EGYwh0EDXFyEr2HEASD9C+h4+Of0YwdWxE
 ka5RQ/cbILtUZ6LxYvspa7w2YOwf6tOmYxMRKEfuLs5DYP53by0hzj0WHlJBIWDVjcqIdZiB+q6
 oHcwrIKqfpnkNSduNI4FkAAWjUH22roMxl89O6PcvUgTsVbX6aCYmLeuylZRZaaWJEoogmvXAQ+
 6/W/lp7qKo94dZKO6J5HaEOTDOdJCXns9hXoHvnY5Vs8hCuqOtMAIT4fIkV7g1GtKxN/Yem2ggn
 k6IVcficQ7ewqHSlO3SRcngICyM3EEjBnksDLAWoawYfRsrawuSd2lASmk/h7GmCMvk5RoLGuIk
 +22rXqMJTAVtkFqnOa+TS5uMn6j5n5cidSTtdU7gDceCU8+2gSCZY7+dumgV6Yu/nttJUIe6
X-Proofpoint-ORIG-GUID: OSrUe6Dq-pPfCi782CAO7Pz2khR40lpP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250142
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
---
 drivers/gpu/drm/msm/msm_gem.c | 12 ++++++++++--
 drivers/gpu/drm/msm/msm_gem.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 87949d0e87bf..09c40a7e04ac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -466,10 +466,9 @@ static struct drm_gpuva *get_vma_locked(struct drm_gem_object *obj,
 	return vma;
 }
 
-int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
+int msm_gem_prot(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct page **pages;
 	int prot = IOMMU_READ;
 
 	if (!(msm_obj->flags & MSM_BO_GPU_READONLY))
@@ -485,6 +484,15 @@ int msm_gem_pin_vma_locked(struct drm_gem_object *obj, struct drm_gpuva *vma)
 	else if (prot == 2)
 		prot |= IOMMU_USE_LLC_NWA;
 
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
index 557b6804181f..278ec34c31fc 100644
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
2.49.0

