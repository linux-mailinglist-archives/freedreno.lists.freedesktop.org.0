Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102F68B2310
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 15:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D5711200E;
	Thu, 25 Apr 2024 13:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WJVanxXy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744F811200E
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 13:44:52 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d8b194341eso9507551fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714052690; x=1714657490; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=80Mots/dK4gyAXTnhx+FHFnhKcgvoR1D8qAAi0ppbjM=;
 b=WJVanxXyeZAXAK5Lr1TS0DUK528tmRHkf08LKq1twFd827vR7B5TDRXskHVq+73abO
 uZlfOUtdpcj2kBBsr+l2gX9czVPM1qo162cnkwArmK/4yHvPyoRoUKbwiI/ZIb0PAH3P
 icIyvxgntgEDrrh+j5/UfyO92PwCy7odomlcCaIJK7NyOSZ849ryiEYexONgDjvRHaYo
 7uqsS+TjEFLFNk3DQ8diFzGxtEJ5et7etBi8KKgzZl3S0am4itztc9s2W9AUjcTzReGf
 lFVtqn9+lLuqLSajIqGsEBcMHRjiKDPZk2aOhBQeI8qokeIsbkKFT5As58Xw1ub6dyke
 U7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052690; x=1714657490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=80Mots/dK4gyAXTnhx+FHFnhKcgvoR1D8qAAi0ppbjM=;
 b=R31qdp9f856MxKKwa/LwbA4RP1384GXYXEbbYKpChVNR+XCNkL6qF0OGeSmpv3gzrF
 xbmdlppI5IQPd5EUa+JcF0ZORXWAx+PnnmRV25m06JFI6yj38RWTRrFQHtmJ87SOcnD9
 X0NqjQaKtO42IQqcZtBUXDr6Iz8y/CirztEHdrd2x0rVjsQ7MywTUaPe3c1srG3why5K
 n3xJkoQ/9vsD92Cr/siGK9EdK3NbQaaBgp9qhZmNSXz7+5TcFcC4b729j15HrsUkI52V
 EpY7Isxf39riSYEG5zq0MVFNSXHCF99rM17NAwu6XFzARiMWd2RRuEsAzKNRgUZy1C3h
 Rd0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYp/PbpYyeiRR5S6nT5t+zRWi6j74e54lHKgfd+5FTcoDdzij2yFsTBcoDsOMe/W4rDr0I2o0n6S/CAgMbGKGnIe75hauCrWE0FNvI2k2k
X-Gm-Message-State: AOJu0YwHYjNbXyuaxvCxbv41XcZLfcbRGjkXgjX48OGDAiBjBbIzBtar
 BZYJVOQ2g0/QCR/kUkoU/nympkIH07RoXiyF5jiBMkxX6e20o0TX
X-Google-Smtp-Source: AGHT+IF+bKo8BjZt1JJiQvfXOypqRzU/qEPWlXRDnVtVzK2G4v48y1SV8lalDBDLMGdvxZxkHS7lxQ==
X-Received: by 2002:a05:651c:222b:b0:2d8:d8b5:73c7 with SMTP id
 y43-20020a05651c222b00b002d8d8b573c7mr4403430ljq.23.1714052690462; 
 Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 6/6] drm/msm/a7xx: Add missing register writes from downstream
Date: Thu, 25 Apr 2024 14:43:54 +0100
Message-Id: <20240425134354.1233862-7-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This isn't known to fix anything yet, but it's a good idea to add it.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fb2722574ae5..e015f3b43bac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1953,6 +1953,14 @@ static int hw_init(struct msm_gpu *gpu)
 				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
 	}
 
+	if (adreno_is_a750(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+
+		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);
+	} else if (adreno_is_a7xx(adreno_gpu)) {
+		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));
+	}
+
 	/* Enable interrupts */
 	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK,
 		  adreno_is_a7xx(adreno_gpu) ? A7XX_INT_MASK : A6XX_INT_MASK);
-- 
2.31.1

