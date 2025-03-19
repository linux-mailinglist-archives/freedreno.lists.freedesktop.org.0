Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B127A6900A
	for <lists+freedreno@lfdr.de>; Wed, 19 Mar 2025 15:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111EF10E256;
	Wed, 19 Mar 2025 14:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UvXsc0tm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B6210E256
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 14:44:08 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c0ca5e6d45so118661785a.3
 for <freedreno@lists.freedesktop.org>; Wed, 19 Mar 2025 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742395447; x=1743000247; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DZvJrb+zBc9tB4E4JhmrwjQA5QPEwUV+8PpbNLpgvNM=;
 b=UvXsc0tmsiOHEWvUS/xsd0RDrt+JCoXrio4ubvOKQI3TqRGiETwo88kkJyjMvK1EUI
 D4nSDGADIcdQqeLVLdLPYperVv8caVMGCV6fG4OwOwZXFc0xVmWXpJoCFU6NgDLyCjxy
 o/xdcrCyI3eCjIlLLDWERWX5hFElrieydds9lbxWSHTxQB0V0nSv9qvUgwMlGh0zntcJ
 kPTEgQ/8qyl4yyjt1JL4VJx1ycoscCZc3J6G9JqmEOl/s2iAqBTKMs6m1k3p9V59CJ6m
 tmpfWeKeK4PksFj7a7d4I5kYSuPQXi3W9b5bEQfXip6LDXrNOimdCEHJ4rkNYJZT2Y8G
 ZfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742395447; x=1743000247;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DZvJrb+zBc9tB4E4JhmrwjQA5QPEwUV+8PpbNLpgvNM=;
 b=fa606k3uWwlB7kFSJge1ZjDQs3c+10oIjD/ErbVM9i0Ddq5I0WqeBc+CY5MWSospnp
 crgEhXUvbmj1hTVW7sEhsVIvZMCe8Rb3pSbeP3T2a5cwk0DH8j/ly3WGxP+JiHS8VdJ+
 LBYMoNPgceM195J1S4lXcPpRU8DNsM1EiamB4zmSsycs95KI/PlC8EaykcfF45P2FsNU
 l8Z2cmkV7VnP1BjoxGDj6oQXDdUGHYT9TMqvZjZkEaWOD+aEfiRh8rEU66p/MiWfGN54
 fL1JaNIqTOxZaNA1x/MRwUiKTGX8DqnzDKJHfi8BkCNmcCl7jNYhiAAsw3nn68owS5hU
 /MMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa443HfssEcGjXq0ed3o8pngRKgYlm2E9R3TVnIWyynFY2qjOORcNNUOSUUd7OP+S/eYdFlM1M74k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz80UQ8oLu0fbUOfd+EDKpv6ZWBOZOYIRSVz3jrWngGQuD/2AL9
 oXq1PipBEmbAgYTAm5KXpea//8lI7/llI+wRkPUV4rKK6xfqZ5WytiHcijNs
X-Gm-Gg: ASbGncu4FE/K7a+AkKlYTiqdoJpUpDYq2nAmVz8EdNofg1blhFW/iJuIFmzRBMv1KMU
 O9FnzkIPClqFocNhG3ZR+ep735l+vSI8euMrQVEs1YX0bhnXKCKrz1lZi22ElPFDZAz18XerTqk
 6nkmP2ZsXMoLTyHmWcyW1UPvGApmtvMiYgXe51s2PeIzj+833A+b4103ojIsZZj3eesnfK9XKOo
 wpsLfX6aH7TDWcuc5kBfVuYV9XlB70DZq/ZIwKIGnlhnwQDSEzrPYeDAXqI3zMdLHWBmy+Y+29P
 o2ifDRGZf793V3QZoqza9lXinTH5HLu0ZvNQRxEWKAQMDGpoZ1xgPlQVF7BmnXyx5I+wXBc+PHq
 5L2ztocRNHb5nmQ==
X-Google-Smtp-Source: AGHT+IH8wFR2r4P4bYD39ofrHSl4H2gYM7bk1WgoKLisHaottHVJmyfq/MFmaRHVPdil7K8nUd/zNA==
X-Received: by 2002:a05:620a:472c:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7c5a8454c75mr149047885a.12.1742395447329; 
 Wed, 19 Mar 2025 07:44:07 -0700 (PDT)
Received: from [192.168.1.99] (ool-4355b0da.dyn.optonline.net. [67.85.176.218])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c573c5201fsm868587485a.23.2025.03.19.07.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 07:44:06 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v5 0/5] iommu/arm-smmu, drm/msm: Fixes for stall-on-fault
Date: Wed, 19 Mar 2025 10:43:59 -0400
Message-Id: <20250319-msm-gpu-fault-fixes-next-v5-0-97561209dd8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC/Y2mcC/43PwW6DMAwG4Fepcp4nx06g7LT3mHZIgqGRClSEo
 lYV797Qy1APaMff1v9ZfqgkY5Skvg4PNcocUxz6HOzHQYWT61uBWOesCMmi1iV0qYP2coXGXc8
 TNPEmCXq5TVAVwlgdkVi0yvXLKK9tbv/85nyKaRrG++vSrNfpP9BZA4IPlWcmb2v0323n4vkzD
 J1a0Zk2EOEORBmqCy6CQSrR0DvEW4h2IM4QusYhanu0pN8h8wcxmh3IrK+JNl64bEzgLbQsyxM
 DZl6smwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742395446; l=3767;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=W+2qxiUePPwUKrcvsCPyy4DS+hrPlZHy31bDsxo4fQg=;
 b=KuiYN+2L5L9ZTkYhp2nQbTVJiw0RI+ulKpDIosj5jHuAWlohXExldKuu0bne/raFKDh/osyLf
 wtodUGcp3MSBERRMcHsuvuYsQDtGtaxFLRVCv768rnsZMtcPy0a/I1z
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
Connor Abbott (5):
      iommu/arm-smmu: Save additional information on context fault
      iommu/arm-smmu-qcom: Don't read fault registers directly
      iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
      iommu/arm-smmu-qcom: Make set_stall work when the device is on
      drm/msm: Temporarily disable stall-on-fault after a page fault

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c            |  2 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c            |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c          | 42 +++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h          | 26 ++++++++
 drivers/gpu/drm/msm/msm_iommu.c                  |  9 +++
 drivers/gpu/drm/msm/msm_mmu.h                    |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c |  6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 67 +++++++++++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu.c            | 84 ++++++++++++++++++------
 drivers/iommu/arm/arm-smmu/arm-smmu.h            | 21 +++---
 10 files changed, 216 insertions(+), 46 deletions(-)
---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250117-msm-gpu-fault-fixes-next-96e3098023e1

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

