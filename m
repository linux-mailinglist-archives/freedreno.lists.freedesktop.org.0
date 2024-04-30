Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592838B7027
	for <lists+freedreno@lfdr.de>; Tue, 30 Apr 2024 12:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E5C10E331;
	Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cF/QkETw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33E210E331
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 10:44:13 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34c8f392172so2349330f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714473852; x=1715078652; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bb8GnDW6+qLtihXTN4x3JzTwOi6ozU0H7JsWN5IeQbY=;
 b=cF/QkETwqQn4WYhmcuPVge7A3vacNJOWwT76VmQo3WN/5Jd09cAP6w4oKb9nzSY/OI
 5ZlOAw8kOrQoE8CNbjPGzyAXr9i6UlBA6X454jAv3IF2V66+5HRkLe0Mx3i+VoX8jvSi
 OAyLCxKczJRS6kTP+IoiUWaJ91bh2vnAcBcd8al7w0zvVvXOwhoseju5Ch1qqbH0SpKV
 WpCq9GAYbY1GfWCzYl4UriKViEQ3YqEjth8dCVvBB0BpxFIeyPw1hjeJtWZ/dFcqxQVE
 SvtTWxt4OjjMCIVCkVfqgpL2dJEk7ZUAhi5ZL0ATRvUNxJudnUVOtg571d337qAD3TFT
 lGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714473852; x=1715078652;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bb8GnDW6+qLtihXTN4x3JzTwOi6ozU0H7JsWN5IeQbY=;
 b=ok7VM6i0CDFq8k3JvB2OD0wjjKwLOr+8IE5AmX6W8Hv83ud6rk0LP9JBn5ocPcGuc5
 /dMUKGsC3ZpwB9Yf/U8QPiVROFMiJ7y+S4Azo8ROfOg0UQpze2O5o2SWDlx3GHSLo5fm
 ym+5CKHqhC1FQCgMJvLXOLhq+OvwyI3PjSlcSbgoorfeeIs7262CHwL363gJxmL3im5t
 ocD3HON6WkKudWrdGOChqHJ73LtYOUZEttSFUsfj6dK/AYcPuP4omRVVDzBEc9hYUfx/
 7Okh7e7NwrRyenovdocSdpZNAdGYAmGiZPh0Y2jc5X5fzeBeer7YI9mjW7rIqBUc7XNR
 NDSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb/+bweg/uhSbwOoDO1eLvpLzVpV+MPxFMR94zyHkVMNQ1doQ9fUeYuKsFNQjNyy58ZO6QTGYE6yrz4UEflTuxTXfPZaRFlRX99Rs1Ep2c
X-Gm-Message-State: AOJu0YxmOKb3wGsWz15sjtmO/z35xhb1HpJ4hbvP5jJydgpw3Hlrl37h
 b6/m/oj8mrD/CrugZgrn1gZCfA/ZpnX62A+Z7Tp0yrip78Ozi8pe
X-Google-Smtp-Source: AGHT+IFqLW5D8CyBedtTDksYWSboxdk0BrvqkpEgaJplE9H86m7tUMUz1Yt5dTLGZc/+W9vZvyjCSw==
X-Received: by 2002:a5d:6da5:0:b0:34c:b2bf:25a2 with SMTP id
 u5-20020a5d6da5000000b0034cb2bf25a2mr8723929wrs.65.1714473851633; 
 Tue, 30 Apr 2024 03:44:11 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:44:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/6] drm/msm: Support a750 "software fuse" for
 raytracing
Date: Tue, 30 Apr 2024 11:43:14 +0100
Message-Id: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELLMGYC/3XOQQ6DIBCF4as0rDsGB0HbVe/RuBgRlaRKA8TWG
 O9edOWmyz+Z+fJWFoy3JrD7ZWXezDZYN6UQ1wvTA029AdumZsix4AUqoFJy8LRET9pOPbTGlCR
 RyVw0LH29vens9xCfderOuxHi4A2dnXRdCFlkOQpRKYQc9IeaxsXIH/1I9pVpN+7cYEN0fjn2z
 bij/6fMCBykQtK3SqlWiRNVb9v2A9N+czftAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=3705;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=BkeGv58H7hX42ZZyfz12hF159QXBbD9WS0RfM/g8QWY=;
 b=izjmuSdR+NaWlJwWY8d37ssrBiSBBeoJFanp5OwmSsVl8LUnFSe5R69hA1oHgh4okSygwNy1/
 eWA3IijDusYDPdsAhVjIheRSDbx8oHefZgjNc8MmKhtPYvThBVtwOaJ
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
Changes in v3:
- Formatting/style fixes.
- Fix RB_CMP_DBG_ECO_CNTL write on a730/a740 and add comments from kgsl.
- Link to v2: https://lore.kernel.org/r/20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com

---
Connor Abbott (6):
      arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      firmware: qcom_scm: Add gpu_init_regs call
      drm/msm: Update a6xx registers
      drm/msm/a7xx: Initialize a750 "software fuse"
      drm/msm: Add MSM_PARAM_RAYTRACING uapi
      drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   2 +-
 drivers/firmware/qcom/qcom_scm.c              |  14 ++++
 drivers/firmware/qcom/qcom_scm.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 102 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  28 ++++++-
 include/linux/firmware/qcom/qcom_scm.h        |  23 ++++++
 include/uapi/drm/msm_drm.h                    |   1 +
 9 files changed, 173 insertions(+), 5 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240426-a750-raytracing-dee7a526513b

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

