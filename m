Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364738D0361
	for <lists+freedreno@lfdr.de>; Mon, 27 May 2024 16:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D394F10EEBE;
	Mon, 27 May 2024 14:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dFbFVzRo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849D910F377
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 14:23:45 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6f8e98784b3so2441129b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819825; x=1717424625; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
 b=dFbFVzRonwodbZ401VfzXYhe3jyd8HXaX2lK1oOru0ANRjvevGHJfhoNodGvHBNFJC
 FRxjqh3WQ6ioaKth8xXhG9PhFCaY/VWK3xrPjFsR+un6+HRy0njc9DtAZJ8DNZBWFVWN
 U2S6BAhUalocQGCDT6UKYe7OBcix8orZbqn0ZHvWMPZQ73DdGSVRJ8iTPQ20Gyre2x+Z
 WJ3CwbDAa6mY+mLPV0+Wd8QC90n9lXHG+Wl/eHV7Jr1YH1de4DOFxAtGTjTtY13zsd5g
 vT0LOd3eGnzOT/rY4okYzFeOBx4QyoJie11MWNlxrd9uxmH9viMvplmSoGddIMGsTi9U
 f2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819825; x=1717424625;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9zZvfy4gBMpippgmQ5wbc8/FSu6Fg33BHDu+XbQ+New=;
 b=AzWKX4lp0vGGamw6w9B0botugVn8VRKZR6GS6/0UgvgzeI1+mXXnx3zRK4F15E97ga
 wkSuogUrvnVRIZD9aObTleHwR2hRKA3M65Fm8Pp+WrA/YAbqcBmxnSBrUwfK8hGSTAaB
 aHefp2mXBL2HmcFHq2zxcw8mO9ZM8xnj9co3JCUM/Sw4r89DnIF7avWEFOLHKszmPn4C
 KiF4PyAZ3iAwbWRWM6XX30D1/GF/hUQ6RacJWUkGfNhdJu5BJY+iUQ0+XOvcwN2RSkQo
 Yby4NJLIIMvdEkiyTv588GrUHZqrXe1QjyzkaRPVvtemKKQQKpyuTaYTwL2qSUsB202h
 0QNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMeJnSiyxUqzGhII3rbwVv8hDw8iDb3NRjnWU/sBCa3wH6OkynX9BEdCJxwZWvlDjV725ZFfclZwEs/dpkUBAgvK/eUxZn8Pn1c8Cit/Ln
X-Gm-Message-State: AOJu0Yw2GZqJCwS1s5NykkMz5ISN4w4P5kxeqlzjGiQE7R2EQ52y7Afk
 zSEp7ikN5j+keQVfajsGSPfS7eBxVWe5nlzK0yJKe3wQJhEVlXhYPC34e4OYN1A=
X-Google-Smtp-Source: AGHT+IFNKaRSlZszopjikYU0pMskYc/ekBfYriMXVMO/i95lcWdRC6YJKq+hsm5J3tzzdDaM/zWi/Q==
X-Received: by 2002:a05:6a20:72a6:b0:1af:a45a:a8de with SMTP id
 adf61e73a8af0-1b212d5aa97mr11310422637.5.1716819824793; 
 Mon, 27 May 2024 07:23:44 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:44 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:49 +0800
Subject: [PATCH v5 3/6] drm/msm/dpu: enable compression bit in cfg2 for DSC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-3-f797ffba4682@linaro.org>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=886;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=puwV6VMl3Gje+6cIe4adoHwyL8CXWB3PvIs7MINp1lg=;
 b=ZogImoZXzCH580LPFWHl29ocg7xqFmLTY0xbQUs0QVH/Rf4R1calGI+KqzyIgCRbmiPD8fn9V
 6qwpylPoVrBBEX6cdG8aua9l2xblGmOgNFwbUeRWLLOM6Wl0yuwy7Ny
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

Enable compression bit in cfg2 register for DSC in the DSI case

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index f97221423249..34bfcfba3df2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -177,6 +177,10 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	if (p->wide_bus_en && !dp_intf)
 		data_width = p->width >> 1;
 
+	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
+	if (p->compression_en && !dp_intf)
+		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 

-- 
2.34.1

