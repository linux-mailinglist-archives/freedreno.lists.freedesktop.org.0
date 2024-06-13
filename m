Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A790795B
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 19:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCBC10EB47;
	Thu, 13 Jun 2024 17:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xs6kZqYb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC0310EB48
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 17:05:11 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2e724bc466fso14402301fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718298309; x=1718903109; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5FbDBTh475IVXrIAo8lTadv4qb1jnkcH0RKtaD/LKVI=;
 b=xs6kZqYbsQEOJPM+dDNQ2ymXIRGKbr9JHOX5rvzCNaNhp8O1070YQNV5DzFYaoLhfI
 0lQg77llOUx+zgqWPZoDJZIXg1FTSFjoEJ/Hb7blvQSgFg3SFF3MoTBVFDnfcmEn3PFB
 jHRdKv1FAF7/uBYiCoM8ECTKQM4IdzT3r9OeEv4ycOWj0QnqG/p3CP1mcpoLCUUoTlc8
 VAy26dH7qxYHGt8SOLrCjPqMlRDMeElSv0L28jFcwfY0/Bj/8i5Tei38kLp9m0eNMikN
 LkPCpshftFsc0yjqjfJqK+3DOzNqYZLZ+56JT4dAqLKtdU959q20m1TDqU7xv0AMV6aR
 pLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718298309; x=1718903109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FbDBTh475IVXrIAo8lTadv4qb1jnkcH0RKtaD/LKVI=;
 b=kaos/eieYF06NZbH3U45mNRJIZ6+jGRWXgHBNh2rvhiHwaNY5SO97p/kFlqUK9Z3+a
 OH88bKQlVu2DbaZvWuH+MwTpIvcovWzHK/hELgvN2Rhc5oLxqE0zRMmgtncGNj2gIaSn
 jLS1QSMiQYTz/02xIeN4BWhia2fe2/ArxuG+0oLqUga0r/CwH5JbQOROogpWMwLZE1QE
 rLAHOy8CtPBs54gNCIdRCZ/ioP76Qbmw/ILT6xm4KMDPPjTo5YbphJJtPDeB3/CkbFgD
 jqLhKgDclEh6LHTI2pIUkYV25wx+Ee3cN0RJ56yTm2yqEGnbFLPOgZVDydXGtrhcZKba
 X85g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVEiJAg2vymN/BmBY4L8c31GFqEPh65pw2hyzkg6H9lFgFr3TvR8FbnumFWlhClSHLYVKb2OCq9sneG51RBc3Gr5M9gOZeu0BhcTQK0VBP
X-Gm-Message-State: AOJu0Ywis81Jm3Qwv4JPY6mBGOejvns4gLaTPkBPZF2jcl5W+t6PpIB2
 43gpOqEsBcNE4NbPYAgKcl+Da/+MUDh2l1ICI4zD7zl41Qd8hOuW1KXriOLRIIQ=
X-Google-Smtp-Source: AGHT+IGuznTjlxqgv3P0bkflpBLh9xuQS717dGNXxqv0wmC+Kmsqddvyv7lJuM6V8HQaJ/ykaiaJzw==
X-Received: by 2002:a05:6512:41e:b0:52c:8abe:f54c with SMTP id
 2adb3069b0e04-52ca6e6dc74mr285044e87.32.1718298309708; 
 Thu, 13 Jun 2024 10:05:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 10:05:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:07 +0300
Subject: [PATCH v2 4/8] drm/msm/dpu: pull the is_cmd_mode out of
 _dpu_encoder_update_vsync_source()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-4-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HIriNWIocgMjwNxbdTrc6hdy7i8ETZY5Lp1WWcPraew=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybB5Z7y89l6cLJU2BChnXolSpVGWDwUrZSkL
 OaZ1V9hqdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1ULwB/9Pts9j6Uygy7d2/fSSfPP0RqwjRv5Iv9unMTzra3+hxJ9O0Kr//2C5aMkvHRJAxhDtDPI
 xoExO5kpEw1MspSzz9beEkuiO3KjLAtQ2AGEdpASLZldN+fGEsAmeC5uAcN4kAjKD05Vtt5pC40
 KVEePDKceoilkivmi80GIUlqXY16PujTuS8xsFoSUPcCfSf43OQUwgcERq22JIJz5p1FwWsI1ch
 qyd7Iroz8L5T3ynIrCuTQ1GUwcLewRilsc9Ugby00p5QxnKsV8qa118qeVaWAbYjZj2oJjDj1lS
 GVi6+urbLyxS1sMgZdTudWDyCZ42ew965Rzbhey1d2CP3tIE
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

Setting vsync source makes sense only for DSI CMD panels. Pull the
is_cmd_mode condition out of the function into the calling code, so that
it becomes more explicit.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4988a1029431..bd37a56b4d03 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -736,8 +736,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
-	if (hw_mdptop->ops.setup_vsync_source &&
-			disp_info->is_cmd_mode) {
+	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
@@ -1226,7 +1225,8 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
 			dpu_enc->cur_master->hw_mdptop);
 
-	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
+	if (dpu_enc->disp_info.is_cmd_mode)
+		_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {

-- 
2.39.2

