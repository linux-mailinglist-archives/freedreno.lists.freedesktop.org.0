Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8963ADB4B6
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 17:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C101D10E3D7;
	Mon, 16 Jun 2025 15:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq1w1Y6j";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545E810E3D7
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:22 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8fFgY022895
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oC5JJQBiULx
 rFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=; b=Kq1w1Y6jV+ZLj34FxNYF7nLVk1m
 +FmKeSKqop67aenrJbLSs6hwSg3afjeXg0tt6hvRFefVbsZaL/QvHUHcV4e+wEiq
 QlaPX5kOwgw7Ijz3KMfKau3HkRM2GCH4n5tGhod5+0G1cyMVlQgkvOzUSLYsm7vv
 b/pKzK7fwuiqUS6sUR7YHaLv72bcTHLO85xp7KVTE+qy0ty9L+AFX10nweQcz64I
 M1bzJx4yKT7ngh4nAqZC3M3+luHxD6sCBWx0cEcihHX2rQohPjoLWLKQ4BHlM6S7
 DZpvK5RFGmrOx1wxsId8LZd0E5H6VCyN+OUlfTwnb5w3mE4fM9pkNI9b+rQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvxq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2eeff19115so5944755a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086006; x=1750690806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC5JJQBiULxrFeqVoqoX6M/zLXWPGk3+0yhR9TIZ/ZU=;
 b=XzvGarpLFMW240a3Omzd7+HD0neizUOKK1/gAH1gZE9xHqczF6barqTypBpfB30d//
 JZDGierbzAa5zGTmCAySWcWRfyMEMNJwIj6FERSe2RTYf/JN7dZbSCu5RCzYSJyxPLbZ
 PfanFzlZZXvgech+ATNeAgCR19qRVTa7zXEoF1eMHwObQebpewd8meZNiguEVo9vDxs3
 LkmM4gvCv65Nmk6F78GkJ+CFGB3YTmXBR08xaqXfCNtkKKzPkiWKorEWaRuCreGbggVh
 sZKW138NEO7dLdA1bWeASYxBEpP0tbRggHmK9V1BGakW+wMmCRJtiXy3Trqw6f+5ZyEW
 zOfQ==
X-Gm-Message-State: AOJu0YwKKfQI5/1gYmP7DCRQIMRxDgChpFi3il/ZB5+nPROe16x1q7N+
 lEB5ecEtAyDABYLSo/3CGtZQx4GZvV/UDtqV031QjimeBzZq1lpSz278ifWWYDaIqBrcIsjcRA7
 JOh0FXPGl3WbtZezfJvtxeJ6MBbGkZUmgbqK5dVQIa3p+9f9WCReCsNDQIcNgf89+qKlwc+hM/r
 hRaec=
X-Gm-Gg: ASbGncsCyF92XsHKSzx6bd+/BcxJ32tpmT+NFJjkxz6QJY78fxcYFFBBrOWVYSUCOFF
 a8itGvatybU0jOlLb6YczEEeldvTAd9s3LSd4wVfKecMUpM9Hx3226AdubzMMNb6SUMnOOIaACY
 +1EM6iInRbfE9uIbmF7FrEkuhzAJ4m3wNp2ZvfepZwDTifSgc8zNNCqhhltsPxIo/g9iGgSFjSh
 8/mdqeczD3/B3QirN/nNqDA4Np7i2Ubh7T1Rb3obit93pmnWNMu4Dq13M2f7iwMcUAkbP2EHC3e
 z6PdGUxvXBqRCl28r01zQYdMMsAidnAv
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id
 d9443c01a7336-2366b3de71emr137982645ad.29.1750086005974; 
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnfSQJYXmMmDrm6U+uoX2a4jwex23BTSF9bmaN4Y4FWllhK7O5JeT0I0bKsdQT1hF7bDaSpA==
X-Received: by 2002:a17:903:22c3:b0:234:c549:da14 with SMTP id
 d9443c01a7336-2366b3de71emr137981935ad.29.1750086005443; 
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365e0d44c4sm61807305ad.252.2025.06.16.08.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/gpuvm: Add locking helpers
Date: Mon, 16 Jun 2025 07:59:57 -0700
Message-ID: <20250616145958.167351-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
References: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NiBTYWx0ZWRfX2vKnBjOy3a9A
 PPE9rnUq+ErbieeYw+gIDsoA9pRjv18LdUe9MJlQcit9eYZRzhEeebKNEbPrYhptS9U2p9mJSxK
 XNyj1TCAFJZc+pa4kH1S0LUGkpzcQmUlJm5Q0CdsPOceXh1zGgwYxUxTOcl/Umo1iGtJBypnldo
 lf2p/bAwQ6DwC8HYp0PySdwSdGViK/KHZBr/b2AP0PjTXIPEy9ra9T9h/23vDDOWh3PKvE2eaNr
 V3DlTL/8PYm1TlEOJYlrTr2eI7lqcVQwX71Gz+g56tmxziFdemoHBcIZjYIxeB+uRhKMKSNPcuG
 VPmx0uCP/GTZgWbDeaEUcjzN2rqTy9y07666t/qrd1x4XfSjEPIKkEATUalzVAZC5pNe1nZZnp1
 58iB8QIr9T8NvyEcctxSJHblEGxS12ZEtfWO4dlxje7BEpR8pS0zGm40oFoMEASfMOpJmo49
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68503185 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0NFz2o4_OjIoHHXFzJtNpQvcX5oI9rft
X-Proofpoint-GUID: 0NFz2o4_OjIoHHXFzJtNpQvcX5oI9rft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160096
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

