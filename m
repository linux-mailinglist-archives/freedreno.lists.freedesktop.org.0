Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A44BED29C
	for <lists+freedreno@lfdr.de>; Sat, 18 Oct 2025 17:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC95C89C83;
	Sat, 18 Oct 2025 15:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Xx4SEYAI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FE98922E
 for <freedreno@lists.freedesktop.org>; Sat, 18 Oct 2025 15:33:25 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-579363a4602so3045056e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 18 Oct 2025 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760801603; x=1761406403; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
 b=Xx4SEYAIPA5+8eHc+uPdLXmNA4jdno+aU/ETe1FidnqyACRPMmiJB5Dc8PaEHVYkt8
 G3XBwv1a0RKBZYqTdrCBjJak8YzwWkd5KMYMGRiZ9Sq9fPa/+BpwXcLB5uRbf3UbTBGy
 TNVirNgywMeCJfDSBYlloJpErjqHlGmLacxMbnqI2zXKximu0DHff5NuCjzsznz0jvoe
 T91WlNAXS6CPYYir3L/PfweR16m69BYHJAdh4QTVT7i/6C8EOZiIO+sjFLnCkXaOuN92
 gefbnktCr84J3U0bBzTa7XP1uNPeJNipEiMjmdh/qwnLW1kvltS3X82GSFe+2duEEQfy
 b7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760801603; x=1761406403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JI8wqflBoJeSVeIoguEa5qYxvXUp8LZtN2UpxTSv8wU=;
 b=TdWle3zTe0qpOKfafAF62tBSGSEkSPw972E8P7YkbForbrwkCNVBL56bFy7VnudB88
 x3Mdd+MMBjawZZTBCAG1qxTFYfX6bSqNwfRzoK/Osd0n4XAYXou3dM/4qUxTevXcNAEe
 f1DyYBjpQRPb1Bl6nxEYtBNY7WYB2gS6P8nb0pTL+SE6kWrFGK30OFr4WGsAd0nxzAN7
 qyXwFqR6k+/f7HRgYUwcv4gXmQ4rXT+PAnIcpZ6SGca/rbIPHuHP3CQhB8Be+q/MIsrp
 so1wHWb3Azx3aC+RSH2v5RfB0a8GbE6njDUTbvhbPsY11BqyRu8QCeRoLb+cDsiqvI0I
 pxIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN40JJ4ySvoYBMi4s5gekwwn110afh6JWRJfrLz1VThu2nU9DHyLRsD5CnP+itUp2z726DuNe44zI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOV86HUAZrmwEqAOj4vBqFAfKd/Vkjss518NKafnU9E5PgEUmt
 ZXoUGVfeXjwGXEgAjcaGJSNApe4RxHGCGolGFOCTFcfx+CME91kNJZu3
X-Gm-Gg: ASbGncv6GwB++HSqWh848+02YVS3MO24rsr4Huw32+g4ieX9rJZ+mxrXuXEoIyxsKRT
 Fno9bwp+k13TcXuo9pk3mbiBWGoVCKzErzUOOObxg4l0CLB7Q9gWRuWUXbzJmFEanDBtChljnFR
 gpATeI9yPtZ4n9DyiqUQ6PjYy2SU6sS1IXsyJW0c/hDnyhJUl8Uq3psPmD8UVOAuNtgxjS7rzy+
 v/+7xjCGH3ZmkSYhgjqVSnAsoZxCZbiLyFMBSs5CJH94JUGxpEogdTZ+H+M2V8ofUvgjFq0uWlg
 /VeB4dRHZBWpowA4vk7tf8/FB113VtYvyfso1lVyhmo9/MCQ9NW1nnM4sStirs8XltwB789Q5+R
 +4XUpBNbL3vUMjc+2TDe7L/MbY5oqMjSDF2x2DNlWdrkbYfWkoAxDIYtHAS044xgu8nWxqGgkmC
 xJWihETgU/TKvcvjYVon0Sav2Zk6/n7FYSWqjH7Tvt2RgIRCtx16Fb69/u3LSqb6rf
X-Google-Smtp-Source: AGHT+IHNJGLhJHT1HKOGPxf4DSdDJIV4Mlmc7c1/MsjKbF5l/T+nMmFrzXfeEG2XR7zYb9PwANEW8w==
X-Received: by 2002:a05:6512:1154:b0:591:c379:69d0 with SMTP id
 2adb3069b0e04-591d850d2e6mr2429125e87.5.1760801602965; 
 Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
Received: from localhost (public-nat-13.vpngate.v4.open.ad.jp.
 [219.100.37.245]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-591def272d0sm836014e87.108.2025.10.18.08.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Oct 2025 08:33:22 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
Date: Sat, 18 Oct 2025 14:33:43 +0000
Subject: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
In-Reply-To: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Vladimir Lypak <vladimir.lypak@gmail.com>
X-Mailer: b4 0.14.2
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

YUV formats on this hardware needs scaling for chroma planes. However it
is not implemented for QSEED2 which breaks display pipeline if YUV format
is used (causing partial and corrupted output with PPDONE timeouts).
This patch temporarily disables YUV by switching affected sub-block to
RGB only format list.

Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 6641455c4ec6a2d082644f1488ea5f5605ccc208..9f8d1bba9139a7e09ee321cf1b6f30f96890918f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -267,8 +267,8 @@ static const u32 wb2_formats_rgb_yuv[] = {
 		.base = 0x200, .len = 0xa0,}, \
 	.csc_blk = {.name = "csc", \
 		.base = 0x320, .len = 0x100,}, \
-	.format_list = plane_formats_yuv, \
-	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
+	.format_list = plane_formats, \
+	.num_formats = ARRAY_SIZE(plane_formats), \
 	.rotation_cfg = NULL, \
 	}
 

-- 
2.51.0

