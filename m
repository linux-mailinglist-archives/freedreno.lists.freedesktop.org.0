Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC346934DC
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBD210E3CD;
	Sat, 11 Feb 2023 23:13:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B9510E3C5
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:15 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id qw12so23994397ejc.2
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
 b=C41KQCwzE9jkUvf/2FyTtIegB9vbMEEW7WPPlEUuhcsqfWpkvf6FsHfJYcnWJU7pDY
 QOA8222EHNSWSPFvrGcQBGNze3AVSDc3IQVglx6eXQ1G7urnq2EbgGGdOvk7pt38t4PG
 zCBZeQbV0PNdjj2whY5NlhJ4Z7coDyDXU4F9rW5VxUsBP9KckR2OEEQDEuaHzOrpmh2d
 7pgYoZbCsg7gsg+HWZREAlwaTO5Vid9PDDs31H/a/N68Ba5qU04NFX/pLUDJQSIV1xeH
 QB3i3JNwKwNI/F+Q+2qiEnmt2ez2Kb+b3qFPdV03qZmsAS+BMXjhNVcrUnTSl+42EWNy
 CxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjQ2luO3DB+9WwMHeQDFbGx17AOSdwZYD4Wa7F57gZg=;
 b=iplcLKwoS0RKW9swnoDPiftYb3mE5KMIJj0lTcn+P57fOxaaY8nvl7Bt8t8A2p57iH
 VulD0i6keTgMzqDbCNu/GnBqnFLuL7UgEkkdiDKF8lWELzuXmvHCGb+n+8hdekicjLq3
 0FI++Pn1Zg+TLNsj/MqvCvlDIWuUc70RpUcZVEMYVUmy9N0NPsY5y8Dpi4qEqzVNi2OZ
 D7sCSsYdTPspjWZvTlAuCtTC77Tf9WV097d2Qp3hOZdQ9nNz9jjyMb5ll51FEmkqMGEH
 N0rK4055XxoTM2TMI/2/BTBVVMASGvrhUEMNcdM8UxJLhMSu9m/JxSjmXzlmxqmqH1Uu
 7j4g==
X-Gm-Message-State: AO0yUKU4MPTfd80KmV4W/RCAlrn2bn0uvG5siP837QLUuwcVc8xKr5zN
 FTPSz8Qm4umIYB7d7TcI0k1qBg==
X-Google-Smtp-Source: AK7set8V9CAzt5pfWmHVkPguemQENHK7B7i1ZlxK3RjiOM6ZttJ1M7g+8eERNLxlxzuGYIGYpclz2A==
X-Received: by 2002:a17:906:dd9:b0:884:3707:bd83 with SMTP id
 p25-20020a1709060dd900b008843707bd83mr17475021eji.69.1676157194934; 
 Sat, 11 Feb 2023 15:13:14 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:20 +0200
Message-Id: <20230211231259.1308718-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 11/50] drm/msm/dpu: drop DPU_DIM_LAYER from
 MIXER_MSM8998_MASK
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The msm8998 doesn't seem to support DIM_LAYER, so drop it from
the supported features mask.

Fixes: 2d8a4edb672d ("drm/msm/dpu: use feature bit for LM combined alpha check")
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a26ef7bb024..02bd8334d67c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -52,7 +52,7 @@
 	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
-- 
2.39.1

