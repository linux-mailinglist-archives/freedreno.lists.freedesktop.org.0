Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB7634AC2
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B710E48D;
	Tue, 22 Nov 2022 23:12:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE2610E48D
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:45 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id t10so19652725ljj.0
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=jvD4z8ILaPy0aiGdKMyoEDLjDAxXWw4uFkzNuXgPyQi9Anix9LXrc9uedgTq0+4dU2
 wRxX2TZbfJ/P7DZSLvZc9+1nrvlz9HzwAyvUm935n7RAZY8Jh7OTPlsqteBpf/o1v2B6
 ZQUA5JNJe8xMBgnuBrWsSqQ/19qorcjdmFCFHWGFsCOwvk1L3yZT1/wywPJ9xvNQErl8
 k96KfaYlVT2xd1A+D6J2zAyOm1D/CQpU/z9s1P56uVapIG+iBt06008j5n+Il8KMY42x
 GAW3P/TM5EVRQCptVXn2Iht04yjDyQIB/SZTALWwOcFXy2UBDqyeW8JrSj03CMMGhf/F
 gU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=1oPKltrFFkKZNd05JNj6fNb06R3jmETeUwxuWqCoOATL5kTk2gOR9V2byIz9L8WS1c
 ymfFiF0Dqfo1+UH+mlWWZPsf9xeMepstP5oMGVYqYMiD1uPbWxju3karnQFc7OasLyWE
 yly5z+oNiDtoftyhbSCsTwmSEgzRVk0oZB+aDjOeOTJWtQ6tuS2pbo220jqHUfWFa298
 Vy8fbbL4i80o/ee+dza278vBaQHvMpDjhqick8KtogcRg4uDkhLVCEbRAgli2hMh0uh6
 73EMEUfKWjHevSzswv65eLjcr9eI3gY9OUUt7fV1lMF3tuhZDWZ6OylflECUqgx29Cif
 tVnQ==
X-Gm-Message-State: ANoB5pkqPxfCHMK8wrIcOZF6Jolt+JOJKN16wYk+pzlrL1f3Sf5trGA9
 DIQxdLktpyZ5SuGj/NOmVb/g3g==
X-Google-Smtp-Source: AA0mqf51/Z2whokzsqkJu03zvx9yJ6wglnBbfp5WyOcGJhJg/KGKg2Xn7HtLsXqeXJ4rSSrOGsJeYw==
X-Received: by 2002:a2e:a988:0:b0:276:de0b:ce2d with SMTP id
 x8-20020a2ea988000000b00276de0bce2dmr1964445ljq.212.1669158762730; 
 Tue, 22 Nov 2022 15:12:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:12:31 +0200
Message-Id: <20221122231235.3299737-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 08/11] drm/msm/dsi: add support for DSI 2.6.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7e97c239ed48..59a4cc95a251 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -300,6 +300,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8f04e685a74e..95957fab499d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.35.1

