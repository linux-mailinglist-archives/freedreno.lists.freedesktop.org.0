Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90E6A16F82
	for <lists+freedreno@lfdr.de>; Mon, 20 Jan 2025 16:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E5810E049;
	Mon, 20 Jan 2025 15:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MBhEojGn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D9D10E05B
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jan 2025 15:46:48 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-46796a6b9e7so5583361cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jan 2025 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737388008; x=1737992808; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
 b=MBhEojGnqHyyXhRc4f6BngPQ7OP/mJAUoSmNRSRCuIEKgQhWaRNh4rfjkf64futjMd
 gfzE0qkIk9jDvZjXh/yk/ohqAkQCAXt6lPxCNv61H0/ydn+gJiBZOmeCZjwTtvmhgwv7
 VzAZnveo18/R9ylxtszpMMWi8z3vOZumIr/DA3f6IpV+IukuQpwy5DdUyCy0rGyGTPkM
 CQ3QBHpyltQm58sxY6LKn6skhb2/Rok17lanwNSuCZWYIHRMdq+OjxK3+eFHMSyQ3p5M
 R3VmTnBjf+sb2WKIPA/zlIW/NbaCf+pN7nGNslo3x2QiGW4mtbQCOueTD7ML6DUNz9Lr
 EiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737388008; x=1737992808;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jyWkEYx8l19GBLVFTRZATObQ9E8Z6bbFOrHEmmyhtMk=;
 b=qVpIWz2MLToO324GDtno0Sy1/Mkbk+4EdkQP8fOo9kxlPraU2dYwh6dnAK4t06B1hX
 e2esIUY/plOGXUYZ2qjJnQl+xYKjzwQp2NBxACILeiH85oT+c/jLe3921ix+y4NGcGh/
 ZlH3HKd3bkxZhQv43D8ANNrryd+Cw/PQ04QxXPPrsPPKaCriXBFS1bDJX522XIBGt73F
 +whs/RKAZ/xx4hpH02T0axiweESEdyNZFM0MYSGR3bW197P5Cijd4rB75L7lRWwNUpvm
 Vrv7yV1fsQ4YWMi2xu/sgLbUUdtt+HMKWgCdhpV8cTZQZ4RDEdAUX2jGXaHTzd4CNu5p
 lvqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQbfHoExjjKTR+T97SM8QBxaSO3VfmhrdCeqKjh5XO+zoCE8/CGwy4oyk1JR2StoqleHofj/Rx1uA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMIsREeO+ZAEu2n/Jmq5ED5TXnjh5NadIrPh882Y2YPP7T3sQE
 ZhhHDUcy1TAgg4V9rK8bkhe7JeY7eIVPcv67fsLfsYI04/B7yCIk
X-Gm-Gg: ASbGncuDBmcMcAFcucDCd3jLuUf4eYsOewZSwwVzzqBicl+0kqXhmGkb+h1GtvJfWTY
 GAKuIESTb1PQeK8m0BWk1Ri4rhBN6HG2ha8HNIy12ldSDOIBZ9Rx/Su8cCQkHpfT+zeoCjXXCIZ
 4LSsefgWqaWyLf96mCKR/3ZLf2voTxfI4wHE2Pu7AZu958cTzDckvIGvw5mssFdbbPBNJZid6O/
 mRCzbRZYFU5t/R+S9VCTr0sLQ7XyaAHVxhCdGtkutRaQ8K1R3bh0gJrq1ZdjJUWtX7lSEvdFUcJ
 cWKUapuP5TTPx6czdkGAHhWeCnzK
X-Google-Smtp-Source: AGHT+IHR7cjTCixBLNtbAIMXQS0zWLEWtnuMbfw/UHe2dC10Tj90Pa0lJRvcim4eXFdZ/kNXVMOUoQ==
X-Received: by 2002:a05:622a:4ce:b0:467:6eee:1138 with SMTP id
 d75a77b69052e-46e12a4a7bamr72560861cf.6.1737388007681; 
 Mon, 20 Jan 2025 07:46:47 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46e258c82a6sm24230501cf.59.2025.01.20.07.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 07:46:47 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Mon, 20 Jan 2025 10:46:44 -0500
Message-Id: <20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAORvjmcC/42NTQ6CMBCFr0Jm7Zj+BBVX3sOwaMsAk1AgLRAM6
 d2tnMDl916+9w6IFJgiPIsDAm0ceRozqEsBrjdjR8hNZlBClULKO/rosZtXbM06LNjyThFH2he
 sbqRF9RBKk4Ssz4HONtvvOnPPcZnC53za5C/9Y3STKNC6ymqtbNkI++q84eHqJg91SukLjY83x
 cAAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737388006; l=2714;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lKYxJxxQvusCy8B0sZYN2iP5UpseVkNuNGCfUBuNbWw=;
 b=f7olHGP2Z1qbp+CTIun177dJ1Ntn9nRXTPCjKXceI0rQQ0OUsCtI3Md/ssDJM/frqEjSzshHy
 hqtiuQ1+59vB8KCwoMHx8rX0iYy3xcsxCtrxJQKSpnIDad2eWBW4ik7
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
Changes in v2:
- Remove unnecessary _irqsave when locking in IRQ handler (Robin)
- Reuse existing spinlock for CFIE manipulation (Robin)
- Lock CFCFG manipulation against concurrent CFIE manipulation
- Don't use timer to re-enable stall-on-fault. (Rob)
- Use more descriptive name for the function that re-enables
  stall-on-fault if the cooldown period has ended. (Rob)
- Link to v1: https://lore.kernel.org/r/20250117-msm-gpu-fault-fixes-next-v1-0-bc9b332b5d0b@gmail.com

---
Connor Abbott (3):
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  4 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 24 ++++++++++++++++
 drivers/gpu/drm/msm/msm_iommu.c            |  9 ++++++
 drivers/gpu/drm/msm/msm_mmu.h              |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 45 +++++++++++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 30 ++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 152 insertions(+), 6 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

