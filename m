Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD12BCB0B9
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 00:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AA910EB31;
	Thu,  9 Oct 2025 22:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d56Gdbse";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D23110EB30
 for <freedreno@lists.freedesktop.org>; Thu,  9 Oct 2025 22:14:19 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b463f986f80so327819966b.2
 for <freedreno@lists.freedesktop.org>; Thu, 09 Oct 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760048057; x=1760652857; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
 b=d56Gdbseo9nynb9bF+XlSSPq0N9T3qapslh3EbZ7IT+QCrW8P3BR9nZrzaJjspQy5l
 izU0dURbWOjKGsiKYxglaWvCCFYXZSK+hxOIMautkalhygKxb/RuuHdUvOhpQpW5CJwd
 IjcAsY/9vwI6AbNr/TZcaLgAqKVYQcxz3UWyRAxOiseWZv9PkpgXxDbv/B97Ulmsjbwk
 1AoaqB4DTsQRZ2bIFX3TVHQmE+HHfnqys0GqVrmq+f3sZY4O24YRcVLB4itkDNCrHW7P
 /sTZgLFWRmOLbQncd6t9gmfHH8aPqt+kTSWUV4uwMZ7/W/ZfVR/nIfzN/GDp7j48musP
 sHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760048057; x=1760652857;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+C1qgBpiLGQ9qb0EvZ/pqN9napeSCut88weJBHDFgWE=;
 b=iLeyTNYxwUIPjzYsXgWYpI/Sf1+YyFM8MI+su55detKxeYUcdQMEWxfFeeDxJlnWhd
 2CRWiA7F2bdsdrOHbUBwX1SqII9rxSin3W/HbU9I7ZuZ+YAMgu1QAuXNAfUyE5VGG5xA
 K+vYN67bQaL8VOJIYcZQTsZMZVX1PU8Auly5y0aGH2ApjS96WwINhvn2v70kNDzFcXbh
 7BHzk0fL5OENUz4E/zEtzSesv20orKbMifq2/5Gh4UidSy/GpYVsqbMTJQfDRLyXsp8Z
 YbbOfPgqwBNxGxskInxUU8fteHnyzLfQrkI5dr6CyxTXw4pFDQbhhvdcmgwbyTn/SZ5y
 BVyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJZ2HbbdMeMjOmvB6koqeawxm+vL7IXZ8fpNa6nBVeHm4sqWLUwk+p8/CzcKt21ZonDi2UPKR90Ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/HPc2ExYTijo4lTbSZDJ+Qdm3JuKLfhXQ9edpk5w7o1HJdq33
 blnT4nJc9uOJnnNPv4xHkZ1KiZB1rkH9WxM5eEyziIiXcDW5AOWMEMA=
X-Gm-Gg: ASbGncvK62UWTWzIWjIov4ugR0x+4ILRm1/nESq+H0L1MuecbT1S8IBNy8FWREdy1qS
 SP7Mt7H8bByw1doFHpjikH/TlSJksm39XUEbndbNORFPYQdapc3/aMq5GMneBOOijZ8Xhyx3JJa
 nj+MLt/7eF25qZbOogb3ZXA4+0B/RQRhUPgKqykQqob84ePf8WeMeObf1IUfqHR8hIw0y9fudVr
 DG/ZDflayli/E69NpI/4C8ujlGYNZtHYA7FHE24/JLKKsCUu7mJfn4V6BwzRphrVk6EADy+f7oV
 a7ISj7GWwfdOI1Ur080fnrG5Euk5a2BqKswArj7MJun0Y/gKDX92iEtFcIbB3q8GeLYn0/gkgSl
 XHyEyl7N9k5E6+u0xXVq706sI0piVAMnWaYRUnw2etzDt1okC4UT+U1dpz2UGgVwrGFOTE8AeJ9
 5DqeJCBWnIkeEpDR/3Bj0TCMpQQhYbsaZvoTff5VhnDQ==
X-Google-Smtp-Source: AGHT+IGJY2MnbndzBWS/Rpwtary79mPSlYcRrWBWKoF2nGdG3wTBAiynYZRbgnU4c2AkM1DSx73G6Q==
X-Received: by 2002:a17:907:60cb:b0:b3f:f6d:1da7 with SMTP id
 a640c23a62f3a-b50ac4c4085mr1073754066b.54.1760048057118; 
 Thu, 09 Oct 2025 15:14:17 -0700 (PDT)
Received: from [192.168.1.17] (host-79-26-169-51.retail.telecomitalia.it.
 [79.26.169.51]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d67c9b68sm69162366b.32.2025.10.09.15.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 15:14:16 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 00:13:35 +0200
Subject: [PATCH] drm/msm: make sure last_fence is always updated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI4z6GgC/x2MUQqAIBAFrxL7nbAKftRVIiTsWQuhoVFBdPekz
 xmYeaggCwr1zUMZpxRJsYJuG/LrFBcomSuTYWM1c6f8lgpcQPRw1ySHC3IrZmhvrNEAqKZ7RtX
 /dhjf9wOaWwlrZgAAAA==
X-Change-ID: 20251009-close_fence_wait_fix-00e1c2521eee
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760048055; l=1780;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HDcLQ9jItgD9jx1XKHtGXKjYDLot5RODNSnCPekFFbU=;
 b=0XGlKf43ydVDbBU8ka57El68pwGM62R4dn0ImMJ8BTHLNe67KsNIpUaqhZjUzg1QMDFt7U5sG
 PjwlujPkoBdCnP5j5xX/9+hAc74gRAAO00sSJEmhoWgMgetUSoKT4Pd
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

Make sure last_fence is updated in both the kernel managed vm path as
well as the vm-bind path.

This fixes a bug where last_fence is not waited on context close leading
to faults as resources are freed while in use.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
---
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..ae91a5614bf377985ff7875fc36baf174780a250 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -409,6 +409,10 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 	struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 	struct dma_fence *last_fence;
 
+	last_fence = vm->last_fence;
+	vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, last_fence);
+	dma_fence_put(last_fence);
+
 	if (msm_context_is_vmbind(submit->queue->ctx)) {
 		drm_gpuvm_resv_add_fence(submit->vm, &submit->exec,
 					 submit->user_fence,
@@ -427,10 +431,6 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
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

