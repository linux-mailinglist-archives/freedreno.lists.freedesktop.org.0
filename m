Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADCCBCF5C9
	for <lists+freedreno@lfdr.de>; Sat, 11 Oct 2025 15:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE2410E2ED;
	Sat, 11 Oct 2025 13:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DLXlVJy8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870210E2ED
 for <freedreno@lists.freedesktop.org>; Sat, 11 Oct 2025 13:45:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b2e0513433bso487522566b.1
 for <freedreno@lists.freedesktop.org>; Sat, 11 Oct 2025 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760190341; x=1760795141; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
 b=DLXlVJy8+DGzyfkKSDCBAnFxq/PeSBHE2UQL+HVh1kGUyYytNlQE/b3uWB0RTlpp5Q
 UZxCpnWRSS1FqpnJtlIVMqNDTOw8hxTeKFxhifY6PMlcY3Ux/8bWvudVoSNgnVsAqHQ5
 aBUSVREIsoIVq3oDvT7KHew5C7eHhTQSY+IrIfR4+pLVnJS41YqOShIl+o5L2xegXqWW
 DYRv7p92V0mlUREZXf/P/vMB4f82UhzBkdCg46MbBgTm5aHAv3JEkKUMTU1GM/dvwRU5
 kTNON9OuhWu9Lizyf1UiCbUprTvUMvuUO4jGrKUbulR3igXTobg6ynOZK6Uq4fmV1eDi
 zbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760190341; x=1760795141;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eSN6YJly2uz/i5kBQYAcGqHNw257xKcldfsRLDm9KbU=;
 b=uOxJTcN/ZaTFoZ8A85ApWVJwlv3R23kgC/A4RHVpSIqHI3/xe/utZfrUBB5fl4gToL
 yZ5s4Adp41xngBSKAKrJ/mnvh2EQEqldDMCeLelO361IL2waDeLkdjcazuerxTSfy0Mn
 se0RXCho9NkELwdwIOn87P+IyT1DpnTPXPvhsCkbGGXAATO97TNkIaBkVPEVPu5LJ717
 gaSgNYPdOEIjvrEhw+9/isIvTL5oI8tBfHmBnZ9+bzz2DMBMrPWC+7jn/y6rYvR8QEX6
 eHXGhEH90ciIV4iff2CDLbjn2OlR4V+BsdW2wzaB0GV9fRtsUQDDDM2Ask+HWCjjy+ib
 LyNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwMbq1oGN3q6q9Azi4ZxW/Ty/x4l0/omndIRrksZ0yN5LRuyaHwxFi12h/xHx15298hQ2ZyRhfSuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt0LdNUPNguC6RzwahUdoseYZzR7IO4MutmiH+KZsGYYcWED+T
 6VbQi0OhGPukDGyzyk4dSV+mUXTOlqid5HfQn1epAxRrXu90Gb8Rezs=
X-Gm-Gg: ASbGncvuNzcYTkqW0p0q7dUb4lDvUBETyjQcQ2ix4vbMUzA+Z6+c8we9h0W98d9HqLI
 ZQ9HPuVMBF1AFc9BeIzHAnce0uSD9YH5oQwXVoi6Nott6MXy5tB7zMq0BQ+3KPnTuAjhYKhLiPo
 qTe2Tl1OX8p9G5/Yaip77F47OeupSz59ZnWKRH/GxH+L7/hUF74Z416+Zv+ETB7s9RpyL+u7C99
 YpbbL3A5YJlEJf+7HBKtRlfHJBaCdOpPVUPK17D7lZ2MXOA9NnPFF+PaI+WSgnr3mgz7tLDVmI1
 zCw+mfikhBeuTAUR9o+NMXiKeuZSjTuKoo0ZSXCBsDk6VW38W9Xa5hmUt9Q8iyWrE/HnnHo6epr
 45MbeAgmeHH2tmA37yy+AB7zeAtQt44cyqAkuED1uCG/o8/vlaIGr6g7N3QvTlE4wbEIwvkQrLT
 Yfzy9KXGCxe4uCgEXEJ8Sq+7T6rkDvlp7eDZwmIOM=
X-Google-Smtp-Source: AGHT+IFxwNevxZuakuH1AwVGVUxgynpTEfjH50O/959om/vjv//gOoU0pSJRYKc+s8OpRyguD6wedQ==
X-Received: by 2002:a17:907:3e05:b0:b33:671:8a58 with SMTP id
 a640c23a62f3a-b50ac0cb5dcmr1592525966b.37.1760190340665; 
 Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it.
 [87.19.169.144]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d61ccb09sm470963166b.19.2025.10.11.06.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 06:45:40 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sat, 11 Oct 2025 15:45:10 +0200
Subject: [PATCH v3] drm/msm: make sure last_fence is always updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251011-close_fence_wait_fix-v3-1-5134787755ff@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGVf6mgC/43NQQrCMBCF4auUrI1kEivUlfcQKWkyaQfapiQlK
 qV3Ny0uXLhw+T+YbxYWMRBGdikWFjBRJD/mUIeCmU6PLXKyuZkUsgQhKm56H7F2OBqsH5rm2tG
 TC4FgZCkBEVk+nQLmeWdv99wdxdmH1/4lwbZ+QBC/wQQcuLMKVXWyRlt7bQdN/dH4gW1gkv8gM
 iPaNkpJ2zh3Lr+RdV3fF0yhQ/0AAAA=
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760190339; l=2066;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=iFYvEtWlC7xxF1kiaqDFQ3ELFe/iyBZgt0MDdURh88Y=;
 b=0JggH6t/TIHGmWfFVBv+owfEoMyqVT7mhRAb3nxyr2ha5tqUUZN4EesSAzkWYqalqgfHTvUq8
 DGbonyZztQrCEgdQZF7aL8H5sjt6yJwRvyVXi4tzO0dhOQpo283VE+a
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Update last_fence in the vm-bind path instead of kernel managed path.

last_fence is used to wait for work to finish in vm_bind contexts but not
used for kernel managed contexts.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v3:
- Fixed Signed-off-by tag
- Link to v2: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com

Changes in v2:
- Only update last_fence on vm_bind path
- Link to v1: https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 					 submit->user_fence,
 					 DMA_RESV_USAGE_BOOKKEEP,
 					 DMA_RESV_USAGE_BOOKKEEP);
+
+		last_fence = vm->last_fence;
+		vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+		dma_fence_put(last_fence);
+
 		return;
 	}
 
@@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 			dma_resv_add_fence(obj->resv, submit->user_fence,
 					   DMA_RESV_USAGE_READ);
 	}
-
-	last_fence = vm->last_fence;
-	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
-	dma_fence_put(last_fence);
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251009-close_fence_wait_fix-00e1c2521eee

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

