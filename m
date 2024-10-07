Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557999923C5
	for <lists+freedreno@lfdr.de>; Mon,  7 Oct 2024 07:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22D710E2FE;
	Mon,  7 Oct 2024 05:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marek.ca header.i=@marek.ca header.b="GPB+5gsM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0240510E2FE
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 05:06:01 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-6cb2c5128d5so32725506d6.0
 for <freedreno@lists.freedesktop.org>; Sun, 06 Oct 2024 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1728277561; x=1728882361; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=roE3JMr9lMbeU1huQ5l+ymUGwxuvCsD8E2naNBrZpXE=;
 b=GPB+5gsMUts7+94TXsPX7NaA74weOfHaXCymS2WdbFhSJWsZ2iUjXexehePmvdOkTM
 +c8uB6nPEvpJM99tTqxdNZBkZ7PXTnUVWLzM46mb48tOzIp9LOIU3RBJLlu4W7hjis4B
 jaaFsjB5WO7UsDxvPGV3yRyFU+tLs3a7h6Aj2aM7FizUMnL7/45zc+T3PLZ76t/OSl0Z
 1EXPYCWnOcWyFZGUbr7Z9gIiaAr0YUCtWt9nMm/Gd7uuP2B3ldFjcQT2FtVmtWiVII/5
 OTGR7tk5ZozazsOMne8KBni4qOe8h9vPix45getJ01+mjH787w0T0pDJhif1865/Etz9
 HgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728277561; x=1728882361;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=roE3JMr9lMbeU1huQ5l+ymUGwxuvCsD8E2naNBrZpXE=;
 b=p6fUQRIrXr1LtwixtTDzQQENHb60k/iOVkNWjDiKLFPakyd4/OffUA97Lu3vpF//Pq
 F99eUYaQN16MgXNBI/QpvgQawdtSVVcBmSFSU0JeOJwABr8Zs2wwE34LFKCjcKyXwshC
 RZvZPAwq43xLzt6jeclMLIctVmkpITlxfK3lsIFT6g0J8JW2WGiPxdDd9PkuUEZhr6KI
 YACd1mERr9jG2Q2UGEqYzqVgMbnhnrE2zwJJ7rS6tKj/ibddFgXLNQoatFGcay2DWKIv
 IYKXjDS18saiT8o4uLCg+hcNRuoDaLoycE5B8EMdqbO8kzyumEPJYFT6Jy3rBj+JTjsw
 UZZQ==
X-Gm-Message-State: AOJu0Yzd7BKMkr3ICZsZwj/jwluqWNyiJYyiPYQjXhoLybGbJC2oJJVP
 zTBC2J695c/3p2SmkY2lhbok3+EBFi24J2TeuaHz3ayxDonsCyiefBqhHrFVExTpBSkrbfnQ7M9
 A/Lc=
X-Google-Smtp-Source: AGHT+IEFqA0OIk3ks3aFd2muaztD8wK5Pr5n5CCRe39FVoqFWsj3k1MVbhTRHDeseeL2V/taCAEOOQ==
X-Received: by 2002:a0c:f40a:0:b0:6c3:e231:960e with SMTP id
 6a1803df08f44-6cb9a32e928mr162731146d6.17.1728277560758; 
 Sun, 06 Oct 2024 22:06:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cba476152asm22452216d6.126.2024.10.06.22.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 22:06:00 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display
 hardware), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display
 hardware), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/dsi: improve/fix dsc pclk calculation
Date: Mon,  7 Oct 2024 01:01:48 -0400
Message-ID: <20241007050157.26855-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.45.1
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

drm_mode_vrefresh() can introduce a large rounding error, avoid it.

Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 185d7de0bf376..1205aa398e445 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -542,7 +542,7 @@ static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mo
 
 	int new_htotal = mode->htotal - mode->hdisplay + new_hdisplay;
 
-	return new_htotal * mode->vtotal * drm_mode_vrefresh(mode);
+	return mult_frac(mode->clock * 1000u, new_htotal, mode->htotal);
 }
 
 static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
-- 
2.45.1

