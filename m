Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850FA4900D
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 05:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC17D10EBEE;
	Fri, 28 Feb 2025 04:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lle/WMy2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06010EBF2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 04:14:19 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5495078cd59so191116e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 20:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740716058; x=1741320858; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
 b=lle/WMy20Q/0b7Ygx3HC7ndaeNBKFPO0UE/mrnlvyS8bGVH4lgbHV9lsdl5JMXFfvh
 DdlwRjnbKlzrt1ffqRIw1Ev6U4aMOteEoIcYZ5167zTlcgP67YwpLIM4fQeXMAj/d27a
 iErN8BGhjaoKb5jaxGye45P3zFZ6kv234qPsS+tY8TqLdoD3eQ8fWxWE8rxD/Kbxgq4J
 auzGhmhsvLtvzr5avtxbNxFgt/DQi/7RJCpR557lXCv2eF3MjDweZZSqWPYKEqKSdQ8p
 EzbM4uCZvxRaMXt+yX+Fn2eDOUBM7eksRSPY09Y/hknKb/ofcifGMUYKCepyOLdg1pgu
 A/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740716058; x=1741320858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLWgX9Jq7cWL0p5yKqN9Wo4wrXfetoQdLwdK7I3i/GY=;
 b=XkbspZzvM66EXKGEvAQt2klbS0VKmDiUVLVzYYRAhWAT6OeDB744ZiN2EvgCTfAUXb
 OUrABMqktGJ6Fc0SXPzPC4okvEuOzVpu9Edozq2wijdrZAIspwbGNzCIai7Bu6uAtvr8
 vFTGUaOFskGzM4/12XdWy46bUQB8PGo9X9KbismACrdjFBTDfz3cSpjjviSbTkkFMlPk
 KUpyQW+kuh0ZSWCxbyR1AuqZsNVAmP7P/1/N9yQ+ORC4S8siVqxLjHRcXOxZ4wNLW+Gz
 94U4XvjRyhoPxogxVpldNf7d4kOD5PHZRxYe5ezwnSyob7LMIbY1Wo/TrnygW1JTMKxk
 z5dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb5bGG7bagEMzuYcv70OYR0guuasE5gBoEF1xcpCPmz7EOVBpbDKsDDlx9ipOjaqgKsblswsSUIls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybdl/zbE+sJU4KJnhjOyLKoCBCovrnm0MkwSgh5p1Njsy+8My4
 aFmUh9nkrLaePu8Oyvi0w3KitEb+H61YRCupPuUV+5AitQoJhhuTiQCD92sX380=
X-Gm-Gg: ASbGncswxay4Rk3DZvTWUuryuVV3Ib7J+fafVPChJkU2YVFbmB7TaEg7bvDX9O3p7+P
 Vmq0AObmqYFm78IPz/puPd3WRJ9XRnSuJwrArXl6/429JPE1QIVWOS/pxOL9TRLUAEbjd0yj+/T
 OGftiIEubpftYwuxZ+hid+dJnIuh9kJ0vGd0LED9RCL5kZYJ7jIPRcHIe1pDdAPpAoLPl2DCo2S
 S3tCaPsnDqeQAabxO/K4Y77/DJNB+bJUaQfhLlDK9B+3pckEq2jlPkVvsOzNiIQsLlTcjEFwJJQ
 rMjSG49EfuiVhQTheKn+VVU9vKkg6dPC5w==
X-Google-Smtp-Source: AGHT+IFcT7s4yVONTyYgY6zAKsU9+9abRufWWlIMfQD+nj7E9gZmr9mDgSCmtquQiPUvpSCt6Cmr3g==
X-Received: by 2002:a05:6512:2827:b0:545:ece:82da with SMTP id
 2adb3069b0e04-5494c12a0a2mr667916e87.4.1740716057671; 
 Thu, 27 Feb 2025 20:14:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 20:14:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 06:14:07 +0200
Subject: [PATCH v2 3/8] drm/msm/dpu: pass master interface to CTL configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-active-ctl-v2-3-9a9df2ee5193@linaro.org>
References: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
In-Reply-To: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hfgy9wzGA5Q6AEJ70BD9uWOFMy1Prwe8QkTd0ByFtoY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgO7AzfWXjKQ6q1tuTp6RHJgAal/Up8SzZqq
 QYw2I3uvDyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1amBB/9ISmNQ/7w5UzOXxtpKcafpK0NDzRl2xZa+xPfU3WIIyQBQl7XQ1mExWV4yT53OzNbW3fl
 UjmLXTMkn815GuemnTmkSAoWOK+9irdUboUHmSwwN1TxDscP+OemA/gvyh5QDjOVL1sYu67hisQ
 BKiTgTwO3g4PvPdjW6KTjxzind9WLQzplTYYXLi7gHkfCDqtHFf0PHcWo7dyaFXjCa6yoOtBK0z
 jIsfNBrMS1d+SYmcjKvdZOAdNx80K1m/CNymtdTl16BY/6jzvCB8cpTn3QuS4ZKGNXQUfUsI0cV
 LcGdSKR7/kwjufT9P3MgiRqzFGDZ/a/jqOTmWnTbEJm7HYYw
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

Active controls require setup of the master interface. Pass the selected
interface to CTL configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index da9994a79ca293ec0265680c438835742102db2a..a0ba55ab3c894c200225fe48ec6214ae4135d059 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -60,6 +60,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
 	intf_cfg.stream_sel = cmd_enc->stream_sel;
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index abd6600046cb3a91bf88ca240fd9b9c306b0ea2e..232055473ba55998b79dd2e8c752c129bbffbff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -298,6 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_cdm)
 		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
+	if (phys_enc->split_role == ENC_ROLE_MASTER)
+		intf_cfg.intf_master = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);

-- 
2.39.5

