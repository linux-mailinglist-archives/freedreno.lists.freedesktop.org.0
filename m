Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B754AE8D33
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC03F10E7C8;
	Wed, 25 Jun 2025 18:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="da29qsGv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3D310E7C8
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBkvRa015366
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IBNhqEhlbdF
 Pkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=; b=da29qsGvT4OtnT+b9gErUpruuBe
 MbPkvR/17J5GQSA0qkKEu59iIjJos0c6bbk6pvDnpS+Z5vgIHrJFUMdhpdbGb3NO
 d51/W1KvSnG1x7rltqLI1dhyr0iGKiUbGOeIDvrir2Tb9up9D/k+Pbxf0e/+plDQ
 yFcve5coFZzFE/tUPwUCZkfAtzyRTU2DhCPl9yrJQa6EmU803aME6t2pecmX7+4u
 8vL8MMpDRi7ecRqy0GK1NIGKpcI9v67iJuVvwmaKqP78U+ozmIjArTSLaRrmRCDv
 JYdLnbeMljGPI0P7jsx+ikSuuXNl3eWM26rHeJFTlcCz8BOU5I6+2Xp9TbA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4t5bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-313f8835f29so225507a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877886; x=1751482686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBNhqEhlbdFPkj+kCuKLrjIW5Ve2xstiu6VBwj267oo=;
 b=oyqhDwsTMV8LAuN6UExoxgwazm/Mu8tYYUcNCHatr7Z0x3/ZHUWETJ+frjrnh2qmC0
 ggd7HaZPIXbQvo1qD6oz+fP9DP6kukNdfRsfHndtAXZwxuHMxuNeDGe3j3b+Um2jsx87
 9nZ5KMMnzCISKP7xhSIEYJGOE8ry1eF2+RaW2whLudYiiSvDz3fnqFT6aFA18Yc7DJfX
 EjdB4lgPQf6F51rfjzkIXcwPWKiw+Vm0uLGUH5SPBsbXvk/0Z8H6YmdELPCyuE6XZVn2
 gbsTgA7PA5xmJ4FkYdBJn3uD7O9vAptv2QhVn9A7yv2ItBnNvcMFJXgkNPe8mR8qCrOp
 aRXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV26CuNRdH119CzZe9KFZ2Df3j2NinQQynJhm4LmNbDva6Yq2mL/AkBn/SSpeRTg2bA4hfnOl5n9to=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoCtXPfWA/NCmKi6Ka6fRt6PuCxUU/PfG5VjVBX4T6qb35/SdA
 D0i80gJP7k4dcB7OgVjj8PE6/rv403Qhfehm5G5UAEcCwDd3lK76DPzagDDrXr+Kzq3nz0ezvIo
 TAMp1MTZxSvmMdhq7PZ0+WJ9tW2FEcgERldmNu+xVu9mw6pMzX2vDI63VizdQnaqXRAEMHW8=
