Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4537BCE25E
	for <lists+freedreno@lfdr.de>; Fri, 10 Oct 2025 19:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C50D10EC65;
	Fri, 10 Oct 2025 17:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TzNevAPd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BEA10EC65
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 17:49:51 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so4045598a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Oct 2025 10:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760118590; x=1760723390; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
 b=TzNevAPdSorQB18RE4p5V7rlE1ptgNAz5l+TBCLU5apOmCIQemEdvqMFrIxw1/0SmD
 Ne21ENdkVttFxkicVg0WmkkRESKg+/I3gQR0mrZsM7uiSXymSedYhUIZbjFuKirYQXR/
 hjvWRVD3MJPrpG+yIQLzUguyIKC4QQ+116SKoMcqsvSdzIEQbJfBX5u1KDaR5DaSFXeh
 YThSa3WMNEpp6gPTkx/sUIe4z0LN3s9U8U2uLEuG0reo3R5hy+YLVyIQ7TgXSB8zYwp6
 5l4eyZAn38YWZ6G6VurFlMDJyx/yXb5Gv7DzVFRsbglcL3pIq068dPzeHxq5OB0b7qOn
 FZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760118590; x=1760723390;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FlMoGYBpYvb/EBbOzxkP+h2B57HDoj8CpMbpuq4sQ4=;
 b=mULyRU2xZVD9B7DOaGe6M8TrqwTAC+J425vAe6n9i+LySNrg3eYsZcNtiLByf1Lb/b
 ykwb4XNpMscoKlH9I/0ER/8v21FUL6nM0XczpbWhd3ebCwa4toLG8xz7dz1lvILgz7CG
 gpR8jriqhiq64TujNq57YEVwYDZuPxhM6qi09ycu5AUwFsRz8ymB2POYgyEKUenNrzUD
 eK1f53vWIlyV+oMksfKeesRPI5DQNthf6n9U0OaZFIZTuxHkX5IjUwMnHdsKtBShO3Q4
 1u11VgLwVt/ThB8CpLgMCqdE3F0r5BM2ldOgWXF5k9P2v9nPGUIzu2Hzs4UEt5857CNH
 WmUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQqbDWV49/hOUXyyZs2lnmLvmRDd4etYXP699oYhvRhq+1LtrBy4T6MAzN5rtgbyP6ZVHmD0tNGSE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Pfx9Ey46c1fW4tyPr1TiMH6WlhGvDDpJ+nMFZZE+j+B6xDbd
 4bM0WzVB+7Dk9nSeFnsIKAI0vJC8b0suEkym+b2S9Zzx+t5T1jbLVp0=
X-Gm-Gg: ASbGncsN2R29m/QupRs7FSVLoIalNS5OKDAe+SZjRgM7jBnkS0IzBbWIWUkxLJCICFt
 npF+D/1lK6nj1mwACM5j0KZvhxMBlm4wB7H2Hh5DZckeMeHZWx+Ni+/F30QkUKb/BGHEJm3msGO
 hFG9hhp2Gt83zXIFXFCejJjBWLYTBZ5hBA7MWxJZ1ljYgW8/ibVItVzHWwcOLWPEj4c4HBW02lz
 vGkP4GgjDtjSZzitmPqJ+ZghdzNYKR/6Mqq1HVHwW3AJ6zEUKY4Bhq8wQK+N3OyuiloR4m85V2K
 fR/rMa+RHsHNQWwVGujtEA8lUpyMqqLnrlPFt6ieSD3QxE14Fbpz2XlOrtVU8K9QFXW4IN7e/ct
 0oylDnzpJQn/y/KyjK7vJ9DmbRXh64zpKEeaejXHRwLXFsSL/ZMiIKldVixZZnombjUvBpz+471
 OFk5Us71bqLLi4SjLnFTqoSuG+2g==
X-Google-Smtp-Source: AGHT+IHDJR17PQFFrv0Ddj5LxOyqWyfj6LF/dr8cN6Gek6nwWLnn8Mv5hRRCyiL9/vubmJXWRweCCg==
X-Received: by 2002:a05:6402:1456:b0:63a:3e7:49e4 with SMTP id
 4fb4d7f45d1cf-63a03e75ebamr6614994a12.16.1760118589666; 
 Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
Received: from [192.168.1.17] (host-79-43-163-15.retail.telecomitalia.it.
 [79.43.163.15]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a52b0f860sm2751785a12.15.2025.10.10.10.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 10:49:49 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Fri, 10 Oct 2025 19:49:42 +0200
Subject: [PATCH RFC] drm/msm: Workaround IFPC counters bug
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-ifpc_counters_fix-v1-1-9187962b7d20@gmail.com>
X-B4-Tracking: v=1; b=H4sIADVH6WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0MD3cy0guT45PzSvJLUouL4tMwKXYukFBMTc4NUM2NTQyWgvoKiVKA
 w2MxopSA3Z6XY2loAOHIok2gAAAA=
X-Change-ID: 20251010-ifpc_counters_fix-8bd4470e6351
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760118588; l=1299;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=9XOq6YPq24CpDOGDOJ8EWJ8bkkDKwD6bJxPjyv75+Lc=;
 b=MjmbVLvbkiAWzCaRMDnhmThnylcuH2TPO3Q03Qe8qxN/k0yrCNsKkFfz9mAh+yTN19jpeQ3TK
 4lQ5OySpqjODehM8UT3s2xR9wOwF/HQKtLp0gxkDepDKw516sdSDi6f
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

When keepalive vote is set to false IFPC will be re-enabled even if the
perfcounter oob vote is set.

Workaround this by not setting keepalive vote when sysprof is active.

---
I have little confidence that this is the proper solution hence why
this is an RFC.

Hopefully something better can be found.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index afc5f4aa3b17334027f3c20072cc3f059a9733b7..975b91e2c439f659b7f716cff87f73d389641d91 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -191,7 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
 
 	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
 
-	a6xx_preempt_keepalive_vote(gpu, false);
+	if (refcount_read(&a6xx_gpu->base.base.sysprof_active) <= 0)
+		a6xx_preempt_keepalive_vote(gpu, false);
 
 	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
 

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251010-ifpc_counters_fix-8bd4470e6351

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