For UNMAP/REMAP steps we could be needing to lock objects that are not
explicitly listed in the VM_BIND ioctl in order to tear-down unmapped
VAs.  These helpers handle locking/preparing the needed objects.

Note that these functions do not strictly require the VM changes to be
applied before the next drm_gpuvm_sm_map_lock()/_unmap_lock() call.  In
the case that VM changes from an earlier drm_gpuvm_sm_map()/_unmap()
call result in a differing sequence of steps when the VM changes are
actually applied, it will be the same set of GEM objects involved, so
the locking is still correct.

v2: Rename to drm_gpuvm_sm_*_exec_locked() [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..b8b0c7f028e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,87 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap);
 
+static int
+drm_gpuva_sm_step_lock(struct drm_gpuva_op *op, void *priv)
+{
+	struct drm_exec *exec = priv;
+
+	switch (op->op) {
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.unmap->va->gem.obj)
+			return drm_exec_lock_obj(exec, op->remap.unmap->va->gem.obj);
+		return 0;
+	case DRM_GPUVA_OP_UNMAP:
+		if (op->unmap.va->gem.obj)
+			return drm_exec_lock_obj(exec, op->unmap.va->gem.obj);
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static const struct drm_gpuvm_ops lock_ops = {
+	.sm_step_map = drm_gpuva_sm_step_lock,
+	.sm_step_remap = drm_gpuva_sm_step_lock,
+	.sm_step_unmap = drm_gpuva_sm_step_lock,
+};
+
+/**
+ * drm_gpuvm_sm_map_exec_lock() - locks the objects touched by a drm_gpuvm_sm_map()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @num_fences: for newly mapped objects, the # of fences to reserve
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ * @req_obj: the &drm_gem_object to map
+ * @req_offset: the offset within the &drm_gem_object
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
+ * will be newly mapped.
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			   struct drm_exec *exec, unsigned int num_fences,
+			   u64 req_addr, u64 req_range,
+			   struct drm_gem_object *req_obj, u64 req_offset)
+{
+	if (req_obj) {
+		int ret = drm_exec_prepare_obj(exec, req_obj, num_fences);
+		if (ret)
+			return ret;
+	}
+
+	return __drm_gpuvm_sm_map(gpuvm, &lock_ops, exec,
+				  req_addr, req_range,
+				  req_obj, req_offset);
+
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_exec_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_exec_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
+ * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @exec: the &drm_exec locking context
+ * @req_addr: the start address of the range to unmap
+ * @req_range: the range of the mappings to unmap
+ *
+ * This function locks (drm_exec_lock_obj()) objects that will be unmapped/
+ * remapped by drm_gpuvm_sm_unmap().
+ *
+ * Returns: 0 on success or a negative error code
+ */
+int
+drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			     u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_exec_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 2a9629377633..274532facfd6 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 addr, u64 range);
 
+int drm_gpuvm_sm_map_exec_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+				 u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

