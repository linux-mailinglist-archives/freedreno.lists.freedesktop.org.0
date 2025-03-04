Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7101CA4E71B
	for <lists+freedreno@lfdr.de>; Tue,  4 Mar 2025 17:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5F210E655;
	Tue,  4 Mar 2025 16:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FdpfQ3ID";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01D610E655
 for <freedreno@lists.freedesktop.org>; Tue,  4 Mar 2025 16:57:21 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6e88ee9dd84so9052286d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 04 Mar 2025 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741107440; x=1741712240; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
 b=FdpfQ3IDQMNBJ0tlcCV4tjb4J7UZdAAGSGFRA5w5LaEQbN8uvlDc0GoSdjai8YWXI2
 M0WPXZlq1rhbYW9vw0cFvGhH1LXVkVQWHXlxf3h1arKs535JUCfjN9YZu+VAlhk/50jy
 fKkNX1i+5MtX5ZmI/cySd+xD5WiiYtPdZgjamPvyvh1dAcnVpq8gAHk0iXmaUvUnT8bG
 TuQLgD6i9oJguLOJXz1/OTYAz6pITj9w6OnMTw2o83b9k9tyWge5FAwQ0pRobV4/tBmB
 1V7SuuBh6EPlE6V4ONAanv53BAJQHXpQnkDkt/eCaI6Tiuw3X5JhX4ZWHTqA14rf0vKO
 iQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741107440; x=1741712240;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4N8VHwibUhruAck2dmF0TGYAITA4/2gddqUqD7otHMo=;
 b=pCu8cHWgaLTodPohExM1dMW7NA0N6zs2c6iohh1EcuUnNXZSjEJlYbws+2rZ/ih5ZF
 Bayr9+vjYLzFQQIWxTu0rlRcRBd5b7Mt0tJ3XJYL+S1uT8+rihQLwlEeiKqoGxnGlRVR
 MVfWivJcqrzEePMcMxKwHrm4uT5Mjvo19MK0dVrbBvenMSXewhNqcV4u6AE8bHxDlKW5
 NGyi8nXdiGXuT2oJ7mPZ+Fzp7bCWF/yMHBSF4NCYt+3v7fTc0FiFvUqpCbOA9Dqv4V5I
 jTQUol1JUbwtZ/3NL2V/WzlVdwWE+nr1ViYi6c0TwXOfnrTdakuW77NWeZFJ1a3ixEMD
 nKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy9blejBI7tGWxoh+nC/mPWvOLMath+0+D3Vh/ZXplo8zwYgT1o5Wg1z8vXkjufWhl1xPfP8mxt34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4OMz7vtnJWfs9UI6MgFLxC6Q1NiJuePhC7wK64edsUPLI2rY4
 RU145d0qtUQe3Tyvns8ajObNqOG9r/Uzvv20EQo9IGbfrRWsj3SE
X-Gm-Gg: ASbGncsa2YAsVOlhm7J4Wv55sKjgHiXvLE1XNiQS+rH6jT+jkAVTgzFEgk9iMy5an/O
 GIE5H+uCxw+rnIua01Jxh9Dr1cmlif2KTDl6jfMCEuezbCmjIamWDoMjMVhIB6ABzaisMYOf9IH
 Cmw/jm9XGoosxB7PYb7TuvFqAmhno6elj2A81bjHt026dYjYisZhKWWg9fNGCEGpwle9pA5XL29
 NAUEUj9rRLjzU8ybiH7E2lWUuXmv5HiK+BsW3U+G/dv51baJTTQLqX6BRUp3DXR3/h970WWeBkf
 3N3/BnpDQ06WwPrxjSI1+xpruCqnhXUzGEw2YsPOSfiPw+ParPFbrfKsM6RoYQ2WsXd/s40ntj5
 yDVE=
X-Google-Smtp-Source: AGHT+IEjBShiUHTmpe9BMjUgMebZZwGJVd8KDtAxwtvq24tPACT0iVbZHCMtbB96Yct3APfYOpiThw==
X-Received: by 2002:ad4:5ca3:0:b0:6e8:8f31:3120 with SMTP id
 6a1803df08f44-6e8a0d8b6cbmr87598206d6.8.1741107440528; 
 Tue, 04 Mar 2025 08:57:20 -0800 (PST)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e8976ec3b6sm68915966d6.125.2025.03.04.08.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 08:57:19 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v4 0/5] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 04 Mar 2025 11:56:46 -0500
Message-Id: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM4wx2cC/43NSw6DMAwE0KugrOvKcfh21XtUXQQwEImfCCAqx
 N0bWKEuUJcz1jyvwvJg2IqHt4qBZ2NN17rg3zyRVbotGUzusiCkAKWMoLENlP0EhZ7qEQqzsIW
 WlxGSkBUmMZJiKdy8H/i4uvXr7XJl7NgNn+PTLPf2D3SWgJBmSaoUpUGO6bNstKnvWdeIHZ3pB
 BFeQOSgPFRh5iNF6NMvpM4QXUDKQagLjSiDOCB5hrZt+wLr0SnRUgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741107439; l=3515;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=msh5539EjP+JTGfOm7TmnwDK21yliTFnve+XoihROqc=;
 b=Yavv0d1CLCCiAkzMuG0FSXiwmFR5GAOb6ZI7nc0yBLbQYtJjjJMoJ6ZB5l36VedPILL/LfxB/
 3FVj0xLJBQtCu9H3ML69818ww2mDXCQabfOEhSJAL5M0FYjXXvbU03/
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

Patches 1-3 fixes the first problem and is independent of the rest of the
series. Patch 5 fixes the second problem and is dependent on patch 4, so
there will have to be some cross-tree coordination.

I've rebased this series on the latest linux-next to avoid rebase
troubles.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v4:
- Add patches 1-2, which fix reading registers in drm/msm when
  acknowledging the fault early. This was Robin's preferred solution
  compared to making drm/msm's fault handler tell arm-smmu to resume the
  fault.
- Link to v3: https://lore.kernel.org/r/20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com

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
Connor Abbott (5):
      iommu/arm-smmu: Save additional information on context fault
      iommu/arm-smmu-qcom: Don't read fault registers directly
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 42 ++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 24 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c                  |  9 +++
 drivers/gpu/drm/msm/msm_mmu.h                    |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 64 ++++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 78 ++++++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            | 19 +++---
 10 files changed, 204 insertions(+), 43 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

