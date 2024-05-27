Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36288D0368
	for <lists+freedreno@lfdr.de>; Mon, 27 May 2024 16:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D67010F571;
	Mon, 27 May 2024 14:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ycHXdbnr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8CA10F8BD
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 14:23:59 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6f4ed9dc7beso3987021b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 May 2024 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716819839; x=1717424639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
 b=ycHXdbnrDcJrUo4gE12ttqmTtA6hltLVAHu3molrX6ifjy97VEaQTfI5GdCbOUcBUR
 sHfL1VvGIqkJTNMcqFs+l8+59ZxmfSioHpsAoYbTbHYYugRiLj0qw+dnF+m8QkpGiSWw
 mXBh6x4xPtaLn4a5yvYZ9VwjDUAfMwsMJHLUxccwlu1yAWmy+LIj6R9FBFTsdF8AZlFH
 Q4H0sJUczzSxudJAhYmqhIWxezdnd3zpNeqvciDyVwu9Ba8/gnRrsxpQzfjtAUuMAqJN
 OQMTJbrZTEfOp3J3fLE5fB9R2tLS6H65QT5EFRhgeRTZLGphFM6ngxW9yni+UNg9BewX
 EowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716819839; x=1717424639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1q/zNwiMaDEmdeMjqIrsYp4iIRvhgkioJMBpY2/fUh4=;
 b=nf48qRmxlkvEckBMbkr4H3bvDtn5OXIDAAL5qiWxzYKlwfj05kluYZ7P4Z34PUD02c
 aZ7p0TBaLWZcC1mL5XRefhqASSSjPLhrwMbr6Dg5B7LonMYJBCEuqUyVPSgfZFcJoIob
 01JA6Sa10v5WPAZkkXoG84V9HNePpIJJot62lOJpShVPG2EdKzAALW2hxpxZiZ+gH178
 +ULGmO8vvgbtlmliUDNdYO876ZTODi5LUuTQwZpjE58UT5wh/tyAt15cx+MuoXvstczr
 lnwNrYkU/6nnAe9fiJfREWcgVNmpCWTu7VeVNUtMFlUWxg87kk2Pac6S4+wTWnZus7Ia
 Naow==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ZBSEu5Gi5e3ANGDnfa76HgBwaIWS4dUBLgIypfJGex1HUn1BDng+jzMVoKWd62+De+lubQAmvLI/bdkueu9f9AkiWtXOy8Af871MagCg
X-Gm-Message-State: AOJu0YwInYRA9pxRvJOjBnEymVM/X+is9dBZ5hJwWi6lSEe0Kiyz3Lhq
 LNxkaHaqNXcnrVtXtt0BC6/uo4N/+EeP07G9jgSp1mjS/oYDLYi8T2GG42olnrg=
X-Google-Smtp-Source: AGHT+IGZUeImmFZRD7CnLeMPw/skw95bTK15ZusEaOjy940fGLqfHaFZVT0WKxGpOOOhS9SBld6T5w==
X-Received: by 2002:a05:6a00:2c94:b0:6f8:c94f:578a with SMTP id
 d2e1a72fcca58-6f8e9fc10d2mr14002563b3a.12.1716819839415; 
 Mon, 27 May 2024 07:23:59 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.67]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3eb67sm5109895b3a.19.2024.05.27.07.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:23:58 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 May 2024 22:21:51 +0800
Subject: [PATCH v5 5/6] drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-5-f797ffba4682@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716819804; l=1725;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kdfjO+qJ+tyWY/8kntVCewHf4UP39s93vNEdOjHmAf8=;
 b=WZK+fi9R1wzG9SG7mvTJ8kFWQ2CEBx+pPrg/R5DlNh/d01o6/7FKCZ/kIxSBneAYyg24Svub0
 MwG+ROnBoCtCqjgeMdjLNXvNtdxbpy3X3umPH1oZ8zS7n1OuVD9mief
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

