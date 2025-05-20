Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D2ABE35B
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCCC10E5C5;
	Tue, 20 May 2025 19:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gmeg+87u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8964B10E5C5
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:00 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-7c57f2f5a1bso64257685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768139; x=1748372939; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TiPFN3JOGIK1F9o5An3myfiKGu5aOmMHw/+V8iz5ZMA=;
 b=Gmeg+87uSrTiaOpgwOUIjTYqcQAzIf752Ef0aAzDf/1vyaU2EgTJi+/kNzpIe1Vww2
 VTowJzWkE50rqAD7zWno0iho7qIy/LZOX3fLlwXJxpwP1GCIQ5YUEegDGsrx4d0e5+sJ
 ICOXxLBEq2ei7WIcW9ZR5/PyZReO0OFeIvke6BNCRy8yWHmhjAroFglpx8mHILd87WgU
 Rf/J5S3ZLPFqfrnJgS5t+QARrEeaC09yQmCxPkBQyKgrh9Mi/0wkMMF4bHFeOoDM5uS0
 ganwSft5Ha2i7LF+OD0M9mOw55pRDUFXHePZqkewldnhx1mXxc7HI+o/bb2o3Y91WpTy
 G0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768139; x=1748372939;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TiPFN3JOGIK1F9o5An3myfiKGu5aOmMHw/+V8iz5ZMA=;
 b=B2Zlr8LW8Ur2DqlAKt3SxmcVvCdvrnqk3Uz1TyjI7V8Gq0OP3AW6Z4D0yXYu8R4qXm
 Qm0Cuc5wH6DknYlEPattgJmU+4snyDKYmdQ/8SjrLxtmud0rBdZUm3I28coMekNpVPYO
 VaOdOQ7NXS1tGgLEGpoRrELKaa2Z8MOuxLE7J+Zx/G9CLFdLRrcAfvj1hnSjwciRHpzS
 roXDITzUpTT6pX7TzGoGsCf4R1bMnAG2+ogozWxDdvrMoUyWCKev58WxRefOiBAzw8yQ
 VlT0j7UHOqy5LLLxwduaSwxWb1A3+Prd4NieYUVuc2VUz9MYWSm7bC2vakAba59eQE13
 LrzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC/ZxO3jgUsgkbaez75HvXbOrVPyk/qN6IWLIeR3UwoK6h3cd3PaNtFGWR+a+VPWt91rvofBA55Ps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYau8+6cGKexNymglpCy1Kmrx6gDcgdcto7NlTa5opVJqjAv60
 tKQPqrdrvOznAve9tq9IuIHiu3wHL7KZlfGcW8ivafrWzPS/78Hq2XCu
X-Gm-Gg: ASbGnctXa2Bp4qGh92Csk/CcbZ2+eg2Q15RuXmB+V1j0M9vQhEI8YbYrzpz+CQlkVMR
 3gKR4n54RJvrB7yXun7KqHBTzhdyWYh2MzkznRqFEUEHgWKbk/1BJJL0dOGBQrSzH6VNoVIlWc9
 x4u+GosKT1hEATLGjZX3sxfMcA4GP9u8duyQwefC8ogNDe30vaCgdt9ZCiE5AkB9wl3OP6rIGh1
 rcencfrmPVU1vaDh7wJtVI6Ly71vQ3xYQP6GZvGFwMEMW4ajYP5W/UoXSSn+HpmoGxdjhdXCzbh
 VgGrxDetOMkJAsN1xvleg3x/hEKHyRtUOrEggmTOyu+gAdoDGWJUcw5SMWMfbDdS3ZibeXShMQ6
 OocuV5d4dXJi/nkadY4o=
