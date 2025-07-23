Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F34B0FC8A
	for <lists+freedreno@lfdr.de>; Thu, 24 Jul 2025 00:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C7310E86A;
	Wed, 23 Jul 2025 22:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWICn2Ap";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974D710E866
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH4hhh012515
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nwBcV4Oemt5
 w740AAje6mIColtrmwRWXKq31FSAZZI4=; b=AWICn2ApB2hptKoeZROC9GpzaY5
 SFOn2Ft8ShfZYY1eOrWzBCbUCM9IEdHDe24FI+bSASpuOLAtwDefPQXyw+GumzTq
 XbtgmrE4Q0LY4qQbsKoVG2r0VEQNCqYxMFeaXT8ELJbN9GMGuRZ16Vhe9RDXna8n
 8hB2ymR0ZL/m7y+4ew/0C5oPpUx5658CNlQpY9vHYy2onO/NEtrtjqGHZVKVF1uf
 GiePYIFU9rF+LBJ6QgPeS1RS56CYyEn2fg8A76CaTbB6hh/1HzwC3EwFXb37uU+G
 2NCM46UhzpjmsQC7BLbu7sUCnC9+k5Yy17RjQxfFoe1O25R70YGAt6lLJ5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na548s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 22:12:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23827190886so3132705ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 15:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753308745; x=1753913545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwBcV4Oemt5w740AAje6mIColtrmwRWXKq31FSAZZI4=;
 b=diJ5T1822JY8PLwkC09SqCXF8+owmo5hWLrFHLe9HigUKyIYu91UJ9gBgKsV/zhVZj
 l3EsbyxRnwe9ayTkR/ZVT5du6S+lz/CGFH6m3OlqKBrLSSkIO8Xi9Idaghnohk548+ux
 J+v7FAk64Ncdx6B+PGJf6U3XXDuOYymvJ0ANk/p6zKFy0OwiXqSnhv5OCRpL37kiJaMY
 G/23Qjhw4eQWEA7RNrz51DbxJFkW+pbEdnVegHLClisAjNSPkcrZvWJxlv+5+0ihDcIn
 2c1hZsNJQCEIiIQ1UT5t19LchFyH53vJIq4z00Qe1+/QmAyCaHdLXiUTtKpCUHjmNTAV
 arXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQxISykKxZVbUAz6p2gZjS7Ooi6RGXZhprypton7RE4Y3Sx4sMh6gghluj484aO4z1k4Dk6+ei8O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl8hRHTn4NtWLnAdfzjohsXLsnDguZuLzeWkq5wlPMj4MrZgKx
 5QyUO37MJE8TLS35KhAVUGbiLjOSuVBYIrgcyM5DcQhhJbOyPyEX/D80UE81sfc09Bkhuh8+6B6
 kcKa8LFDnhSrYCl6gHHXXZu6p2W+8IxNx6ajNJT7VijlMr9sBeVeGRn8K6EWmiKl+qULuciE=
X-Gm-Gg: ASbGnctecb9jvj7IKQ6LNYEzI9MvoEBkm3oi0jwuWuEX63pi/5lWAzebxiePkw9wra4
 2GcP+ZwZjbccH4lu0iqVbMuyg3/zGz0hhcRr5FpomD4VS8LQzkdZMg/Ps0nV64dswwG7E3o7Cy4
 oxY4skpgtsxWu4MFbCmwaCdd1dp/iBs0inHfJXbm0/FYUkFRxg5aeaCj6S/6y5e1gxgVCirvbB9
 OYwMhaUYtHne95+ZcyjkBygrZaMsO0zgGBvsqpQDu5Y7F09kQDe0lGB7Grv2WYNEkw2ucDuLcJO
 mjIaXHgwxdl8O72Hl9uor2YIxk1BgYQcoEbwdY2RLs1a5CKnUYI=
