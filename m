Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01E8D4521
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 07:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A37B11B401;
	Thu, 30 May 2024 05:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wzXEBHcF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CAB11B401
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:57:36 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-6819d785528so375861a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2024 22:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717048656; x=1717653456; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zjKQvSlima36VVtlXXnQSyQLE9jYR8Z2VbliVMpmoi8=;
 b=wzXEBHcFO1HPMru27LBwiSJAvqDeD8zCZKTpEoarocmud+n1tVqHCPrC78N2nkj5gp
 778lljzEdfrLoaCnhKTkqWFWdjDcB7G2rTJe8WGJD8orMHJeWffrrN9Dybc0LNL4RkQH
 EdushdJcLFSJLKBYB7LBbUC1SMGXgB4ZMGj28nQb0XbDfvwcAKKXC3grcRR+rIOm7xE1
 5rfiojNFVLw66Ugxl0zLre/ErYOdMBxoHihdkTFbfkC0UI/9pMY7mxo6vR619EmyOJLF
 x+hiETmpgHVRPe1zkJ+4tINTraEdRU9TKSSozhGSyLLZoPGtlNJMmDTJDYSyE/KZdFId
 B2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717048656; x=1717653456;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjKQvSlima36VVtlXXnQSyQLE9jYR8Z2VbliVMpmoi8=;
 b=u0/JYzd8Nte77Egy2IbVHsesE6n8tAU2v+nY3oSLKXcY+asBqbucl3zNElh+7BDHQ/
 npz2TEXpd0xSw2EQXewyIFzhH4AYM9ZvEQ4xn1E3Pdo4g3Yms+jC8iLZJj9AT8bJOW6Q
 +2gagf7JkhLyYyW9K2yuW3cXkUCMgelfSRKoKvGHdtMK+UUuhT3vHto2qS41WkxkP3Rq
 HkVklVyL8iCctTvF2uuDVUaf2pJ42U5EppohYtoUsFkRgK97f5FFfeJCJG009La53EIw
 W9z20d5mJzsQOWrkk5L5CWTe+1RderOBaGOPrJfsANjoToufIPlh7wREKXBYDHY4vrCP
 6pJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhjkbbzqhOHvx6Vc0ORDEAFF1YENlY27x/quj8JEPOP1jcgHHeG0Vtuj15+ZOgqXykWNKCekpab025HxG6lRnInbAWC7HKrKhgeGo+HxN5
X-Gm-Message-State: AOJu0YxZkiWA1Cyivu7L0CBsAJ6b84wvKE/SuoZrLvdpQ/mnKVWvMI0q
 P+OQ4KPxxbBmWRcVRdJ9yPxtyL/LZW+yfpUiTeW6jXgcPqxbpagJHnWiFOaZ37o=
X-Google-Smtp-Source: AGHT+IEMH4mGQk2hbgj+JzWLlOWWaCC+qs7OK3TaxNAbxcOjuE9hv94mUwGDeFx1EZkiuVv1gPQ5rg==
X-Received: by 2002:a05:6a21:19d:b0:1b2:4834:7a24 with SMTP id
 adf61e73a8af0-1b264721ce0mr1190275637.45.1717048655803; 
 Wed, 29 May 2024 22:57:35 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75ffc6sm110006705ad.9.2024.05.29.22.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 22:57:35 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 30 May 2024 13:56:49 +0800
Subject: [PATCH v6 5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-msm-drm-dsc-dsi-video-upstream-4-v6-5-2ab1d334c657@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717048617; l=1994;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=wYa7Wt+9FNkutbQfF1qd8yI9pCbHRJOEVcRy20d6px0=;
 b=g1HxXUGamd1S1+baoVF3C1PVSVxSrhmzRlQx4qfHnCqOmNGTSB9axEdRP98TE05H6leIP/t1u
 ZL+HaI2+8WsBJ28CpN6rClatB8UXm5Ir9vyIlQ7EbVW8a/Wln2VnK3G
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

Video mode DSC won't work if this field is not set correctly. Set it to fix
video mode DSC (for slice_per_pkt==1 cases at least).

Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 47f5858334f6..7252d36687e6 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -857,6 +857,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
 	u32 eol_byte_num;
+	u32 bytes_per_pkt;
 
 	/* first calculate dsc parameters and then program
 	 * compress mode registers
@@ -864,6 +865,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
+	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
 
 	eol_byte_num = total_bytes_per_intf % 3;
 
@@ -901,6 +903,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
 		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
 	} else {
+		reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_WC(bytes_per_pkt);
 		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
 	}
 }

-- 
2.34.1

