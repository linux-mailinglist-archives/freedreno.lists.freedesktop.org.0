Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F9B0FC87
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 00:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C910E867;
	Wed, 23 Jul 2025 22:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WH2Qal3p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 509C210E867
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:37 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGNkIq019654
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZELAXz6pi1p
 iurD84MhBWtClaTyOdSezyB1Jeim0QzA=; b=WH2Qal3p+RSmJGpTQU+BzLQTAhR
 xcroTPq2W4RSLcU9LWJ6C/zOlzRsFj1FyvukNxvSsU3I0Vr/syn8YWXUHsZiFrz5
 qN3S0IehHR60iwRZmiHZk6+FHE6phaygUMYvtaTbTw4R272AEBtlSCyLN4yXKutb
 z3o0Ods6XELRTtIV2KhB4dFk61xQMfnp2exYrruytEZIBE/y/fZOGZKWH3QFcsn9
 GXKePkOQ06I3WqQk5LgK0WOe1Lrh52QSHhS749CryYQbX7IqJ3es1JnzqBtWuk/v
 ZrMq6f7vX9yF/DgkXHLVkI08bMqeRgmwbHaDTv8lrLEI5+aR+4ibuiNqCug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379rt7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b31bc3128fcso575462a12.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 15:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753308743; x=1753913543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZELAXz6pi1piurD84MhBWtClaTyOdSezyB1Jeim0QzA=;
 b=hGyDwHfAo6CiC6TYGWfbZEKREFRQhhTWioHra9qULlpOZwvLP9EXwj6pskQJdy4Q12
 pqOtyUjBV2IiV1K5YdEBetPFWOPI96nJGQih5PFOLKq+im89t85Xb6784LijUTl/r9Cp
 /SiUUPdzDy6snd+tBXQgYtqjgQwsLoOtIGSL1s3uPngnJ7XIpEp+AeoeTzZibVQFVimY
 7LRl6XjHLn0PDlEV/91Fv1LBfywOc2SIJiZmKonla10RItldaGYjU8MKdYL4SqNOz6cD
 ncnJwBNl/rTd1xuN2o5+VMOmdep6Ah3emtKyMTsGuJ9cYeGSnbXZvCXbeTsPkYL5wK2s
 qOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOEWTtd1+MO8oLUy2f+vdjPDUSuumVqRqgzA061JNWPeG/H9uQnJ6XQrVUAwVKnuMX8WTKfK0XZ4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzcTdTTWC/YrYl+KpXXAfU9ULzRF+2Y1bCW2iJTNsYglM+7Pn2
 uLZYxBNExRv+8APYTNH1Nxk5OqoRzucnu1v41zQunyRe80GhQkCD9Vdd+JRCbBMoo7IFPnUAm/f
 PPpHMvnMwAefd5KEqfAJRFHiFNhCn66E5jJmj+iZQgZETFtxxINDvCX2yA3XWvaS/6Lgg6f7dw7
 YZmc8=
X-Gm-Gg: ASbGncvCv5tEJoSfi861vxjUCXkdbSTqgsY2Ptqk1KQth7SJHhcsldBjQcHSLRkOueX
 eV6dN3CDTGiC2AEzbAHn/piuuDbvXZ8S9sq5ajAB8D0Ujr5aUlY8IEcAXxYATKKrqqb+vv0ZYr+
 ZTC65LciHlrncIwB9xc5Fyeh69kTC7FitfxWNmam1HVZUY3jsargy99VVpCrwm9YlcTwB7WNoTQ
 R4qD8/ms2V1LpqBq9YD51twZUBm0hchhQyj7I6gIEhe6oVOUsNGos+0ekZQTRxD7tehItVijBA/
 3G+0mD8hR+0f/ANDm5G/SWiHaiYwIorSGNS6h6D4+NUq8HHPZYk=
X-Received: by 2002:a17:903:3d0d:b0:23d:ddf0:c93b with SMTP id
 d9443c01a7336-23f981b5ff3mr53931415ad.37.1753308743459; 
 Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPg+91DANEGZGB4JkXB+cUWEzypyPnxOCrFXbrqyTcN8cw8Ruqrae2h0FkcANM7PlMM5SM5A==
X-Received: by 2002:a17:903:3d0d:b0:23d:ddf0:c93b with SMTP id
 d9443c01a7336-23f981b5ff3mr53931225ad.37.1753308743040; 
 Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa475f3d3sm644605ad.40.2025.07.23.15.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS)
Subject: [PATCH 1/2] drm/gpuvm: Send in-place re-maps to the driver as remap
Date: Wed, 23 Jul 2025 15:12:11 -0700
Message-ID: <20250723221213.36325-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
References: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c24Cpn1SqDRDcqAvdvAT5B3ea7foDX4o
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=68815e54 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=kOSSLaVpcPouW256lEMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MSBTYWx0ZWRfXxDTIwTuaselw
 SL2Q+EF1QelriKvwFR13IdtwqtBXzAxdco2U4S4PEf23X0h5wbaZsprsO33nfhmQAChF2vyjtmE
 mLscOEo/XVEaxTtrne5M4bZa5h1qceBQT4k9942nZ6tUqXw3WaRz0CTmPPPzuSIuSf4+iwSH/FA
 sA9qZY57kTl5TrVQ+2eZE4mNYhMNZd43UOUYH6bBr0rnXPIuuqMHgoB/iDIdzksU1g8s8LNOmGR
 xxnKDmBAiJpgtd1ASS0jXZ9N96bVf2r484FOk7g7JvrZu6HsOyOMkjRbycvpzXSSwFeOsbp9t7o
 d6iXV7KgCBUO8edbDZBnCxyTZFG7SL3QiLp5OL/t4jMtJsvofYlA+6yDkNkqMyIWfz8W4gjIJ4d
 N1WDvU0FFBEUNUcB7ivFwNFXdZ7R3HPxRzfg5kTstRK7vOFJ8Ju5GGJeoIj1KQ/WiBhKLasI
X-Proofpoint-ORIG-GUID: c24Cpn1SqDRDcqAvdvAT5B3ea7foDX4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230191
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

The 'keep' hint on the unmap is only half useful, without being able to
link it to a map cb.  Instead combine the two ops into a remap op to
give the driver a chance to figure things out.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
In theory, drivers should treat an unmap+map combined in a remap step
the same as discreet unmap+map steps.

AFAICT nouveau is only driver using the keep hint, and this was missing
for the remap callback.  So I've added that.

But this is only tested on msm.

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..e21782a97fbe 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				 offset == req_offset;
 
 			if (end == req_end) {
+				if (merge) {
+					/*
+					 * This is an exact remap of the existing
+					 * VA (potentially flags change)?  Pass
+					 * this to the driver as a remap so it can
+					 * do an in-place update:
+					 */
+					struct drm_gpuva_op_map n = {
+						.va.addr = va->va.addr,
+						.va.range = va->va.range,
+						.gem.obj = va->gem.obj,
+						.gem.offset = va->gem.offset,
+					};
+					struct drm_gpuva_op_unmap u = {
+						.va = va,
+						.keep = true,
+					};
+
+					return op_remap_cb(ops, priv, NULL, &n, &u);
+				}
+
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..c3e3a15eb3c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -820,7 +820,8 @@ op_remap(struct drm_gpuva_op_remap *r,
 	if (r->next)
 		end = r->next->va.addr;
 
-	op_unmap_range(u, addr, end - addr);
+	if (!u->keep)
+		op_unmap_range(u, addr, end - addr);
 }
 
 static int
-- 
2.50.1