X-Google-Smtp-Source: AGHT+IEmBMiK5D6gNzmXfrX761lWGStYxNBrJZvudJzvab7Rp2ElyIbOXSVquGxbCO8PBrAmoeTxGA==
X-Received: by 2002:a05:620a:2781:b0:7c3:d752:f256 with SMTP id
 af79cd13be357-7cd4674630bmr1041365885a.7.1747768139243; 
 Tue, 20 May 2025 12:08:59 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:08:58 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v8 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 20 May 2025 15:08:53 -0400
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXTLGgC/43QzW7DIAwH8FepOI/JfENPe49pBwJOitQkVUijT
 lXefaSXRjmgHf9G/hn7STJOCTM5n55kwiXlNA4l2I8TCRc/dEhTLJlw4AoYM7TPPe1ud9r6+3W
 mbXpgpgM+Zuo0CnAWuEBGSvttwtdr6f7+KfmS8jxOv69JC9uq/0AXRoE2wTVC8EZFaL663qfrZ
 xh7sqEL30EcKhAvUNRCBwncgORHSOwhXoFEgcC3HoApqzg7QvINCZAVSG6rIZMNCtPKII6Q2kH
 MVSBVIGeULgdwMdpwhPQbUkxVIF0g2SL3ygpvjT1CZgdVj222H+kQWQjOI6g9tK7rH2oL/4h2A
 gAA
X-Change-ID: 20250117-msm-gpu-fault-fixes-next-96e3098023e1
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=5755;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=I1cIbwom2B32IbSq72YVeQcGdq7m4R+PKVkZdFMEOLQ=;
 b=i1oEoJC+lvHNjZGNrXyp+vl7Kutp44g7VBEaagMi5W0nsmizVrnl+FpNsaYxO69uzPtgHKPz5
 hsBP1dMI420AFEb+9PUrzKPDwASpVZR3eErIWOjvpKBFjzflOpeMf3d
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

Patches 1-2 and 4 fix the first problem by switching the IRQ to be a
threaded IRQ and then making drm/msm do its devcoredump work
synchronously in the threaded IRQ. Patch 4 is dependent on patches 1-2.
Patch 6 fixes the second problem and is dependent on patch 3. Patch 5 is
a cleanup for patch 4 and patch 7 is a subsequent further cleanup to get
rid of the resume_fault() callback once we switch resuming to being done
by the SMMU's fault handler.

I've organized the series in the order that it should be picked up:

- Patches 1-3 need to be applied to the iommu tree first.
- Patches 4-6, which depend on 1-3 should be taken by drm/msm. We will
  probably want to create an immutable tag and merge it into drm/msm to
  be able to take them in the same cycle and avoid the temporary
  regression noted in patch 2.
- Patch 7 can be applied to the iommu tree later, it's just a smaller
  cleanup dependent on the changes landing in drm/msm.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v8:
- Make stall-on-fault debugfs file a wait time instead to make use in
  igt easier (Rob).
- Link to v7: https://lore.kernel.org/r/20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com

Changes in v7:
- Rebase on v6.15-rc2.
- Add debugfs entry for whether stall-on-fault is enabled to help igt
  tests that want to wait until the cooldown period is over to collect a
  devcoredump (Rob).
- Link to v6: https://lore.kernel.org/r/20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com

Changes in v6:
- Rewrite to use a threaded IRQ instead in iommu/arm-smmu (Will). As a
  result we can drop most of the previous changes and instead move
  writing RESUME to the fault handler.
- Link to v5: https://lore.kernel.org/r/20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com

Changes in v5:
- Don't read CONTEXTIDR for stage 2 domains.
- Clarify that we don't need TLB invalidation when changing
  SMMU_CBn_SCTLR.CFCFG.
- Link to v4: https://lore.kernel.org/r/20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com

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
Connor Abbott (7):
      iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno SMMUv2/MMU500
      iommu/arm-smmu: Move handing of RESUME to the context fault handler
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Don't use a worker to capture fault devcoredump
      drm/msm: Delete resume_translation()
      drm/msm: Temporarily disable stall-on-fault after a page fault
      iommu/smmu-arm-qcom: Delete resume_translation()

 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c         |  5 ---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 54 +++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          |  2 +
 drivers/gpu/drm/msm/msm_debugfs.c                | 32 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c                    |  4 ++
 drivers/gpu/drm/msm/msm_drv.h                    | 23 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c                    | 20 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h                    |  8 +---
 drivers/gpu/drm/msm/msm_iommu.c                  | 12 ++----
 drivers/gpu/drm/msm/msm_mmu.h                    |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  9 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 43 +++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.c            |  6 +++
 include/linux/adreno-smmu-priv.h                 |  8 ++--
 16 files changed, 173 insertions(+), 61 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

