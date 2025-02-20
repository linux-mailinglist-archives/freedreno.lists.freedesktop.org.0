Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F390EA3D034
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 04:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB4510E8C0;
	Thu, 20 Feb 2025 03:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NwFeN16n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC6810E8C0
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:59:38 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3061513d353so4752851fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 19:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740023977; x=1740628777; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EqbHNmz099kigX0TqynbTHurbS64qX/w1xCegrKBwT4=;
 b=NwFeN16nEXERwAMmg8IJJRd1nnHY1GUGo6dhHc6iGw4gPTqNo8BQpCPFbcYzGz8ER8
 Edjp2bOY69+uE2EtIXIGYPjGzRXoD4tUlqjzQvR/rJZNZfKoD/WxqWtaPFQyRwyXaqq9
 gPfXBeEL0Wd/EF5hbAjPAaHM+fGSJxuFWbCEIbkpuHwOTAn0AdZDsAVMwDZP8h7ah1rL
 WrS4Y1HNvQYG6OjX3aZD/di2ZP9miScv6rDdUKil+ZzEeFggnfjEzDY9izycsW1Hco5r
 PiWIFGNh3L0wuy41bSy69gIiymTyUtw9Y2zdApco4ujcoNhqYtnTJr0TvOAto8x1kdLN
 N+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740023977; x=1740628777;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqbHNmz099kigX0TqynbTHurbS64qX/w1xCegrKBwT4=;
 b=ntbp1DabK/FOSkqDw1ISZjXfjijseNiY0sE/q1innJnBuVrV4os24TqK6VbfvWMFz9
 eYqP+KO+5vdPbxyYEwHXs04Nn6pnL5L335Xvey89mgxKXLEdVJBUjsffhXFMrOQ3u3rH
 M1RTXl45OhYVZWj53TpjAWUrvHDegUnRQ8pDrKjvTEtEfLfNiZ3EB1d5hCgn4ucRJTNl
 g5IaVDmk+N9yZNZRD7dQyugSbM7NihftQyPbN8LLUPJitMeDWA6IAwpOnDqaTZejuBmn
 pJKR8mGY3HEMir4YiO4Ap4T8JiZqpQMnlFGAyDwtCe2VLta/j3122ribewf6cwWR73h7
 S4Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU30x02lVYPjfT42Eg+dtuP7YjHCroo5XCTeaXR6+4idbMp5H5Hn8xa982nlhYfW01hFu/ZP9L0su4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwitgQLhA2DykjGYb+84XjgzDrENwv14eySuezrdlAjGTZCQKMO
 lCgUAJHFQ/lBAptyEGJKwT0hpCiLxt0N1PwGt5t/HxHjX3yU5LN1vVsCX58iY6gwBnbzLe0mM34
 t
X-Gm-Gg: ASbGncvBeH7OB+wvLRdqJXjJtTruJSAsRskTJnxfOOQV/bgQByXGZXRNlRN6kiH5Ir7
 PlLZMRwSi3lHbb5BdBj3QqAWDJAAPf01vVjVhXty6VDjZFFfN+9GzGf177xXVOfrTRyChxIS41C
 5gW0S+ncZfx18ddrhsKoV27/GDXvIEFlCSCNsgvP2wOgiky/nrN7AYAivl0wBhnkV1oJggPz0ID
 cfqAAeNtg+oqNGvy3topTxPri1VwpCH5Vb7VfRdMMqWG2KFlCZQ8FCO9ee0kYJnUC94EfX18Bee
 COeWtbl/IGwW6u2aO0CcdGo=
X-Google-Smtp-Source: AGHT+IHNLX1q/p1F1rq4DyZnm4yuozfzfNUpta652kVpbxvogd3CMY4f1V3qt5Csx5Qszd0Ja2VUvw==
X-Received: by 2002:a05:6512:110b:b0:545:aaf:13fd with SMTP id
 2adb3069b0e04-5452fe76fccmr6884137e87.51.1740023976695; 
 Wed, 19 Feb 2025 19:59:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545225f22ebsm2143909e87.16.2025.02.19.19.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 19:59:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 05:59:25 +0200
Subject: [PATCH v2 4/5] drm/msm/dpu: enable CDM_0 for SC8280XP platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-add-cdm-v2-4-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ksuGoNCpiLiyemIz0C1goT90Bi/HXDBK3gu4zkBcFe4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntqidVLBOqKTIOpBvG4db7VXVScNmMMC80vm5o
 Ax1Q2LayhuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7aonQAKCRCLPIo+Aiko
 1Wt6B/4l0tedtz00rD6xE5Nk2oCfAEA9rif90maR94yeStThnNmOlaypC8JzqTsQwzyfYIDLppP
 8Ad965InPWg8vKtWToJBb50m5vxxaubDgD/FQgmQqnFfuFsIzC06Uo2Qy9oTcoyXXPuZbw8YKvi
 K3VE8dPcvKt/74eD8HOTPHK/u4N5szfXBzG6SvzmYwok1e8rvwd+YVfgta0o9RZGN/sjj8SiXku
 X8/0zk0CE4KwOPA2Y+s0dzLlE5RBhDGuxMZU3ulsUMoOc/eGdn205hFslC6jxR/QIbBfiY34qJo
 9K55rA2S3tsK3K2xjDvxlegOvFKTXSdkAnGCv/toxdPo0Ipm
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

Enable CDM on the SC8280XP platform, allowing RGB to YUV conversion for
the output.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 0d143e390eca964b1c81f835d0904a2079b0b941..fcee1c3665f88a9defca4fec38dd76d56c97297e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -435,6 +435,7 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
 	.mdss_ver = &sc8280xp_mdss_ver,
 	.caps = &sc8280xp_dpu_caps,
 	.mdp = &sc8280xp_mdp,
+	.cdm = &dpu_cdm_5_x,
 	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
 	.ctl = sc8280xp_ctl,
 	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),

-- 
2.39.5

