Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B72B1AA76
	for <lists+freedreno@lfdr.de>; Mon,  4 Aug 2025 23:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36E210E5B8;
	Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+YzSNwr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24C10E465
 for <freedreno@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574FbmQX018005
 for <freedreno@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=nwBcV4Oemt5
 w740AAje6mIColtrmwRWXKq31FSAZZI4=; b=J+YzSNwrVx5QkBv3++Hw3EluqR1
 qWxOSWwL9oqpkBTSOLSuhyMAVAiSqYlze1z29tUONI+9grkO9n9vVIy5wHLNaPBL
 cFx7xN3QSwN4nJDjBppse3DrOLfn0S8lKBpceSQwJI/9V0n3dd1PG56TgfT5KDe4
 7j1uHhvQB2VcvcYeBzo8KrlbxFvdJDUqcObF1s2WHWiOOUkDTvkcvTou4uHWx39R
 uuMpxbt4YId8LIROoJSwDiaEQDxrFnA0bKserOJ2WggiK3MHIau8jX2OYumKmPDN
 gOV8f30JLwQYwAov1Rl9rAYQZgkSDFErp1j4acnbHX56KAvOuzDdgg3jxEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489bek6b3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2425364e0b2so26233245ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343803; x=1754948603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwBcV4Oemt5w740AAje6mIColtrmwRWXKq31FSAZZI4=;
 b=jlpx8L9xsOQX0p+kSHWgLytZyGYvqUlr/j51TVVqlYc54oeSirZ6NBDwSqgr1sGOrv
 xVgy3xbjIZcM9wTv04jjb3CmpfqsV6ho/DRKkTI8Lo4nEciEyglEDzJg3mUCCypC9xe4
 hkXj/NqdkOnHL6Y3L92NLcb3Ap407vd7bDTqeC1ObpfUao588XcJevebE5F6lOaTypqt
 SqVOhsRmP4TF981rtKBtmw3oJkT3Tmy0yzZ4cho4wFFKAQ1cm9wlfZbEYQuWKb27cGll
 p1ulbIxjZw9r75kKoJdukBhhRdD5DsYYeH1BQwc3jTOWcDCH1GYibX5adI2pCAPK/N7s
 orQw==
X-Gm-Message-State: AOJu0YwxLgLvCDXbnF/Gf4/mkHH0qHLR2jiJix/4ANdctKrXuyvPJ/vg
 lgnbljxEF6WuydHekLp3bR+Ssy6S883sTmqmM0mG00dJAI0FUfSK4aasQcQ8GXPyYc3j+DOhNqc
 9vwunVAhS0zVAIFTR8fQidVNwgCB3Xlwt7F9+DL8PTQhTKY3oP32Q+1+Kzu7JL5hXScn7oHk=
X-Gm-Gg: ASbGncufd64l4roAVNo39P9xIYh1Apq4ytTc1NiNzrFUCIioFV2mzLe7UO5vUI5YWQt
 RlvbpIJdSzIk0OFZ1n7X5EONZjJbcN7lpyuDREAFLMZ7gsC5Qo3VtWfAuyPgxwAfEHpOAFFgvBD
 W51vpo5LHa1ic1sQayZicXeHCMA06RsRx1ZCEvpD9hwNfnBhDifn7zVZmIXe+ayYKRzFckEh3Hf
 /B3EKtYDJlFJHWoXqkx+n7bQ3MN81BoGhGpS+LS00CYm1ZI+5sNYPRbrecscEiclnsDoCvujQv0
 n2ccoOkIV+PoKpY8y1Qzb8RU08M6ak6Ak7Vj+GPJl6yTXCd8Dcw=
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id
 d9443c01a7336-24246fef44cmr85653415ad.35.1754343802681; 
 Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6a9/8RPndKLMzz5ytDiVTCVnElsJWsamSeHzO2/TAvn6vk7dklmlUiRe8K/yjPhIcb3dkYg==
X-Received: by 2002:a17:902:e0d2:b0:240:49e8:1d3c with SMTP id
 d9443c01a7336-24246fef44cmr85653175ad.35.1754343802269; 
 Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef5fbdsm116628865ad.27.2025.08.04.14.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND 2/2] drm/msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:16 -0700
Message-ID: <20250804214317.658704-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M7tNKzws c=1 sm=1 tr=0 ts=6891297b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMiBTYWx0ZWRfX/55ZN5uSyUSW
 QByZO5QIxz+kd/dMC62rET9hiYP8pGb1rhjVeyIeE9EUErq9z0tDI0CfAIr2glBGNnaVJNUMBLL
 RP5q5XKQp3FTzTJGf26am2DKaIkiP7vUIls7vEj9igLeUoN0dOwTgHHhcc2iAsZkDw/ZyB60kE0
 G2bkXBzkC8fyBj826+GaMki+HLeQGw9vVHfY8BPIgt3eYyAWPT4GRwxZSJBSszVULGVO0ZSQsTq
 V6KTM0oVutNQo5I2HQFTLG1FJWDcgVNbdH5x7YtSdyrn3AoEcKYzeckeHctYCFczPXzcWCyRcrt
 iieQeBryCTFHWYKnp1GLleJ7D5WfzTCajiYp63nqx7opw5s/QeEke3ckaVejfJMcE1rvpw24HGZ
 ZUvrfxgKnT4iqq8GVM4s3zxmAotOejY4fiES1J+n32pjfwsGWxkyWFBjQ/Jhn50gGNh4iKzs
X-Proofpoint-ORIG-GUID: EGRk9l_ORomCjFcPqBvV-XYRKPerfr6x
X-Proofpoint-GUID: EGRk9l_ORomCjFcPqBvV-XYRKPerfr6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040132
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

