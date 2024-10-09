Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EC7995FEC
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2024 08:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7A10E13B;
	Wed,  9 Oct 2024 06:39:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="weHjzLsG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C210E0DD
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 06:39:25 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-71e053cf1f3so2538656b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 08 Oct 2024 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728455965; x=1729060765; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PrrPIemNfkhENWcftefzia6KqrGXwnglRYTMtDKqEiM=;
 b=weHjzLsG6OZsubBig+Z6u/0VYmjkEnIBczXrfHsZn1sGO44uxEAVyIOs3XdAlGVsgM
 6luvlGPsOaIlij+JdmdHaJRDZ5eljG1iqciErp/DXnrgxUP+BLHmPK2iCblM9J/YVQzv
 PLaHIuUvlo9VUUQBrdWUOzN0xQOfXoZJA1jLoyQKSjIS3lI9KKWR9qeFDx03fCPQq0Ib
 2MWd/mgNYc5dn/xGh4+keoNjmfQ1zDMPv+UO6THhkmiSFEONpXMzLUlKrCxUXLfUvIST
 36Aj6rf4stqCog4CRQ5wVFkgvJtNlgQeNPzoZXgyoKpyFmNg1lEszrHLh07kXgCK5MnD
 OkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728455965; x=1729060765;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PrrPIemNfkhENWcftefzia6KqrGXwnglRYTMtDKqEiM=;
 b=IbcQZIWvkSnasaO9ZUYgd2Kmla/Uy8+SUV4UYSoMg4coDfS6QlXCRZNjS8T5KSxs2f
 mT2ADKJPUFU7vrZtxwFI3dclDv6yykkble4FMwWHzcvb2zbQbzyLbqYvQMxG62Am4rAZ
 zo974V+US1OiZUEvNmdmBO9js31Qoz6hXgdknpEyln/bRjIpvKiwZpTYfH0jCavLnJZT
 3d1F65JvCATqfveXzygo8F9sWrCPj22uJpqbo6516lHdYwNQChN5GL+5ylNRPt+5neLo
 xZt758WTLKf9yxArHpHoQT81P/qiI1Vc53pdiO6wlhVaJoZ2SnHDEXHZJa4vdE4SB9zI
 SS2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbN0xKITd224btzYeGH7QrxMRrY8p4qWt5aPNEQwNQqUbrPEk7NcU//EHI/4pLD1S6f7FY1dlJEcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3J4b+QAQwERV0Po7Z3SkrCfP/TXQz/IRyiwqmWHZaW+lAKhAw
 n/MbxIdwfW5tnxw65eUphzlNtNueHo3G/87Ks3w2REWNUA+9buvLidNnDLJgawY=
X-Google-Smtp-Source: AGHT+IGBfTNGbev/m+8IxDePf8DpPM9r2qpGbcQIw0raY8KgA6eNQUqQG4EvltrCwsXM7gWXCsUt4w==
X-Received: by 2002:a05:6a00:17a7:b0:714:2069:d90e with SMTP id
 d2e1a72fcca58-71e1dbcf4cdmr2006826b3a.26.1728455964787; 
 Tue, 08 Oct 2024 23:39:24 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71df0d7d209sm7077396b3a.208.2024.10.08.23.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 23:39:24 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 0/2] drm/msm/dpu: Support different number of DSC
Date: Wed, 09 Oct 2024 14:38:41 +0800
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPEkBmcC/x3NQQ6CMBBG4auQWfsnU8RKvYpx0dBBuijUDhATw
 t1tXH6b9w5SKVGUHs1BRfaocZkrzKWhYfLzWxBDNbXcdobZQVNvb4zdwhhMKSAvw4gUVPHZfMC
 WdS3iE1qG6+QuV2cd945qMRcZ4/d/e77O8wfc5mMVfQAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728455958; l=983;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=SCHjFQIsdR1TnrGkWnIJtwSLbGJzA/1R84z2bftBMLs=;
 b=paM/lwN/b8w8+thx4R5FIkzdnLqhpd0r7l/R9H63EDwsjBlXSEOcTI6++wUc1xuL+02xnlbIL
 PpD+gZ/dO9qAf/qpxuISXRSijfXtsDDjZd0SxXWWzkPe34V8D64Aa0r
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

If DSC is enabled, the only case is with 2 DSC engines so far. And
DSC in all pipes are configured by default.

More usage case will be added, such as 4 DSC in 4:4:2 topoplogy.
Pipe number is extended in future to support quad-pipe. But only
some of 4 pipes are used in non quad-pipe. So number of DSC is
not aligned with maximum pipes.

Thus we support DSC flexiblely with this patch set with storing
the number and configuring DSC with it.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (2):
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)
---
base-commit: 6fc951e4d05d152cfc3c4442cc4e304c927dbf5e
change-id: 20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-94e7e3969089

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

