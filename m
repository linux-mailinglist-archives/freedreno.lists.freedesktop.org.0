Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E919BA01E07
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2A410E55E;
	Mon,  6 Jan 2025 03:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uv6QEDaa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92A10E55E
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:08:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401d3ea5a1so14111630e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736132861; x=1736737661; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uLK759iPI3y1Wi5RFKaCu2VPkX4DkJ5X5ePew9Klx7Q=;
 b=uv6QEDaaYLnW1DB85Uqa0diVH78AIES0rfaf4SqoGh7JQvjE5amPDuBjuc0Jp6gFTW
 Jaz7f2xomO/NQY31ndmy8up6/3nn2Ut7t+5geJrdvyPteASwC4bfkNbEDqFmXm5nRulf
 tWEYOdCph1RXU0rL06gZ2ZRDDhUM/l4APHNQfWIhC5xxTSYlM4/fe23sgsvMurLrxmcf
 GTqkWhxFxIG/X+J3KLvqURKwI655KhXkZSNpXTQQgTPHBgmXu86gFYq3GbEv2bVBe/2W
 bmNTlrGB0NZpf7Hq+0tcf1ED8c70ISpyfiz/B0tq8RlDtGJYFrSTSCzy+RDx87G+Ekeh
 dIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132861; x=1736737661;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uLK759iPI3y1Wi5RFKaCu2VPkX4DkJ5X5ePew9Klx7Q=;
 b=QWc1M6dA5UWRllxUK5bLLF6/AWbBDHoIUn3dOqiFWzB+28CQj8C58Lecs9wxiJBDgZ
 8V4GkBJw8824hTvAbjCGgu45f0LH7BjZWkdAorK4d3lhJsKP6MA03/umUA1jOBoGxiaJ
 XR7ciUxtkQHfdlmvjx0cwuPcBwiLnNRtO4LMEBgcW11K8/fihJBMPXwas8hhHB8E3Qpg
 O2i/hPtEWlsR/yp+Mg6jJMC85rB0pMkiwbaRhgVrYQdMSfCoLMT4rGJ1YdJ3EGFx5d08
 QwHbjapzPzV86sLT/BQsBLUeSsDJDDQLVyN5slX/F/rQ6lMWJoSd5DvPSZ3vwBiEtY3B
 Ze9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF0J/As7gN7LWrD2iVs025lgi6yaa0i7RW6Sh6rICVJyrhZxsYt50SQCB1Yb5N8KcS4f6kjQY8I10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyt11pzV79Lm6ILNWwxYeuRHmhIXRueBPzLJl9SOqdZvcsKSuDB
 x3+XjZdu6WZj+kMmni1Yh8HB8VlNFstVaUKL/Eo6owFDW5KW1NdaYJqvkJpecas=
X-Gm-Gg: ASbGncsnW2KO8Hh2lF92cb5o6oCTDqekxa2X/Ca4sAT1Ez23fAD1K0zvBsb1Reua8Ww
 cwwroqNbVz66D9RUB94iAOkXQ2bWGkn7eyJ01zdsZoqfbfOXF2aJUj2TK1Lk8J/ufNVAGgwZoNV
 LQ6ozSdTlTYB3UaauC2KJPTP61oXML1zA9wCeYLeqOkriXFp7MQr2UiHnRFb5NByvobr0cai5qB
 uXg/KMDAK3G44I+ZmpFoyyKvtwKNk2b7bd18ienWqJLLjUuXwTB/djy5Z4wFVuu
X-Google-Smtp-Source: AGHT+IFBWpRYLbrMN9ZcJZ7WAJg0q5LHtFYQuC3pXOfl5O5NxecfwSkdYJShHfj/CKimfuqE6PEFFw==
X-Received: by 2002:a05:6512:6d3:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-54229530096mr18988616e87.16.1736132860556; 
 Sun, 05 Jan 2025 19:07:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/9] drm/msm/dpu: rework debugfs interface of dpu_core_perf
Date: Mon, 06 Jan 2025 05:07:34 +0200
Message-Id: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZIe2cC/3WNQQ6CMBBFr0Jm7ZgKhaauuIdhUWEKEw0lU0UN6
 d2t7F2+l/z3N4gkTBHOxQZCK0cOcwZ9KKCf3DwS8pAZSlVqVZ00DssTFxKPQq8gN7TG985aS1f
 dQF4tQp7fe/HSZZ44PoJ89oO1+tn/rbVChcZ6p0k1dW10e+fZSTgGGaFLKX0BbYYYw68AAAA=
X-Change-ID: 20240314-dpu-perf-rework-97fca999eb46
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dALmTtc2mWUw4GY84rD8BKfxs/DyNv9YyAPMHK/HkI0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j442IKuF4EGUZMO6EbwdHXodDWgCJruTRNt
 uK2rATVmfCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+AAKCRCLPIo+Aiko
 1Z/6B/0TteXy5ZL7BLc2TunIMn5GXqXDyUKyWV/z7tz9HHVj1hx1hOEU/6AzVjuaJm1fm4thjEd
 IfQCgLDtuk5jm0RcTxy7Ef/7KzNHTL0AtwNPBdoql2JIFMdsv8e4+onMqpMumiBxg3Yp4AlaVFW
 70OGTApCMtu4tIWLXZ6A00ZBCP7y9EMlDc6DuFFoa6yjuz+3O0K/V3Hh9WgMJBmi4RLhsMqLSMF
 a/DGorWkRYk+zOPlcaWiBMM4vKTZITtcnctCN05xwUnurGAjgIOaqy9GZSqB1R2C3PD9eJPJhl4
 FKPkYXTlKjOwS/3mJffMR3/M5i1INa3s0i15n6h0Pd+ppWRf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Bring back a set of patches extracted from [1] per Abhinav's suggestion.

Rework debugging overrides for the bandwidth and clock settings. Instead
of specifying the 'mode' and some values, allow one to set the affected
value directly.

[1] https://patchwork.freedesktop.org/series/119552/#rev2

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Dropped core_perf: from patch subject (Abhinav)
- Fixed indentation of _dpu_core_perf_crtc_update_bus() (Abhinav)
- Expanded commit messages to reflect different questions (Abhinav)
- Reworked existing files to specify max allowed average bandwidth
  (Abhinav)
- Fixed u32 vs u64 and KBps vs Bps values in debugfs interface
- Link to v3: https://lore.kernel.org/r/20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org

---
Dmitry Baryshkov (9):
      drm/msm/dpu: extract bandwidth aggregation function
      drm/msm/dpu: remove duplicate code calculating sum of bandwidths
      drm/msm/dpu: change ib values to u32
      drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
      drm/msm/dpu: also use KBps for bw_ctl output
      drm/msm/dpu: rename average bandwidth-related debugfs files
      drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
      drm/msm/dpu: rework core_perf debugfs overrides
      drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 207 ++++++++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   5 +-
 3 files changed, 62 insertions(+), 166 deletions(-)
---
base-commit: 23ec7472e8aaa96838a61819a97882b5a7e17e42
change-id: 20240314-dpu-perf-rework-97fca999eb46

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

