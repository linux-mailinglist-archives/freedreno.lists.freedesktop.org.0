Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A3EBCD8EF
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 16:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F87210EC21;
	Fri, 10 Oct 2025 14:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CZ0B2/ZC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABEE10EC25
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 14:39:50 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-637e74e9104so2853810a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760107189; x=1760711989; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FwwnIs4n2nwe2j9PHCbA/jSqUczTe3Hq9okgytcenuo=;
 b=CZ0B2/ZCFoBwwg4maLThPFpZLH1RwTrcfvt0QIVniro3fofCENrJvBa94+Ds27x2Y3
 mjKpT4Fl+7udfVOFIlfGxGP+BTGZgjFk9b8l8LPKmxzfSj2W5e8u77cxEQ18z4QGayAk
 GJsamIxy8bDfaNp+gTnW3sPRY8JDrLW/vgBuPLqdF9JFVU2PPigqbWV+pGhFPgi1Pty3
 YKap766tfa1UayBNMzpANQZk65Eb0zOblgBnJi8y5HkjPTwKis7EZJsEdjFYU0SRP4Qg
 ERhGss5l9liyy/FV83hNsBioH0i6k1xTVKMuTQ3tks4Jz+dBYWzwdh9YESZMeqN7TzhT
 /hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760107189; x=1760711989;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FwwnIs4n2nwe2j9PHCbA/jSqUczTe3Hq9okgytcenuo=;
 b=jcSjsoHwvi96TiTOV+xVuNKWYxsF5Uk3Beonx5Oipcvcakd5+4JTrbb99ME+8ge2W0
 edahQDyHN4gT3CXeuCg46LopDKJiCgPecHjvEuCrniZoMbQY4JwbrNZRjX29553pBmMV
 pv0N78bkAaFwnb/S4kZRn1JDvzYJ4bMXgPvLMZUxXI1xaPusSVSbhJ1x8VRP8Dbh24xg
 37jkBV7mj24zRKv56Acv6IBwj3cubHEJKJQSRUXR5i6yI0u/Dh1maRkp/Zc8I4UKpMq3
 spTBuUwOZq7OAP3td9/Bacq0bTPmCVjILhEFvcm9gI0hbYnVhLwOJXZyaSTyEb3GNnrS
 3ELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh8DuHI0RdAmI+4UjQU+jq9OL6QVkPCNrdn1+UrO29LRXmM3dMXRiPVTn16kXciKY1eyhimhKXt5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7aqzIoX0NRDD8NlYJSvmUM9H8bMcMyv+jy5h+4uF6hBxCIJ2O
 l8s97Bi2tCJKZkNsdNc0WTKY/1RAq/pQKcrIxbNL7yMTHbY7KMvCzGs=
X-Gm-Gg: ASbGncuGnvhja7dbocbC1pyfe/fJ2anQw8B4EqWLnc6kk4pYcnYIIJyN4eqNgkrLV2o
 JYiy8ax0jbdVuoWgRoy2d0dJu9Hkzgj0YGxxK72qTt3u90KYmibg0k3nho1sRcGzxsDorn/cdWK
 4SaP+ytNGpDqIMlBZLQ070CPs/+s2vIvbPscR6l6CPN0b6v59KafRsrb/FT/F3KHMDvO3hsMDML
 +GX2C0M45z7kuZnYyTiXYxiHuPt3qeqWQ58vFDxxpl38XHLiBOYTLlixDnApFvYaa5wzrXzWOgw
 jDTAjt3RyWI6LajdYYBmCt01Uclig59icI1h8YkbHrgreYfgVlGMZ9Oin+m7HP713mnPaQCbeCY
 jcXiIUDi4yHIjd4bIjOcS5MySRok02U/E1IGJtYjqaOlk9lmysCmWTYXv9jhaorxiczhavn3vBz
 jspUgQVdMCK++bZUf92Vt1sJslcPdmNe0/rGkyAXtRW6QJ+tc=
X-Google-Smtp-Source: AGHT+IGOxrusc6smb8SBR5+x6xl3cRKldjSb/YyljGP/mQFy81n104iuywGj7F8eOKDVZgA1+4ttoA==
X-Received: by 2002:a05:6402:50d1:b0:634:a32f:abbc with SMTP id
 4fb4d7f45d1cf-639d5c53171mr10356947a12.25.1760107188733; 
 Fri, 10 Oct 2025 07:39:48 -0700 (PDT)
Received: from [192.168.1.17] (host-79-26-169-51.retail.telecomitalia.it.
 [79.26.169.51]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm2488482a12.39.2025.10.10.07.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 07:39:48 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 16:39:13 +0200
Subject: [PATCH v2] drm/msm: make sure last_fence is always updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJAa6WgC/22NQQqDMBREryJ/3ZT8WBd21XsUkZCM+kFNScS2i
 HdvKl12+R7Mm40SoiDRtdgoYpUkYc5gTgW5wc49lPjMZLSpWOtauTEktB1mh/ZpZWk7eSmtwc5
 UhgFQnj4isj6y9ybzIGkJ8X28rPy1vyDr/8GVFavOlyjri3fW+1s/WRnPLkzU7Pv+AXHhIvu4A
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760107187; l=1927;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=JLP84YwDYtnkcXuPlWz/96ycTDjsV2Qn2l1fDXZT63Y=;
 b=r93EYYuxOS7qVpQn9TokcRRHfgbS1UN9XfMZSXufiJ35KVgn9pUtggYZJti3JgShe7zze7EqV
 sbCZEmnUlg6CLUfVvrDIgKLtFk5jdMJy033dsQQyz3R0nViU5K6XefK
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
---
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
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

