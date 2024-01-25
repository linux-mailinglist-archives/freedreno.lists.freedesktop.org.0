Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04E83C365
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 14:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D87910F516;
	Thu, 25 Jan 2024 13:13:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0610F23F
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:13:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-40e60e135a7so65717685e9.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 05:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706188340; x=1706793140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNxWDQODp2u2nvsfUSZBgNr3y3Sw8DhUV2KqFZyOFDo=;
 b=VpPqYNWYw8JtvIv/5vZdebGDNLpcYIAj7GBhU1CqsM4dQHv08qqL5dt7IihZK2vuzC
 VqToLSlWJEXcTMDVh4lEbdSq0eqzapPtXkQLQzB1uME5hAfOOqeXTYcbQxNXFDJi+N/d
 OpDmJ4aW0sn2bdi2D6bcO7Y4CkaylcXSYjO2ig7FBHWcQeFJ0N8Fdb7pzsktqG0pj4Eu
 qdsOKIeEoFauW7sHqJel8kC4wOZyWySZ7yKCuc6+gcO0EMTnR+aCh1fH/WIxqEQURSDL
 rfAMJkfCLKnw64DVTB5r3kvKBOSNKGzG3+IiXT8f9ldNyGEJ4dqvNVHfEckOxip1d95i
 Ejrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706188340; x=1706793140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNxWDQODp2u2nvsfUSZBgNr3y3Sw8DhUV2KqFZyOFDo=;
 b=K4/uWCTcWjsByTFlnUK5B2Mg4QbWFStjdu/0lgali/ht5BvWWvetMpn0pGY5icpQsQ
 4PgyPQf0erHMTL1FxLiq7w+gFw02I2epZ0l/u5mzE4zFFoIKThiQKYqvrCO+0Y+qSw9c
 8M7OdTI2160sfXMoIUroWAKX/ymgaGCJiFYxWZYgVIoqezdsVDVibijdc8MbkkZKDx/g
 yDLEXBQHe0EyGinvOq4o5z7kr+DOrZ7iSkCxGIcjI+9mT2/sbqaQp03yjaTxMWa7LRQ0
 INrUB2mVIEvuvB6EyJIeICjFfhVxEvcCizQRBU9SGgUrjGYWdxlOnsllw1B3woeCoGJs
 1SHA==
X-Gm-Message-State: AOJu0YzIDVJpwjrNfeyMHGcQuahblE4RJHgW445Y52J7Vx6VuEAfjRN1
 lzwjWBQzrI19Enl+gSDn/nBAXRom7jePET3X7qrQlLXTi6cyxRINQxCASBGEse0=
X-Google-Smtp-Source: AGHT+IHTg7LR8OdNilN+LR1HM0mr8iIndls7m7S7MCqeXNJo22Fy7OvbjmHVwiEAq4xF9noNFXWYQg==
X-Received: by 2002:a05:6000:1ccf:b0:337:cf50:5ff with SMTP id
 bf15-20020a0560001ccf00b00337cf5005ffmr817250wrb.61.1706188339825; 
 Thu, 25 Jan 2024 05:12:19 -0800 (PST)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b00337d84efaf7sm17076114wrr.74.2024.01.25.05.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 05:12:19 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm: Fix snapshotting a7xx indexed regs
Date: Thu, 25 Jan 2024 13:10:56 +0000
Message-Id: <20240125131058.2084628-4-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240125131058.2084628-1-cwabbott0@gmail.com>
References: <20240125131058.2084628-1-cwabbott0@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We were overwriting the last indexed reg (CP_ROQ) and we were
snapshotting the same CP_MEMPOOL block twice instead of snapshotting
CP_BV_MEMPOOL as intended.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 91a564a24dbe..54bf9e2fbcc9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1068,8 +1068,8 @@ static void a7xx_get_indexed_registers(struct msm_gpu *gpu,
 
 	/* Get the contents of the CP_BV mempool */
 	for (i = 0; i < mempool_count; i++)
-		a6xx_get_indexed_regs(gpu, a6xx_state, a7xx_cp_bv_mempool_indexed,
-			&a6xx_state->indexed_regs[indexed_count - 1 + i]);
+		a6xx_get_indexed_regs(gpu, a6xx_state, &a7xx_cp_bv_mempool_indexed[i],
+			&a6xx_state->indexed_regs[indexed_count + i]);
 
 	gpu_rmw(gpu, REG_A6XX_CP_CHICKEN_DBG, BIT(2), 0);
 	gpu_rmw(gpu, REG_A7XX_CP_BV_CHICKEN_DBG, BIT(2), 0);
-- 
2.31.1

