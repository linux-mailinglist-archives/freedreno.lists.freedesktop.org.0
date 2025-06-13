Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80FAD98D0
	for <lists+freedreno@lfdr.de>; Sat, 14 Jun 2025 01:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC0C10E9C8;
	Fri, 13 Jun 2025 23:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fo+7wYcc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541DA10E9BF
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DMdK51017607
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=yLq0/X+CD6R
 T9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=; b=Fo+7wYccuOU6D4fAhl/PvOjGLIP
 dxpZ8MzY6HuCkuWEoRFn3mDyXtTNJO2gRDA7NknZSidV8idS/A3pDu51LpzcezWe
 cpvjM7BBflAReKPPZdbY8PS4psN5wD0YLFjFDNUBGqaTLwtpXL5BXKa00cFP1u5p
 ExFK1iox+1etOzdWynPZyCsOLQFFufxR91lJkmwI23sep+tfdokNVnw0U/E3c/xb
 /RUxiqte4RXIE3X9QljI5YzK123NvZ4oqZtBfqZ60u0jTXjSnhWC7p4TxctHgcxK
 r55a5AMp5TFxK9Tg1Ba/AZ9qvZ2ZpYzdOUOAqYeYRPCMZbQfeS7KrXaWFIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcvr0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b2c36951518so3085620a12.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 16:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749859033; x=1750463833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLq0/X+CD6RT9BCguCxV4sLsi3w1/mhgkTuVhmBkydE=;
 b=c3m7lOaH7OMweOI8tMcfV1QAymYzxJsf+G54Hlu2rwxcayeze2YDErvKjkw0Jer0zX
 tYXD8rkQXfEaZIGbQ8Z4e//9L7XlFpF4aoheBo7gr1ivujCNVWlUIG888lVLDD3YwFAf
 fMfilSk7C4xIvEAOUPrs3vLSLFFvwYANergL7vCcnnEe+HHDDC/ydQPW+qHypP0+9l9a
 eeIAYvBrQVe8qx8QE1orLcUehFEa/t6ixHPkC3Xd41uXDTG41yjhpdaHQUPM1JWTc84p
 0EpItuwoCUwRgtzT46YiAA3SesAouhLTispCYeTX0Ckmh4ZTaMVurV5OvvzQQ393kYZL
 BZ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVev4wNLB/U4UUENj4iopjKF/XSDCywRypPwDvQslDzlmPiWIWFJ/1ddLBcn4byHwUeRAbLxhC/Do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYd8rDXFpr8kQuq9i7acxSt0CU1az4QOkysUlK8bKvhbVXmkFS
 KqIHqjw++laygwGkvYbzz0wTytmd29S9Xiy+P0VTEZMpQib74a7r01e8Q0NwhvabPlxHAkDFDY3
 qI6sPcJLfdgxK6BgsHOc6I9lIjaTI5CQaOf84zttWYpH1LB+aH7cu6t5IupJUj/zkZ4zZJP8=
X-Gm-Gg: ASbGncvXJDfQd7xo0SqJspfltL3V3agV3dOiHpwU/axdbZxI8jDiSRJSartIQxmSDiE
 ofkjZibXWo78ViWreOTouFxX+R0eg7fjzgj+3rWbj45VYF2M+rqbsf6W8SmjAGgddI5GK5RIgOW
 gyP/T3n3/nt6siWGiBTJFAzR7Qj0O3xQwzSn8InlwccIR1D7P23e6aQobg3RUl6n0O9+4DjX2fd
 cXGAAcTTaAuqzkiG7C0ixxBSTFssOCX04tqJ53mRTbYfGDTVuJvJlU/mxSmhcq++xYvGwY8e78U
 ijs7cpoX79jLAaTD3aJ1vF65JHJs+MqB
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id
 adf61e73a8af0-21fbd5d4c35mr1592010637.38.1749859032711; 
 Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEhTcTitEJ4ZlWzhRai8zzxxCScgdvvoA2BJ4VUJEL84zgtN+jTH9QJ8KF6Xuy0gdvRZyX9g==
X-Received: by 2002:a05:6a21:9991:b0:21e:feb5:9cb8 with SMTP id
 adf61e73a8af0-21fbd5d4c35mr1591977637.38.1749859032214; 
 Fri, 13 Jun 2025 16:57:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b30948eb78asm1767813a12.28.2025.06.13.16.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/gpuvm: Add locking helpers
Date: Fri, 13 Jun 2025 16:57:03 -0700
Message-ID: <20250613235705.28006-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
References: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfX7Me2+RXkwJ5m
 e9Gy8Gn1Q7Mwf/hL6JBFUynI/AxtztgWgCSynHgIEQDAm50Mg9qu6RFQXIWnDN9QES19cVAck61
 YeEz3QyUz9acLuXi9fSWR+eXA8hPUk5YWMMXexykcpa5lvY8zW1nJfEnGBAfZzeW0GYUBnQwDLo
 AF7sK2CwbkeJbvrz5eHmLaWL9n+fe3DZ50HntxHnrR1XL1HmXIlCtlREK5hvZkGkRpwqHL530EE
 VqgpKdn57OtoIC7tSDN4KSrUo6jtlNHiNyRM2IPhtRP1oUBY8LKJhP2gtg+cpYFq1jiXS2rH+CZ
 TJhMPg4dw/JhbI9kjK5BZeLCW+ri+IeGAARErC0k+j7p2il4RZjROgsoUET995FWjkzgVUmXNPZ
 ZSKsqNR+v7CgRK+CiJPkT6YsDl/cpbs+KGmBeUxILJe1nmp7Zn6aCP3IYJRXCEFmrherbRAl
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684cbad9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=J2tNMqIfyHcHeXEe9QMA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: qFaniuK3TLiMY1gLlcXOwSV1VKnhuI0_
X-Proofpoint-ORIG-GUID: qFaniuK3TLiMY1gLlcXOwSV1VKnhuI0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130177
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 81 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..197066dd390b 100644
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
+ * drm_gpuvm_sm_map_lock() - locks the objects touched by a drm_gpuvm_sm_map()
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
+drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+		      struct drm_exec *exec, unsigned int num_fences,
+		      u64 req_addr, u64 req_range,
+		      struct drm_gem_object *req_obj, u64 req_offset)
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
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map_lock);
+
+/**
+ * drm_gpuvm_sm_unmap_lock() - locks the objects touched by drm_gpuvm_sm_unmap()
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
+drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			u64 req_addr, u64 req_range)
+{
+	return __drm_gpuvm_sm_unmap(gpuvm, &lock_ops, exec,
+				    req_addr, req_range);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_sm_unmap_lock);
+
 static struct drm_gpuva_op *
 gpuva_op_alloc(struct drm_gpuvm *gpuvm)
 {
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0ef837a331d6..a769dccfb3ae 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1211,6 +1211,14 @@ int drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 int drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
 		       u64 req_addr, u64 req_range);
 
+int drm_gpuvm_sm_map_lock(struct drm_gpuvm *gpuvm,
+			  struct drm_exec *exec, unsigned int num_fences,
+			  u64 req_addr, u64 req_range,
+			  struct drm_gem_object *obj, u64 offset);
+
+int drm_gpuvm_sm_unmap_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
+			    u64 req_addr, u64 req_range);
+
 void drm_gpuva_map(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va,
 		   struct drm_gpuva_op_map *op);
-- 
2.49.0