X-Received: by 2002:a17:902:e943:b0:235:ec11:f0ee with SMTP id
 d9443c01a7336-23f9814207bmr57803225ad.14.1753308744820; 
 Wed, 23 Jul 2025 15:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkj+Iw99H9WbS4Td45rekkyuGG7wRyakRiLqXabI0Xe5dEzjqYnRgG1GK9hr915l7+gNcwMA==
X-Received: by 2002:a17:902:e943:b0:235:ec11:f0ee with SMTP id
 d9443c01a7336-23f9814207bmr57802895ad.14.1753308744415; 
 Wed, 23 Jul 2025 15:12:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48fa0f7sm449255ad.169.2025.07.23.15.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Handle in-place remaps
Date: Wed, 23 Jul 2025 15:12:12 -0700
Message-ID: <20250723221213.36325-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
References: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i3kp_jy-LUwiYHDH5C8HZ3gWcu_j1O9j
X-Proofpoint-ORIG-GUID: i3kp_jy-LUwiYHDH5C8HZ3gWcu_j1O9j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MSBTYWx0ZWRfXxxr7WZxHMdkn
 COtucZ+4cBwJkFClLzs31OUqoDf3q1gWnel4hfZ+juaXtG+XmSI+KEaIANa7MLyMOXEQ9hG1EqS
 WZgjOy/UP6oREXBst0vOWO5cy4FBZzv+vbqF2HfEynG/Uip8jvJva8xTNbZUEWyz2ICC4WdjFhz
 BgoG5E8FUo7lA2UPNnZvpX6Zngulc4AQEsTGwWbJFtJmnfMNAxBCg3iMSzfu7gJF7poVHEEthmR
 4/59nxneYIOcfOAq/SQgoq1YujzzjtTZUFZHqUZH+0uWzLH8xGA78RiSLUhUDJ8wxRB8DFu3TgT
 0QDw8as4BXrCEW6Epwtncj2DhlxW2RN0deHwBDDeLPm/Pk/+QaWtG3dUu8lhtl1W9KS4yLWaCCz
 9HssViCJhJ5ukkHqJEciKF062KWoxmiUVGBBU+gJffZf0fW6tpoggeuv3PCZnwFCvXj1tZ23
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=68815e55 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230191
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

Handle the special case of a MAP op simply updating the va flags by
detecting the special case, and skip pgtable updates.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d4b1cfb3aa03 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -519,9 +519,10 @@ msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *arg)
 }
 
 static int
-msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
+msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *_arg)
 {
-	struct msm_vm_bind_job *job = ((struct op_arg *)arg)->job;
+	struct op_arg *arg = _arg;
+	struct msm_vm_bind_job *job = arg->job;
 	struct drm_gpuvm *vm = job->vm;
 	struct drm_gpuva *orig_vma = op->remap.unmap->va;
 	struct drm_gpuva *prev_vma = NULL, *next_vma = NULL;
@@ -529,6 +530,18 @@ msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg)
 	bool mapped = to_msm_vma(orig_vma)->mapped;
 	unsigned flags;
 
+	/* Special case for in-place updates: */
+	if (op->remap.unmap->keep && arg->flags &&
+	    op->remap.next && !op->remap.prev &&
+	    (orig_vma->gem.obj == op->remap.next->gem.obj) &&
+	    (orig_vma->gem.offset == op->remap.next->gem.offset) &&
+	    (orig_vma->va.addr == op->remap.next->va.addr) &&
+	    (orig_vma->va.range == op->remap.next->va.range)) {
+		/* Only flags are changing, so update that in-place: */
+		unsigned orig_flags = orig_vma->flags & (DRM_GPUVA_USERBITS - 1);
+		orig_vma->flags |= orig_flags | arg->flags;
+	}
+
 	vm_dbg("orig_vma: %p:%p:%p: %016llx %016llx", vm, orig_vma,
 	       orig_vma->gem.obj, orig_vma->va.addr, orig_vma->va.range);
 
-- 
2.50.1

