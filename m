Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207798C121D
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 17:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CAD10E30F;
	Thu,  9 May 2024 15:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jKpw0Zc9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB93510E276
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 15:41:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51f12ccff5eso1345293e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2024 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715269298; x=1715874098; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yj+NFSUX1DfXY4ApuP2si66YNbZvOFq6Ph0ohRBSS0=;
 b=jKpw0Zc936qRgzUuMtl5i3F/Wp3MVdJ8rTWX2+sc1eQOUNFXTSnjrHSSC5Z6XB1IpR
 kL3JFj+sRecR7BJvQYNrZYB1VBqW4V4w1sUom37s4dnTCa3sc4jblfoJUaT05HmSErLW
 Nq/muR0O2hAPSY1+F8seZ1c38JUsEdfRFPy+mHttK2pjw5hOrlpBrrqVNG6f68tHTPyu
 Vbo7YBnLoHlamGScc9gt+voyCfIS64P/VIzTwcjX5BqH0xa7crk6MlQK5wXzvkrj7tTp
 LSpAgnQsJ9YQj8lED7wXMQRXKIU2NSoMsWKE+XMGnr28AxmLyYtbLRogq+yNcYAMVK5n
 H8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715269298; x=1715874098;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yj+NFSUX1DfXY4ApuP2si66YNbZvOFq6Ph0ohRBSS0=;
 b=aq4gA3FzFNhT2Ia6u1bF9KwjJQJdWfS2Nqz1Z/8dRxEfxbQfKoVmUgviz2LftE1qx2
 z7b89wkPEKy64iTXWvDU2lpALL+N7HIVFZz0b1UlpOmDAJ55RYYcAJO/UWjpOCbgBLUW
 j8mYFTXZdBBd7ahqvtgzOjT5Y3mjuO3LZAnnHC8q68u3gBHO6SUGtRuygsWEmmYuz738
 c2bq5VVxpNlgNT/Vwtj99t5Rs+KZrRlYqj1giAa9En4Iv1I7fGxMFd/i+T0n2UW+7NJ1
 fbVfkkk3sVeKHw2wj+jdqMJumXREXrWObElxmSUt7aYJX479FRAExVokyGS50K+29lI1
 FTPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaagBtVj4m8pzYc5ExbzgkZaup0kksXIQUs/Cf0jraD6X6bMD/KUL9xop/md6N7OPs4NgWkjSKd9VQkzUQtLZree+rqg+OIi/lSzEsIQz7
X-Gm-Message-State: AOJu0YzyMmj4pAVxf4/P36L4umeYMgO1gEoJgq5Ap5V8UmLWPTCq8tR4
 U0XCqWY9TBKgz7eAAl1hJp0baujRwG1MfUcV73hSZRABaeV9sPb0
X-Google-Smtp-Source: AGHT+IErlm4uMmWXAJPrNClZqoZxt8hNS6DUm1u/Y5/HYVdV5d33CGH5gXSjJME5IVmbmja8JzVlhQ==
X-Received: by 2002:ac2:5bc2:0:b0:51e:eca3:e02f with SMTP id
 2adb3069b0e04-5217cd4b442mr4058267e87.67.1715269297475; 
 Thu, 09 May 2024 08:41:37 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1b17sm29577555e9.12.2024.05.09.08.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 08:41:36 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/2] drm/msm: Fixes for devcoredump on a750
Date: Thu, 09 May 2024 16:41:32 +0100
Message-Id: <20240509-a750-devcoredump-fixes-v1-0-60cc99e2147d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzuPGYC/x3LQQqDMBBG4auEWXcgxk7FXqW4SMzfOouqJBgE8
 e4Glx+Pd1BGUmR6m4MSimZd5ormYWic/PwDa6wmZ93Tiu3Zd2I5ooxLQtz+K391R2ZIH4LIqw2
 NpzqvCXeo72c4zwvmOAtWaAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715269296; l=718;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=lk4Vc8zcC7hlsGJ5GNpBh4JGJ3eQeEpSlFF5xjLcSKU=;
 b=TqXSOtIuO5iRrMEoB5Ar8HBnN9H+RUzuboyjaei9LPmRpRIed9O720d8q5mjaQp0ub3rvRX61
 j9GEKssvrGWDYBstLnDgjWrJkSt3dVnx4o/kmMfjHBOeLLOcjPznpOV
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
Connor Abbott (2):
      drm/msm: Use a7xx family directly in gpu_state
      drm/msm: Dump correct dbgahb clusters on a750

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 46 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 22 deletions(-)
---
base-commit: 5acf1f91d74433cbfffd9df962b6e45f5d3ef253
change-id: 20240509-a750-devcoredump-fixes-e59bb5563b1a

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

