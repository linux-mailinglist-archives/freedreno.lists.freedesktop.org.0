Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2CCB1AA75
	for <lists+freedreno@lfdr.de>; Mon,  4 Aug 2025 23:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88410E45F;
	Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIvPB8cF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A337710E45E
 for <freedreno@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:22 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574GIfFo017513
 for <freedreno@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4iMQZAqx3JH
 WA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=; b=gIvPB8cFPv1IRFNTmqYWqEWuixR
 Rwv7bmlaMzqpBylwNtRi/TG3UiM5k84mwatQE10PeUBNVzoEhsZC/kEPjRmRctDC
 +4ryya9XDg//UPR17UUtiH/UY+Becav0ePCMrFVJlEzmhGQalUXJG9cFtGnElobB
 qlSlHwe5N9O8RqWjBAnqJ8u1dxf87h6e8PXE5AZAC8ytxEBqBzKaeLCFYkRG+iXS
 ZPKaXijDwUfqLCd6gmGJkhRVPcGNg/6HUPKEFA9trUtMYvvoMAgwYgrrRcN7XsLw
 7GLN1tfWws+oetwv6VI5XGTLxVbDC8BxqoxJmILgFmZRwmtdCQzjbkQWuKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc6a8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2407248a180so36340285ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343801; x=1754948601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4iMQZAqx3JHWA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=;
 b=mQJ13JvDynZyvxMk0yK+mkv9uXHkX2+v0g3tT1Qs8jfSGskTCMZs4zV/UzqB6QxMhD
 8Uv0DjkZ+iRbGcfndGbWn65+YTRjxUmKPhh0HGgfqqilPKtxw8xu0hfecbIq4CZUF+Hu
 ZR+jhmMiGFM6UhxNZl19uAkYnYPCrpM5BmNgSqpxGSeccqbV9h/OYsYsX4Owc1xpmdEO
 /J+St/ct9WMQEGawidf3wtmyIB25drO4KwCXNUFoUtAGmdphQj7/g1y0L4BYGk1M2q/y
 gzbVQVjSJrK2N/gHuztO9RxJWblhKGfmc8AUd9VZlL6nu8o2d/FtcT16QVwBar4/iXVS
 BgmQ==
X-Gm-Message-State: AOJu0YzfPXBEfm8uP80pucsUcGgWx4EuSr1/ExXsY5AMT5h6x6MCfI1x
 IGAvyI5u7Nk84kUBAH4aW6rVDMLIbK7SY6YG/Yl0c4FZoMSYIcMWvo5feIvj57ovl6AQS4/9R0X
 8LkruVokIsWMdPPwbO/eja6nWVHdSkt+mFELh80Z6s8T7B2WhB8M5feRwSnqW820eE5CSVcg=
X-Gm-Gg: ASbGncu+F1y/PcH1CvI+uHA6pGRE7HDp7Vm1G9v3VUljP7GDhIRNawJqXj8bPoRsxVf
 d7YFbzwAEL/iSyL7RZcWJYndwF6e8wtImU+IvolWR3OUy82C73DPDiTe3bS77n+PyIiaAqC5vPI
 cd0Efpr5sUOQ5l+MTcrKsmx9HMEXh05KfXGhqzpdtcwOLh9HPPh6r3lsX+a617LITkzlCe6xAb5
 X/kQHDptLQ11szIp8uZ4TRvHadgcdz4Mts0Clf5OnwJap59PyxgcKsrNSMt+YrjEnSXZc5+46aw
 Hq3vDnDAEHrFE5RFrgfVpqEd7AdHWZKLA/67Ofde8+UsV3iLxvw=
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id
 d9443c01a7336-24246f66529mr161881505ad.12.1754343801263; 
 Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ42SvcJgCxFfQN88b9q64GCmdPYqi/gv07LLosxuO/N73EtGwR8zNcDRPko1iT53bOia+0w==
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id
 d9443c01a7336-24246f66529mr161881165ad.12.1754343800876; 
 Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63da57b4sm15506076a91.5.2025.08.04.14.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver as
 remap
Date: Mon,  4 Aug 2025 14:43:15 -0700
Message-ID: <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: STKIiY_iHKanb-OVjYpf0Qg3IPvGfqma
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891297a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=-LggB1lm2EvgG5rjBn0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: STKIiY_iHKanb-OVjYpf0Qg3IPvGfqma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMCBTYWx0ZWRfX3Y902r8pknLR
 v18HGa02Zh3xg/FsYuoK55fZrR+FiZOcyLf/bF99NpvfcXp8ze+6Tqf/UbWylYECvdLIzUlOdgk
 fNi+wycSiS5OBZxIgOrQehnYlEvk0w0Hi2QnzsQYQ2eLQdtgrVr/730GXngLJhdzSsTRM3A7ZEj
 UAsx3TdQSkRdyK0RQdNvVyxTvfJfAgBnjZxj2E3JLVxEFeDraIihn35L4O8IvgGebyG55dII4OL
 YzM+X8UKWH3fBzrmrOKAE2trXfSN8aSXSZrR/EdqRrXXD/EFCEp/DiKRrFsaeQRJytKZLb+/2AR
 1W/X0rssUYqaLOIf9UTR/p62S56KsaqCbfAgABoit2z/hyyGoMqCfyRAw7cXwgSAuvc72iy5cYn
 vwIqReDCP4uEkLnOy+mHzN8IVtiopPj/swJoXEyBBflYeO4AHOF/Vmvcz4qRzEUUPwv4zmm+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040130
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

