Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B939B94A7C0
	for <lists+freedreno@lfdr.de>; Wed,  7 Aug 2024 14:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4D10E4E8;
	Wed,  7 Aug 2024 12:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KEQA99Eo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CBF10E4E8
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2024 12:34:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-428fb103724so4902355e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723034083; x=1723638883; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jn3A6dw+13YgQfD6Kv5Y+2JlSAYHXpU458T7zZRgiqU=;
 b=KEQA99EoZltam3hFwzBEl9okuCZ0OPxmH+k0dCiIoaT5DFIuPu9xgwTQ1nEXm7IdHB
 h5XySKMchcToTx9V7WXK0ge0D1fj4sawK807KftbwH26scmsurONTs/r5A1etvcyNdrQ
 4aRvQHqWtUseyQzgkDv/pMVpC6RTpPhbuBXoKOqhFhIpC1UQicjnKUwDvJ8tHZa2/CxT
 aj/gzKXwW5qM5/w8TAyE0YXYpqGBgXDVa5bExL+rfeSgtau65P8CQuQZhAH15czwADe7
 o9zq0YyUQrym5zoIeyEGJZhjng8vroxESWRDFy9htBHUMcmms1PttoX5gB6WftVa/OEI
 lmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723034083; x=1723638883;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jn3A6dw+13YgQfD6Kv5Y+2JlSAYHXpU458T7zZRgiqU=;
 b=cDJiWSHMZpZXLGK3VPBO96RRBMNWc4RJUAxiDzpZ3DTDQhDO3s4AuOEqZqiKlnQwdS
 8DFcROyKGnA25ZTUz7oji8mSAZOkAONCKk4VaciRu3ypEKRz3mDvoZy3qlyvDIpZC8v5
 ElhvEtLszZd3Evg1FQIbGjFs59XaKDQsFGZ9kEdCgtg2v2ElCg8JegpzV0RsQYBzWMx3
 HZ1FbkVLgHhlpfftAYwduzUILMpzeaxT/Y1+Bowwo6hEhOGCnDKIp4IBTY/0ufB3wIHU
 cJIxm/gfQ12TElzegPR7zcGwkmYZ8sjuhPafzEilk7zkTXbbZVlY/L9RqolODhrkqpa+
 uOsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9BVQpya2ksPfMFcVSNusgsk4TJpS1B+BuVj2CzGp2ibNsn/qSupKhKppRAotuWF+ypuXUaeH6ZWfkCB7S2ziwaitIpVESd9UHGPW1nJSV
X-Gm-Message-State: AOJu0Yxn5d6rur7Y3E2VkSLQqlFfzj2CybkKRSQ+c3uN6bxcn4kbMwX3
 lL7TnaSYbK4IU2RnSpIJ/mOgj5iCZUmQepdzsPRoM2QW/0YFcVI8
X-Google-Smtp-Source: AGHT+IGa3/fjyXnZ4344o+/xUNJiPD4/sYgdoWpjpRSWrkpFPUWwDIDrZwelCjYSciNp7q6gKmTovg==
X-Received: by 2002:a05:6000:1fa3:b0:367:89ae:c204 with SMTP id
 ffacd0b85a97d-36bf0dad2e0mr1807561f8f.12.1723034082973; 
 Wed, 07 Aug 2024 05:34:42 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 05:34:42 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v2 0/3] drm/msm: Fixes for devcoredump on a750
Date: Wed, 07 Aug 2024 13:34:26 +0100
Message-Id: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJps2YC/4WNQQ6CMBBFr0Jm7Zi2UkhdcQ/DorQjTCKUtNpoC
 He3cgGX7/+8/zdIFJkSXKsNImVOHJYC6lSBm+wyErIvDEqoWmhh0LZaoKfsQiT/mle885sSkjb
 DoHVzGaSFIq+RjqK4t77wxOkZ4uf4yfKX/p3MEgU2wjljSMm69d04W36cXZih3/f9C/JVMQK8A
 AAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1002;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=UEqG1Odjh7UfbwFydAB1tQvm0MzYcGOEpZlOqOPrxps=;
 b=1UqRIinFRoGPrikvWkWl2pT5LzP+9op2cS3zHv7GtDp+q+0WwcZt20NbLJFlatkHwthJvHzhy
 WH2R8tdWvoiAf93P3XDOOwv5ov4650dV/o0gJxeN6tuOtd2ILeYTy4Q
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

Unfortunately the first time around I made the mistake of not checking
the devcoredump file closely enough to make sure it had the right
contents. This makes sure we're actually using the a750 register lists
on a750.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
Changes in v2:
- Add last commit fixing an indexed register name
- Link to v1: https://lore.kernel.org/r/20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com

---
Connor Abbott (3):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750
      drm/msm: Fix CP_BV_DRAW_STATE_ADDR name

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 46 +++++++++++-----------
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  2 +-
 2 files changed, 25 insertions(+), 23 deletions(-)
---
base-commit: 5acf1f91d74433cbfffd9df962b6e45f5d3ef253
change-id: 20240509-a750-devcoredump-fixes-e59bb5563b1a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