X-Gm-Gg: ASbGncviCmezZzXv8fI4hpwLzMiTsWULqa+QCJVYrT0OLI20jJMJzvFRlsHG0bh/hle
 9XqSFrS8Ld9jiMteFRvnoxnQggN/uPrqKVN8YjbX6WHHWY23YtBckDw0u0w54JmHHZ4FNQ9X37a
 eg5m1Oy44lBT5RqNcObiiQDCdp6J+Ofdlz5bk3ykWfDAtRx4qUSQ5l4ZAnuniB3mRqXKqgJ8T9A
 sUBjksh+0HNQOjpolf82iKi1d2Mu3+CO9JZRyS07ZgCAH36707sy8VUR0O6YmHHLNtf1utx01e1
 FgzuT1bxbFB8Vois63Kp8vRtroSxSWsL
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-315f2525a76mr6759988a91.0.1750877885932; 
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzUt3jRFX6LjL8FjMPCTktnh55EsI2oRHpomnsO0iMIJLz/9ZiWHSBy9AyDL9vaYvsYsSP7A==
X-Received: by 2002:a17:90b:5706:b0:312:1c83:58f7 with SMTP id
 98e67ed59e1d1-315f2525a76mr6759948a91.0.1750877885476; 
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f5437befsm2531993a91.39.2025.06.25.11.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 02/42] drm/gpuvm: Add locking helpers
Date: Wed, 25 Jun 2025 11:46:55 -0700
Message-ID: <20250625184918.124608-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685c46bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=gXmLzIc8hE4PcKHQkQgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: sWMu-plZT22G3iS4Mus3M5CBUKCg1CFr
X-Proofpoint-ORIG-GUID: sWMu-plZT22G3iS4Mus3M5CBUKCg1CFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXwdsEz3/YWMIb
 tp6ANYK2UPBriKbQB8WY2lGXyzS/eB/RwHgxM9Tk3ppycZ/+GpNdjfDaN6L+h4B/EBNuTTItiqO
 8GgQzcCLJ429S/kVVQD5mHavpDT92pOORm7X4eCjf8L1Hh9E4UnaL6RiIqzhbrLNzBiDqPy9Ztq
 +lg/jGdBMdT//PuNdZFfTWD2r1r0xrNWMrj6DWFK1UQdGyuMn6AMnbrbQPN/jc4WNLhoCGDAMH5
 kWaSNi1Da2/583oBYhc0gbm7J1x57Eedo23LB2y+dzfw1oyBDqXDxVIl7rD6IAgCJJoOF1FAo2i
 DF/D2fn6Mev2KNZq9dwNQvG51du3YRrl9GAl92tjwrw6+6paFISzgTiLPPGCnE+D3WNW5Oy9PLC
 0o/4yp8qZ9haKagnVYUzYvb68eX6lA4Ca1ng7FKT+yxGFmXziYiTy9CxDOlqjfk9F+fUAfot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
v3: Expand comments to show expected usage, and explain how the usage
    is safe in the case of overlapping driver VM_BIND ops.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 126 ++++++++++++++++++++++++++++++++++++
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 134 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0ca717130541..a811471b888e 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2390,6 +2390,132 @@ drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm, void *priv,
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
+ * The expected usage is:
+ *
+ *    vm_bind {
+ *        struct drm_exec exec;
+ *
+ *        // IGNORE_DUPLICATES is required, INTERRUPTIBLE_WAIT is recommended:
+ *        drm_exec_init(&exec, IGNORE_DUPLICATES | INTERRUPTIBLE_WAIT, 0);
+ *
+ *        drm_exec_until_all_locked (&exec) {
+ *            for_each_vm_bind_operation {
+ *                switch (op->op) {
+ *                case DRIVER_OP_UNMAP:
+ *                    ret = drm_gpuvm_sm_unmap_exec_lock(gpuvm, &exec, op->addr, op->range);
+ *                    break;
+ *                case DRIVER_OP_MAP:
+ *                    ret = drm_gpuvm_sm_map_exec_lock(gpuvm, &exec, num_fences,
+ *                                                     op->addr, op->range,
+ *                                                     obj, op->obj_offset);
+ *                    break;
+ *                }
+ *
+ *                drm_exec_retry_on_contention(&exec);
+ *                if (ret)
+ *                    return ret;
+ *            }
+ *        }
+ *    }
+ *
+ * This enables all locking to be performed before the driver begins modifying
+ * the VM.  This is safe to do in the case of overlapping DRIVER_VM_BIND_OPs,
+ * where an earlier op can alter the sequence of steps generated for a later
+ * op, because the later altered step will involve the same GEM object(s)
+ * already seen in the earlier locking step.  For example:
+ *
+ * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ *
+ * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ *
+ * Returns: 0 on success or a negative error codec
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
+ * See drm_gpuvm_sm_map_exec_lock() for expected usage.
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

