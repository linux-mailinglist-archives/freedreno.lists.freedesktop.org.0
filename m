Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D29ABE200
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B0A10E56E;
	Tue, 20 May 2025 17:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kHM5CWOl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D36F10E56E
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:01 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6f8adf56370so9292776d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763100; x=1748367900; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NQzNVxSYCC2FNoqYgqHcnaCCKOuJ/N1MxANOboKaTNU=;
 b=kHM5CWOleXK2BCQCowNKojUhcOy8nx/MR1AhOVrnV4f0YbkA4n9idrheAjoWb6C5Eh
 lxfOoe0KJCJMxitbb/N4CvZZ3n+Sull9IgjMVq2HL/s3C/rMw8C+s3n4rnQSPKni7lsI
 jmMO6bsuS9TMrsA3BdGqmyAZsUaAo2YP0Mh6+Jm6hG779HAXmp+cOLD0kehldr7nSmSm
 dAQb1SG/yfiecGsOFk9Q+dfCo6MkpHR7pbUJJAhs9G8lG64Gylv+HEGcOfPKya2G0xSF
 cfEZQCRDo4BUcSebThDwPGvabMoJUiA/GRjt4lwMi482Nf4lF4P+Lc4VemFqtqQYHoZF
 C24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763100; x=1748367900;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQzNVxSYCC2FNoqYgqHcnaCCKOuJ/N1MxANOboKaTNU=;
 b=ezfPSzG5Y61//lJWRYHuhKSldckh5ir/u6fpAJPasWobUyr8hOkuKgszr9NfSgjrSY
 TFkJ9cXvvTdLKSqjWOMuCwyIx4pIcvmZOjWaUsBgUO390N+J1v+KnNWukGkLx/C+jtGw
 TMUKarp4tWn0KEiZWI5TLTYVYZ66UxSFNQLwsaKjTFrKST24rMAjzZ5CpwWp7U/NxaZs
 eMFfhp1+8Y/EuvHVWV8O/CrMjtTqO7RPnLE58bFQICsmOnsEQCHJOgBEdfGhqYoF+x3W
 a2DSXCvM/mrnl8T1fOCUXsemdmryqZhFzpUxhF50snfmH+6pSrJj2uCR6tuTHTnSkkgn
 wKpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/a4/aPARUg/gpNQFG0JGR/WSXUxAdsXGdl14Eh9J34n4E8pfNiDX7o4jlytlYo0GgzeCOANnmvOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ1wNlfuxVlmU/mcPA7JRuMg1thVXAax1gaTwPGDjLT5W1wXpk
 GrHcVV9tr8fuyqid4c2SlZuPL4HeFMUsyY9f2G4XJLdDwuhDl+m7XORj
X-Gm-Gg: ASbGncvrmbaEeWKXx+GEIX23V7YAuDuoMQzvJRa6ZwngbhqwyyExmFD/eaEB+poOc4g
 c6q7XDUKsSMduS/kPWDHQsB6P+RtJb3K4gDZJMPRePFTs5n5wuwRv/s1ozHjKVOj6Dwi8kE1UOG
 /n28ypSQGVQeaBHZLmjTea21Mec6dxpKmk9VruaKXvKQeoOSlQrg2DV9M2Y6aQCdXkSz1Gr2WqV
 xyi4IDow5KgR8/DzkenfypVkjVqLS1EDeJy051B9dExXcpBw2jwhfzZzG1nGwL3ziSbVq0NH+Z9
 aJxa0d/kcihhbf0OiVQ4MwIL1COvBIMSJl5e+Mm7u1Tsq/tfR/CX2urRyou3sNbZazq8WFVDqpe
 ImS4Y1HGVeN3JMRa3QtI=
X-Google-Smtp-Source: AGHT+IFMsjsAlp/KmRWJUce4mkstVxqQCTLw9Ds84YBX1CPbtRzn3h6pU65n5IYZAossuniw2u+bEw==
X-Received: by 2002:ad4:5941:0:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6f8b0881b97mr96409666d6.5.1747763099887; 
 Tue, 20 May 2025 10:44:59 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:44:59 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v7 0/7] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Tue, 20 May 2025 13:44:49 -0400
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJG/LGgC/43QzW6DMAwH8Fepcl4mx/nuae8x7RCCoZEKVISiT
 hXvvtBLEQe049+Wf5b9ZJnGRJmdT0820pxyGvoS7MeJxUvoW+KpLpkhoAYhLO9yx9vbnTfhfp1
 4kx6UeU+PiXtDErwDlCRYGb+N9OqW6e+fki8pT8P4+9o0i7X6D3QWHHgVfSUlVrqG6qvtQrp+x
 qFjKzrjBkI4gLBAtZEmKkALCveQ3EJ4AMkCQWgCgNBOo9hD6g1JUAeQWk8joSqStlFR7iG9gYQ
 /gHSBvNWmPMDXtYt7yLwhLfQBZAqkGsKgnQzOui20LMsfL98kES0CAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=5530;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=PfUViJW6wIlPq1eq8mbT7TIDbT/guCIxVWkThk/PvMg=;
 b=5U797NgALzxcffx0leSrLRx1UFnLBJFlcaQFBXdBnTf3m7QtKC4YUXE3mTgPy90CLhOCn90dd
 v0Vi2w8OTqSCx9eFDdF5aGe4NS03I/NHUey6Cy2chM88n0n9EJx2tgP
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
 drivers/gpu/drm/msm/msm_debugfs.c                |  3 ++
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
 16 files changed, 144 insertions(+), 61 deletions(-)
---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

