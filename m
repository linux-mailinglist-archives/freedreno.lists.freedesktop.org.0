Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C59C77A3
	for <lists+freedreno@lfdr.de>; Wed, 13 Nov 2024 16:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF5E10E144;
	Wed, 13 Nov 2024 15:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="toMOzlKD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A401D10E144
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso57018675e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512917; x=1732117717; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IUw1QAWMH+tzja5s7eVHANVh4+/fXkKybRoiIH2f4Kk=;
 b=toMOzlKD2TlM9WeZmDrK5Z+E+FS5sQOwnNoFNef5DtryhRfn+EkgOvbzIxiLBEFeoE
 rcpFmq5eoPoRUvFtXy6mDLkZRtLMA2JcfapFubef7ehE2Uyi8r77wFZuIWDpUmx9WYUO
 hgXj28ITQPYff0ts7xzBsuhw7jdX8WOVJuAM7Vb9v5vXpsp42UTiEpS0PJ+lQE72iz3m
 NSvkiur4YCixpJWFEzNUqEupHK1JKRro0AARiDQW8ctollzXNQbQIMdRiPqLWly10RdO
 EjE6n52PY3ECxRDBd0Sxyo/Tcq/SfWHnIM+mLe3P/cJ/UkeUQjCZ4BWg/QiiUHjydJFb
 +edQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512917; x=1732117717;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IUw1QAWMH+tzja5s7eVHANVh4+/fXkKybRoiIH2f4Kk=;
 b=LqPLWr4UHjPPloDnvf58iFQ+BTzG8yN1k9dpxk7X3o/Pn7J81PFi0xoOu/PU7xZ2kX
 tT6qS3B4/EBkUwD3PsIxwnZ92hDiE/Ri0lEpgpX1Ag1+2D/1Wjz5vqdxDooqt5KVB4mL
 PIPGPK8CqYTwWcmtPJjhOxKFiWrSDS7BeUlLdl3PHmlnXeb9If3hLOenDURoSpLJSH49
 i9wEklKpjaZqagoiLGAh82L9+l5upX7bVJXVNSCC3kky+Dt4L21p9DMEX2r/V2mM580x
 l6iFqeSC9pyM8p228J5EsoSSo6ysUzcDDwAnN0KUYFmUqrFgaPjkFNJs5Wko19l9tWhF
 vP3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8F2jJQA0sqGIVOQqmAQ3g1GfZFuger6kz25YSJCjF+1V7RXypQhu3S4ZXyLHpuhyOwiU0DDUruvk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi/dnoC86OMXS0R3HaUCa3ELWdQZBgPApSWpqNsDWXDMEpak/c
 8VtEZ+7+gJdupBcTqT6bb/Ck9gMgpYt0ELDziNkD3IvTKKb33iyT8aJPNz0bQFo=
X-Google-Smtp-Source: AGHT+IH0+AWN4BjMUB0SBHWOf+erLPiGOfP4Vhtzv6UNHG9sRcGrOAMATKFvSgWIXqDkAA6diXrhkg==
X-Received: by 2002:a05:600c:3b09:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-432b7518365mr174183885e9.24.1731512916955; 
 Wed, 13 Nov 2024 07:48:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/8] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Wed, 13 Nov 2024 16:48:26 +0100
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErKNGcC/x3MOQqAMBBA0avI1A4kUVFsBQ9gKxYuE51CExI3E
 O9usHzF/w94ckweyugBRyd7NluAjCMYl36bCXkKBiVUKqVMcDeWR/RrcWcCZ3vgcOFpdkKdkVB
 KU96nOYTcOtJ8/+sWmrqC7n0/p3iwQG8AAAA=
X-Change-ID: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=q5ar/iDTvRrWUmUGLZmHHecZgDsI6qhIEaT2LGKwJWY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpQHfZA+OfH5dhI3Gcmtq6DXWsnzInwZjcWDscU
 ZhNgKiOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUAAKCRB33NvayMhJ0SoqD/
 0Wl7nGwBx5diixbfRAKseyZLMQI98FN2EGblsvC/puVSEMBW18WDGREytVJd3yTHuJtPmFzmHyiLJf
 dLI0WQF51+NXC0ajolKmjb3KxPVgQtUHbj8G8wwdy87tzH6ZB2z2pPzQslSrfxu8mOPvZCYrp3rlRG
 JinePEUnhGB2j/k4cdSD3MS/ORJooFkaI3XgkpstUMFpkNcIt8WoJTjD+6r7JJocf8SWLVO2v2bExL
 pjAwc+ZQmPElvskwFp4bAD1vMzNGY32d1g4Pq0T+bWcF5rgLQ2MpiId3mgX/3/omDj6K9pNPgfqoxa
 ErNrYM0fHk7mxqLgKwCIZBHT8BJ+vETGWg6WR4JTuSyNtjQ9mC8KD8J4ND7xZHYV67ThTQQwZdUoPE
 jWsnFcw8soPKl9ODMl++OVEav9gJRd7PI5uw6K46CkhgtqHKI3Q0OrDQGVzAI8IgBvvG1dbWPEVhpk
 CCO5Hwo+8J7QGYqQDQ3I5hkeCOFxkwrKdrnGEKWS1xzH+V4tpoK6PdW8O6pgdXrjSzLQjVWZT+sTFP
 yW5atSi3PTIf1x//rC7Tfg9W6Jxm16yQ/RypoGo7uHDYdoRfMuBqOXJ1+tmF9+qCE7OpG+r5p683AA
 w52u68BWH5eDkEAYU+dDzq+srKhru5N6Pb3VmK2qWL9eo8G0NjbEKKZ6TQMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Adreno GMU Management Unit (GMU) can also vote for DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote parameters and bandwidth to
achieve full functionnality.

In order to get the vote values to be used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be send to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.
The added dev_pm_opp_get_bandwidth() is used in this case.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Those entries will then be used by passing the appropriate
bandwidth level when voting for a GPU frequency.

This will make sure all resources are equally voted for a
same OPP, whatever decision is done by the GMU, it will
ensure all resources votes are synchronized.

Tested on SM8650 and SM8550 platforms.

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (8):
      opp: core: implement dev_pm_opp_get_bandwidth
      drm/msm: adreno: add GMU_BW_VOTE quirk
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: enable GMU bandwidth for A740 and A750
      arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU

 arch/arm64/boot/dts/qcom/sm8550.dtsi      |  11 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi      |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  26 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 180 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  14 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  54 ++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
 drivers/opp/core.c                        |  25 +++++
 include/linux/pm_opp.h                    |   7 ++
 10 files changed, 314 insertions(+), 19 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

