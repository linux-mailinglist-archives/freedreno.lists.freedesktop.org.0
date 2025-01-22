Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07881A1996F
	for <lists+freedreno@lfdr.de>; Wed, 22 Jan 2025 21:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D2910E305;
	Wed, 22 Jan 2025 20:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuLNdy0B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D6110E305
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 20:02:09 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7b6ffda45f3so1395585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jan 2025 12:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737576068; x=1738180868; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
 b=XuLNdy0BB4Dw/z8aD9pVST2hp9/wjyWcl1LWSfz9eFrT6sVHO6svRdqYbDOeKydiKo
 Xcxt1oMO1vuIIIvVc9mW2Rg8Ed2/FgJFiTdPYKMoaX3x+N9M3K2zgYNibrlfO+Lv1sAa
 5Q9rIwq30ITJjXzi1slSV6540ZswfGOzhC+rrUBo+KcLU1VkoPX1xdvig24rKzTfyoa+
 p+yH6fzUzitsrs2CAtJqiJz+WyKC7PgApQqps8TFAZL8Sd2xGHFFWM8WpEJei5GJXO59
 MYGPQYvRqpsq/oLDfs8PBAnPoLaXaoeiHBqAGRivkLH4qCdDrNyaYhd0CkAtaL10o+/p
 ToFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737576068; x=1738180868;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jurTTxyZurW5GCpnwp6J13h1Jad371IuO/OxoFLazdE=;
 b=oAGAHis37w3iMGysyetSLtrgjQVsfVPuNdhzpvsdQRcqv1IZS6NdZHUj9LbIoW0awK
 JZbbMoXKwH2khoK7ff1rcTudBo24DDPUcuVEHdaLTPvZzy5LRz0EpXox7+E/adSilSlJ
 kDuMlrJ21exCHLymqvJIaUY4XB6jb4UQZwvbOzDP1ChleWMkA2HwzuJYS/WCbVKbznzb
 Ab0SF1YDdNPQG86mXwwXVs7wn6ZL3OFXxct30bTvmzOv0aum9PEVlnzxmdM0xLizzLGQ
 fiCNDfNDNa0YzHdWO9pgwGFObt3yquxyUq/DJ0xQax37XUNCJI1TmYROQn++TMJQHMIX
 uBYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBNTC1eukBnaIoLfzJiZXtNQEZ3foxGD7ljxDUQYaKE0/N/TGPcpivP7mJfbXmh60mcv5hpP21i6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj+z4+dnpPfNA1e/d6DFI9eKOG1x2sjNO/+doXqzBEJnzgZ77U
 lppXZVNOg4KujPPC5+5ckX804lGGkEtT6Z+ywy6ZvZHL9GkhOu/pZQtusA==
X-Gm-Gg: ASbGncupS34ZvLJwYZidKMjoU5Esg6NquU/AcBkRmorVTw4m8wQ2Ef+ljg1Aj2Q5C/U
 HoBSrabfUVAr2gNKTd4WJxuAM2+KbbXsWhsq1Gpl5fsjGQh22EdXBArqIV4ZJdELxuAYDXg7BXv
 Pjz4ZC9WHnVtnDV9A6cQflnzGDcwgbc4IkJrVMtIvjLBYMNNoFfqm/n4L3csfm8NK2TVJVC6SR1
 IatVr9U7xYODjTE4nhllu8A4dwggN5klAeLWhGK+UfYPAAczAzEidhVtN1cb5NCzefAzW2UWc8r
 4orviK/+nd4y2T/+zCP+vZs7QUtF
X-Google-Smtp-Source: AGHT+IHPM76iU6Z5PtzDIriPWj/nNzCyP2ix3l+fnM7JVaz7sX/vP0vOsO1NLQa7vmhO30zGz8RV4Q==
X-Received: by 2002:a05:620a:28ca:b0:7a9:a632:48ad with SMTP id
 af79cd13be357-7be6324e361mr1073763385a.11.1737576068474; 
 Wed, 22 Jan 2025 12:01:08 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be6147e30asm694606385a.31.2025.01.22.12.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 12:01:08 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/3] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 22 Jan 2025 15:00:57 -0500
Message-Id: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlOkWcC/43NPQ6DMAwF4KtUmevKcfgpnXqPqgMBA5EIoAQQF
 eLuDUxMVcf3rPd5FZ6dYS8el1U4no03fReCul5E0eRdzWDKkAUhxShlCtZbqIcJqnxqR6jMwh4
 6XkbIElaY3ZEUSxHmg+PjGtavd8iN8WPvPsenWe7tH+gsAUEXmVaKdFyiftY2N+2t6K3Y0ZlOE
 OEPiAJUJiopIqQUIzpD27Z9AdUaNRoJAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737576067; l=2962;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=+WyN8FK5rY7qRc7VsIGAiJo2lnVpGPEuUicLFpDWETs=;
 b=a4zT3xeEwtyC9Lok7bYUo82pNV1IICFMNUHKvQZdQPpSD93+dLg1/j5KSWHZfEPg9D0yl3UG5
 I8IDAG+Ikk+BU8oBibWzReXFAvKresl7KM82p7INLVNp/P+OYQJ5ccX
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
Changes in v3:
- Acknowledge the fault before resuming the transaction in patch 1.
- Add suggested extra context to commit messages.
- Link to v2: https://lore.kernel.org/r/20250120-msm-gpu-fault-fixes-next-v2-0-d636c4027042@gmail.com

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
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 41 ++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 -
 9 files changed, 162 insertions(+), 7 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

