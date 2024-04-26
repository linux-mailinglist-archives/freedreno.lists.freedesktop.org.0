Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 684DA8B3F50
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3831A10F249;
	Fri, 26 Apr 2024 18:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fnPGdy3Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C5C10F249
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-34c0f5f5cd0so1689496f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156455; x=1714761255; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P09Iq/jwd23QWkzqXg9BPn7EEyPalkFp7437NwIg8go=;
 b=fnPGdy3Y335m57o/2NCvgzjrxxNUdeXctQkIIAMjyOOTwq4AqlYzoAYbzJWwO2Zoyd
 3WeOiFRH5v9JhQV8v0eOUfl/q96HFy9yz60RDqVpUuIpdbaEh+4M8l3xb5KfF598JT94
 UPKnJM2fEZ/WBO9Wexp5vBuC6Cy3MdijZFnXrFXzTKGRTUWhVfaGjDp4AREpkHM7Rcz5
 OtW1tx7HEWMrUfsudA1hndObvZibXU4K+aeQlY4BYOXOn54y27NRb6Q4s4jm9zV4ybxZ
 at5SSQ30l+8TCdMHC7Q97GBIahOory6fS8xahbrJP/SRrkzQtFALYWfNS+Z7LG80J10O
 MgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156455; x=1714761255;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P09Iq/jwd23QWkzqXg9BPn7EEyPalkFp7437NwIg8go=;
 b=NtJBkvjmfPdSpql9KvG772gP/pSNPlO3kABVDB3J5FAn4gdtwmghr1IOoC9/IDekv2
 qc61uS2S8D79gMjaynMZbEW1uGKHggQhC/Po+VgJlHkpNksakentVsvvVxiKM3jn73N4
 EAx+YNF2YokP6WQUz8o5PCAVNfMvDD9GIccnRDUltE1KgVoOE9MSN98A/Cr9WoWWouoC
 C1G5gRCj+BW+mdXL92Zq4yAYRbMvt2zT/8nLCzmX+gAs6n7YccO7yXcfKDyDR6+OAcb2
 dYsrfUqSuuPj3b4DJKIbj5pSV32Eo08vSMUiPQPp2EjIhW/nGRd/S420+y0/ZArYiGiF
 Tcfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMqJLq/YEJgonvnznw7FhK944/C6vnDIOmqobmvdKRrHCrQ6ooHNtC6itjbtwwiJQde2dagaVvMSWMLbg8S3QDQIpbCIdob/+clzn3xhZB
X-Gm-Message-State: AOJu0YxaSEyWiMF0WWRoBy+onti6d9B97NyL+xdLs/E741l0SSF/mnJX
 cSEGfr8E1RO4zC5Dh14DXtyILIX0vzeEStfq07GZUNGc+ddp7HGU
X-Google-Smtp-Source: AGHT+IGX3JhLNRKnWt01+VQDc0xjJCnlKSzw21UO8z8Kzu558btX4mldi54I42yjMUL0aWCKZCdCPA==
X-Received: by 2002:adf:f6c3:0:b0:34a:80ed:9930 with SMTP id
 y3-20020adff6c3000000b0034a80ed9930mr2252661wrp.8.1714156454938; 
 Fri, 26 Apr 2024 11:34:14 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:14 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/6] drm/msm: Support a750 "software fuse" for
 raytracing
Date: Fri, 26 Apr 2024 19:33:58 +0100
Message-Id: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbzK2YC/03Myw6CMBCF4Vcxs3ZImbZgXPkexsVQBmgi1AyNl
 xDe3caVyy85599gFY2ywvmwgcozrjEtBXQ8QJh4GQVjXwxkyBlHDXLrDSp/snKIy4i9SMueGl/
 bDsrroTLE9694vRUPmmbMkwr/d8raWe+qmqw9NYQ1hhd3XcrZXMaZ470KaYZ9/wJDOSoqoAAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=3558;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=dn81m0ceU+c+OAlkdaijqiJDrv8m/ANepXrsTu59LF0=;
 b=mQ0uwzTPXg5loGfDBlB1nqxctEkVYlbopQuw7ZpwK+lHQapbYEydQ5quv7tIDY4FVWycGYApC
 ZGODigjp24TB8SxYaT9IR+yDOQYm6eSIgJYjY/qp8d6HVrZfGxJZdAU
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

On a750, Qualcomm decided to gate support for certain features behind a
"software fuse." This consists of a register in the cx_mem zone, which
is normally only writeable by the TrustZone firmware.  On bootup it is
0, and we must call an SCM method to initialize it. Then we communicate
its value to userspace. This implements all of this, copying the SCM
call from the downstream kernel and kgsl.

So far the only optional feature we use is ray tracing (i.e. the
"ray_intersection" instruction) in a pending Mesa MR [1], so that's what
we expose to userspace. There's one extra patch to write some missing
registers, which depends on the register XML bump but is otherwise
unrelated, I just included it to make things easier on myself.

Note, 'drm/msm/a7xx: Initialize a750 "software fuse"' has a compile-time
dependency on 'firmware: qcom_scm: Add gpu_init_regs call' and it
depends on 'arm64: dts: qcom: sm8650: Fix GPU cx_mem size' to avoid a
boot-time hang. The commit the latter fixes, db33633b05c0 ("arm64: dts:
qcom: sm8650: add GPU nodes"), hasn't landed upstream yet, so we can
avoid regressions by merging it first. I think the rest of the series
can go through drm/msm for 6.10 after we land the first commit in the
same tree as db33633b05c0 to make sure linux-next is never broken,
although we'll need Bjorn's ack to land 'firmware: qcom_scm: Add
gpu_init_regs call' through drm/msm.

v2: - Refactor a7xx_init_cx_mem() into a750-specific and a740/a730 paths.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447

Connor Abbott (6):
  arm64: dts: qcom: sm8650: Fix GPU cx_mem size
  firmware: qcom_scm: Add gpu_init_regs call
  drm/msm: Update a6xx registers
  drm/msm/a7xx: Initialize a750 "software fuse"
  drm/msm: Add MSM_PARAM_RAYTRACING uapi
  drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 +++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 97 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 168 insertions(+), 5 deletions(-)

--
2.31.1

---
Connor Abbott (6):
      arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      firmware: qcom_scm: Add gpu_init_regs call
      drm/msm: Update a6xx registers
      drm/msm/a7xx: Initialize a750 "software fuse"
      drm/msm: Add MSM_PARAM_RAYTRACING uapi
      drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 ++++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 96 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 167 insertions(+), 5 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240426-a750-raytracing-dee7a526513b

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

