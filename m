Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285B6A15769
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 19:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0155010E1A0;
	Fri, 17 Jan 2025 18:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXPMd0+S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3356510E1A0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 18:47:38 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6d90044ac35so3304716d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737139657; x=1737744457; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
 b=SXPMd0+SBrq5VW6SW9GO6sGXzbjcGvTsyoE5XPzj6fupsJ3mnezM4t7xDFpoYwpaTa
 A/O7siwTZec0XTpFkyeDIkxb5nYkjjd+xFnH+iJ3oSWCEXF3q4PSZCiv98XjRYQJ9vA9
 t+MvsuvCtRqPraVdD/IYt6XCOAr1Gx+gs9BGf+U1w1IlmMpRrz1nKxqPRkAAUC5O9QHz
 W5UAeo0VbdU+ZklYow/snsRC6iUe5jl50aHKWzPUe6yoTN4Ddj2VVtuW9w7F1jnyjTWS
 DS16HoB8+vlxu7KK+DMiy7oJ7Ea9DypVS5Ta/xhJkZjyo9SjMzSakVCKkzaIDIUdojJw
 zWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737139657; x=1737744457;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ra6/FwxtS9APR+DM5MjQWhKeuNW85TPSbzZLBgVdyU=;
 b=kJvbNRJtMFjCj5F5+BdpmbVpH9dng8jvWXfpOEQjc9Yk02QzN3lZR0RCZymMWgn2Ni
 BS60f4ctoVlBtyLDbtYBfU5Y/1EPma1GfY6udZXB9lOV9tb51VeNnMbbmYCLETQHf8w5
 uBgwg0WDPks3e2TDMqTxqfzHxgSkzR0IKujm3ZDWKy8/oG9OGQQwY8SGreuloEKpsbCz
 QtgDj7BCcje+RbE/t8uDTTu8bxZO9EkKZf8emUL6sC87coNwsTh05J8Oqh4hFD0yR2Hh
 fUE9k37LJDOe+qvLPiuewCtZ8WWmdeytDAuWLGgZMg5Bjro6ys6BeSZ05TAxidM3TEu/
 iEMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrvBPtpJUBqtyJPtDo3ykx5oBn44piuIjA+RSaB2rSkHZa9KsDtmlZ5rwZFImhWZKoJP+jDS+4oME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+o68lrQiE7ViOGvGDTxSR+Yo/owqpyBqMEye1hGLKTmPIB888
 ozSKL51kxEA9Eum9JbE40r/+zIPBZ3rrNvoeE4fHzAyOk1YhFmIq
X-Gm-Gg: ASbGncvEUt6QFJXvR7+nYI5cTHI88MkCRE4IhCOebXreaoIRI+0cZfMe0XHo+rN8iP9
 dKlb9/H92M0afvg4GwQfkF7LcNIwjaiEGKM+EnZI79Y3FH1Vb1uj/4An2yOR7KMxCy0bThsYJ8b
 z1S/SIZzy4mgs8XkrbJt9i3myNG9wTwDunGnfrfpcKZHyPS2q3BBSq30UMcxFuAPX0hmVJsEsJT
 AyK57UjllMVm07ibf1uz+jQOesFT6xtXBy+ZGGeY6Xtk2BxY+YvfbdCyeD2yck5LWxf0vpQO+zY
 ldi/owQFv4rdlGc=
X-Google-Smtp-Source: AGHT+IHEGS3WMZchQKb6AiaCl+4ohD5OQ+8Gq4AMLYPZ/+pdqcNLdTJ3oItGfaDD1AJRyHaTYAAAVQ==
X-Received: by 2002:a05:6214:c82:b0:6d9:2fe3:bf0c with SMTP id
 6a1803df08f44-6e1b2158965mr20166666d6.4.1737139657265; 
 Fri, 17 Jan 2025 10:47:37 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e1afcd3859sm13992176d6.74.2025.01.17.10.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 10:47:36 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Fri, 17 Jan 2025 13:47:06 -0500
Message-Id: <20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqlimcC/x3LSwqEMBBF0a1IjS1IIn63Ij0QfWqBRklpI4h7N
 zg8XO5NiiBQapKbAv6isvkImybUz52fwDJEkzMuN9aWvOrK037y2J3LwaNcUPa4Dq4LZKaujMt
 gKe57wFfj3f6e5wViwNJ/agAAAA==
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737139656; l=2214;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=wufxwIG7SZVGT+NpZWvu5eUyVT71GkroNC9AubeD6sU=;
 b=RzjUDIZzgJrcKPPHCBVN/rS1IQljrG9wOjACFFGTOV2ahU8dMokrXTl3UGiT9YmU29Wrd+Hio
 +pb1RkanhupDPC3GvaEwsdahnKSFbIIkGWx35my0A19lFaiS/f1vahd
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

drm/msm uses the stall-on-fault model to record the GPU state on the
first GPU page fault to help debugging. On systems where the GPU is
paired with a MMU-500, there were two problems:

1. The MMU-500 doesn't de-assert its interrupt line until the fault is
   resumed, which led to a storm of interrupts until the fault handler
   was called. If we got unlucky and the fault handler was on the same
   CPU as the interrupt, there was a deadlock.
2. The GPU is capable of generating page faults much faster than we can
   resume them. GMU (GPU Management Unit) shares the same context bank
   as the GPU, so if there was a sudden spurt of page faults it would be
   effectively starved and would trigger a watchdog reset, made even
   worse because the GPU cannot be reset while there's a pending
   transaction leaving the GPU permanently wedged.

Patch 1 fixes the first problem and is independent of the rest of the
series. Patch 3 fixes the second problem and is dependent on patch 2, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 56 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 21 +++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 +++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 46 +++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 32 +++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 9 files changed, 167 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

