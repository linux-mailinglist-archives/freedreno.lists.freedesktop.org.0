Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B386E8D4527
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 07:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC75410F112;
	Thu, 30 May 2024 05:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i6KBI/lA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE97811B3C5
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:57:45 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1f62217f806so1109115ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2024 22:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048665; x=1717653465; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Spln5gkQq1YOd2fgu2vLWG7jbq/zrTdhGVBswcY5AYE=;
 b=i6KBI/lAV73aU9VyNJp3LUIBydtD0Lo+xVs9kJGAQ8DybgR4xrvYVKcXg/cFiNOeEW
 36gfCcqdCzYQL8Uaxk/GpZ4kfFn3XCxwWg3rVIAj2Ar4nb0uffZn+Ib3H9eke3S4EW2U
 46SKGEEVRLWEU3vKDatMk2rfBbZby1GGrlAAEKB8+5SuWCgZOwuR5C7C5OmPtyBRJP40
 hWXJXQFeXsfg8X0dOFKTpKSFg4vJOj2DFrWRck85BcsgBH90g/QvCnSadf+OaYinaUll
 DxWf3KlAwa59ornp8GjjYhw3nus3xyJmPy03j1WGBF09PjZbSFbIUiEbGo+W9ngiN6xQ
 JnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048665; x=1717653465;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Spln5gkQq1YOd2fgu2vLWG7jbq/zrTdhGVBswcY5AYE=;
 b=NmGlFHHcOCekifVhGCUwKTIy/tu/YHShnVD/vi3AydNUqXcPfWmz4n8Bf8a8ZRME9G
 YSexuCOuiKaeqndWZsG5hbdE38FTfVF244FWlJn5C0XhsZW6AXHus5PbUJB2eDpNZzzM
 4tinr6GbZcbE1qJ/6ByjdVn9WtfNId4a/9XXrzyXdob1caHRSKr54xtJQUwXsXJQ6Xzo
 7p+1XGw6buH3abCW6TZCXj24rbTnnZICerRCY0Nt8UX7zSFhb/LkbH1lb7rGl2Vmd7WL
 zar6+yPuNsDjL9jeBwqbV0va5pqW5bzoPILuqR+8CzTYb1sH8j4VSAzC2cNMpeYgonYp
 m9CQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcUUyhlgLezL+raICi19ZQ+yMCz/dNykqLjmNbXIphmmhadtHyP2j96mpIh4Kby4ZCfJPO4UjoU241AMnq2VtHDaKvM1s7WQFWzUnvl7i3
X-Gm-Message-State: AOJu0Yygqr9dYTjDebKqh4hrgoKHRINY9O2aJziA5JYpiVjnsV25I9tl
 ySVF0LMRDz2KfkNGMaqbxmEDMk3bJMz9I5y+bYYuPAoTdT2c+DuEDgNJqu9Hc7w=
X-Google-Smtp-Source: AGHT+IFHGmhHD4um0/YgnzgPupfzLskpRYLEH+5hxpvbNZcFbqfu8eTLCu216oAgm44KsWnK1kos/A==
X-Received: by 2002:a17:902:dacb:b0:1f4:f1dd:5b5 with SMTP id
 d9443c01a7336-1f61961b919mr16621095ad.20.1717048665030; 
 Wed, 29 May 2024 22:57:45 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:57:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:50 +0800
Subject: [PATCH v6 6/6] drm/msm/dsi: add a comment to explain pkt_per_line
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-6-2ab1d334c657@linaro.org>
References: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
In-Reply-To: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-0-2ab1d334c657@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=1459;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Ol91YDKyTosh4Px1J+abmBIR/KLUuHmXbEEWr2MUT+k=;
 b=GFoJEfJHKwlXuosM2S4bqgls61tMVX18LSIpIQv6l2QxPPxTGxRqjEQ5KCf4se6vDZ7v9Uygl
 rpXXCtGSUOFCwJ8drM2z4tafHOOc7L2ce9pH+dbtzRUpMPwf4YHhP4s
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

From: Jonathan Marek <jonathan@marek.ca>

Make it clear why the pkt_per_line value is being "divided by 2".

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7252d36687e6..4768cff08381 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -885,7 +885,11 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
 	 * registers have similar offsets, so for below common code use
 	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
+	 *
+	 * pkt_per_line is log2 encoded, >>1 works for supported values (1,2,4)
 	 */
+	if (pkt_per_line > 4)
+		drm_warn_once(msm_host->dev, "pkt_per_line too big");
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
 	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;

-- 
2.34.1

