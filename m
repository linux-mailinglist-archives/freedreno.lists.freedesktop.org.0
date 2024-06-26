Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D49199FF
	for <lists+freedreno@lfdr.de>; Wed, 26 Jun 2024 23:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DFD10E9CE;
	Wed, 26 Jun 2024 21:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IzGyX4dA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8ED10E9D1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 21:46:16 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso77600771fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Jun 2024 14:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719438375; x=1720043175; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s1yr/14qrVQ/kYRjN6UH7sAJcJ6ZPXNM+nWCpzFkpGA=;
 b=IzGyX4dAlDZ/qAsD45xqsi0U0zh0tG9XQu7bD813IuU3N6F3/2yntW8D5VrcVY5EWE
 swRw+Ddb11HCYyqG0WYTqPg/Y2+MUtfSpHOra4nZX48evJiK2Q+kT2JAOMSBy7LmpTyj
 BOUQQLPCfjTWnlD6PvIw5oPyostvNlBMWcy1iO7aBzQ27hzrWwPEQ2obzX/dOjnI7WOE
 j06syHOCDPj1MJ3pkwv9PAYLoioWq8eytHaU7pTiuJE68m/kjTW60BNkp/zjImAVFa6s
 /kH40Ac6NLHxA0s8AXQed9swx/o6klGmSGN9OTD5MmEgEvNBczdTseUPBdvDhEH95gG/
 +zJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719438375; x=1720043175;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s1yr/14qrVQ/kYRjN6UH7sAJcJ6ZPXNM+nWCpzFkpGA=;
 b=kd5aCvtOmOsivngfN9JwmzBxrvA7hhkLV+PmR9SJnuTAdaV5fPoFDWvA62qfUMCMr5
 mK95qy2ABe65AcG9SW9YCTOwDg92QivmC8NXJQproh48NnqikDG/m3ukKj22WnxMQ5KD
 daj8rfkAt/pI0oDkD1wA49dtzVPc9aUY/xVV4gzFlpyOw034r8CQ2AwhL0zrzXN6Yt3X
 aZRyraAmpXQcR4Jibduxk71pU60ng6IOH0wY22aYXBS+E+eoku3eViKLVAloxiw6Lv9s
 o+0D5q4wdzd3Eo+8xxyKZer2bG7xcC0/2NnVD62UqQbrvd407k870nQKgq+lnGumXpIL
 NBEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGkdGor+Q/A1pMa5SUp3QtrLenFYdCc7cpPUI6lkzfo3RvOqswcEluR+4/zvGppZh77FcVS2MfhrzvGGDNiza5msgMXv8IrRRxHyfgrNfJ
X-Gm-Message-State: AOJu0Yx/868d2wamPiWjTNdczcE8qAMGIILjG7bz1oEGGDNIBlZ49yGy
 2dBzD/Cqb6KqjxZLrkHNC7nf38BvaoZRCMKSWvxBx03PPP+EE682kgX0v/0UVuc=
X-Google-Smtp-Source: AGHT+IEjuMjBrK+rXfyXxF8hbNJfQANvpjcRm271/Z+9lFiuoS/ksY9Q8TulAVC4m5zzVOlPgVgzaQ==
X-Received: by 2002:a2e:321a:0:b0:2eb:f472:e7d3 with SMTP id
 38308e7fff4ca-2ec5b2840fdmr67894431fa.6.1719438375097; 
 Wed, 26 Jun 2024 14:46:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee4a350d96sm23201fa.49.2024.06.26.14.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 14:46:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jun 2024 00:46:06 +0300
Subject: [PATCH v5 12/12] drm/msm/dpu: include SSPP allocation state into
 the dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-dpu-virtual-wide-v5-12-5efb90cbb8be@linaro.org>
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
In-Reply-To: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eEJvD1LxPrQrE2+bV2Gb2aZ/2mj6knY0BTuucbpbbko=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfIwZkyt5CzRwY3hfsGPrmhjoZC7H00MHWqkks
 GnB6wan0WSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnyMGQAKCRCLPIo+Aiko
 1XUsCACGQ+zsNDJAcL2Bw2/6RRgLe/mxiy/25t541pd6McAGXfdLlKyKlvpgn/FvjEdp1kRVZoE
 Vgx89cQD8WzLjs30HcTBToiSa/zZ+FpJOOk9CN00h+ttZrS41M3chOqvuvWLFGehdUDKud4lup7
 tf33yO0k7VszARMOwQ3sWgNDHL/kiySr5oIsskVLvTyV2iz6t7s1tgbs2k1GKowVTWn6o7oUSGx
 qM/p8o5TW+rU+Yu2vdrkH6nFU6LzV7tCdH0tllE49FDUNMAhPpzHG3H2qM7YJcJanHUg04qCsz2
 ObPQOKuwU9MBta3iru/e5vM43Un2xj1W6U0sRoMmSfc8GStG
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index dbf1f7229e45..3e3b6b8daa5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -890,4 +890,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.2

