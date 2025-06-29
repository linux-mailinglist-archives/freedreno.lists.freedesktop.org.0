Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC0AED062
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 22:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6677210E362;
	Sun, 29 Jun 2025 20:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4u/sYh2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C489910E35E
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:30 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TI0P3m023812
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=gBDfAmEkonF
 ZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=; b=e4u/sYh26Nu+yUfdzM8Vm2zWilv
 XJBsX7EHwcKoHwP8YGOgaSdTUZZ2vzfbSEGoboK/KdGO1Z8343Ihc4Wjw4yxmsMD
 cZN5TwIeKJDgr0pv6b7dayED+I9nWDQdu6/S9NOZn9VMO8Ml90KzkDNGvglE7QnR
 z88U9I+Xw6H42rEGwHzV4THbVlu78CBK1d1BYeqXKxZoE1Tg/ODFQL6Lf5RXqDAW
 28tic4tDS5qdoKNkmzTFgGaBXpmEe4tgjFbS/JxU1Gd8Y3qYVjjyxWnlgN6Xktsk
 Dugrte7Vxjnrtf+lfibvnFa7rd/VL8o0/Nn/LIIX+TLVXX1C2ImXfjo3vNQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm2msd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 20:16:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7489d1f5e9fso5710921b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 13:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751228188; x=1751832988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gBDfAmEkonFZxrTQANE1o507a0jHlpQ+o9S1Q9lveGU=;
 b=t/mUfHXZLjDDCo1ECGVjnF5m0D9DYfs4ugjxa2CDD0psx896ELXxODovecGpGL/BS2
 /12t6uZ7hbStpWXbN2qT2md8cMu4rZS9bVoplhPq8DsyWieEihwLM923TllTMZ0Et1OT
 eP2vkcCp5CKNSvbYUXehIvFhr7oRNa4tyeuGxPgwjvm2bfOT1EFAVQ5hNK6lIFD+/Bpd
 IQu8qtzQj7PYeEy9zJ+VWyHOIRSmwL/zg7o7Zni4lBFimbzixMZG1U7F4IGYOmimhhNu
 G0n7jjcJpOlUJOZW/mtBi9iu7dyG1Osl8ZCZufHeCriZITOIgaxPX8inXyvU251IcKsB
 ml4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4w/mNMKL5mGUIItO1yRkIOww6N/BbeuRVzqZpNSkK0WbTT9XPEDUtHE3CjGPdUgyGO9CeZx9e1KM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW4iCsV/hOmQ5wRJSz9O4E66g6SnJ7z2XRX1cIrFMto0NcHPQP
 ya+Bj22xe1fl9E/z3WZ5eY0THeyQRSxymsgFBXHUPcheoKPPMvubWEtrRf9yTXIypooMglaAtLB
 5EewUcPK3G+7doIcgJ9Pn5LetUc1nHlpgIMqJMr+UqXHg+97ZuGhBPgLqe0sBOgrpBzGtwYk=
X-Gm-Gg: ASbGnctdz3qsnYXibR05p1We3JOYKNAUvgxyOQ+lVtFxrOQ3CjcKZ91EyNQESRZ3Csa
 hiSlliFwySEQIbfjBSZkaZP9nLAb8Fk2oBIBhVRaJK2wDSaUsZ1+G3lf2yBmLFbMYALAFc42m5c
 sinKIlmvZv9NT3x8zABa40S2f6V672+Bl1bK5TWLgzwPlNNpbjYFJtZlNornHS2/g8zf4dcT7hX
 TQ/z0LZwDKgryMclr2tZe5B4bEcHXncveJkr7v1bpNQ6ajQPBB1/Ra+ApwgtfA69Wg1sElNTRzg
 7pmT9hyD7uMHWqlGEojYHxsRzUGjK2uPzw==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id
 adf61e73a8af0-220a181b968mr17871080637.22.1751228188452; 
 Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxxbBSzM9ICK5hml2CqQZ7X32XpGFPJlqTsRIpEN5BqVeVXDnuT+nk46z1uPRQyZhJCmaLVA==
X-Received: by 2002:a05:6a20:6a28:b0:21f:53e4:1930 with SMTP id
 adf61e73a8af0-220a181b968mr17871048637.22.1751228188064; 
 Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541d233sm7603622b3a.61.2025.06.29.13.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 13:16:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 12/42] drm/msm: Refcount framebuffer pins
Date: Sun, 29 Jun 2025 13:12:55 -0700
Message-ID: <20250629201530.25775-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68619f1d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: ukscJxlfNUcH2vFy_dmtc9Vuxin-Wa9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX02oVrbarL4ee
 ZuGbVDQm05J+z1zqFfQESIz5UeZ774dtL0canJX59J9QuCaLyoF6a5OXBUeIt0JU0e/IlChMLh+
 uNJbNf+FnNw8EGxPclX6U5EscX1zoDMuo9ndLz3SqFrk9q6UmV2yA0j+shc+Hwe0b6jNWazir+t
 lsRtb51tkexd3d5VovoNApaU/DMqhQZarWbZTkK23lqqxmYC2PUxtj2R9Li2aOHZKxMvAJUplj2
 Xn4NbN1deiUzqJLWaNvNfGAJakz94h9oYiar3E8N/txpzdr84LIWtRcghOSImG5qeXX20v/aluJ
 u1nUxRnsW4ltpSAZp6grDgkH8WbqK0xzrdZoulbswTRDmLnPXOOlnlXXXfiwUFbuwXE+XTVMdah
 GEGWtNSobTrsVkF39tJYThU0iy4WLdw4BAG9mgAgySK47FOMYLkUyBjKf12Dn/pb4eV9hUzv
X-Proofpoint-GUID: ukscJxlfNUcH2vFy_dmtc9Vuxin-Wa9X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.50.0

