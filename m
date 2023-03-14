Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0966B9996
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352F010E844;
	Tue, 14 Mar 2023 15:36:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FBD10EA81
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:53 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id i20so16423646lja.11
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
 b=NAwJRccVG8PhOICMTTBlwaMgBHAML3Sr6mgGnOX7C0iWCU6Nn3eHZ2EZZSWtBrq4Cr
 K9HY0eUZevEgvyLAx/rKaZP6kbHL7o0zGfT8l3qirIgEYPAFfNC1yswZjS2LEaCqUPtz
 7zCtEnB52iBBgSB7aDCahvPyM3KRQtFr68fKre8Cnbv0+DtfO+hvdQAPqJ+3/SPdzE8S
 XJdTg/OFy7AYDOn1edJJ4Gfkiuc6NmbyvV950470oIztA3VSkJQXkKcLOdWIcNUuyWit
 sDvAaT0jKq02eA/KmzVR0/TSlZd33F2p7xvQVY2WNphLkBVycLyPYc1ooJu9nZlp9MI6
 vINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
 b=w9E4FUb31+5anJKK+TeQESMPPQdJMFt5PxriZaHHZM+xPuNgeH0u//m/ax7t7CiLNq
 Js06cdrwk4brBZOGC+3/z158qCXJ17lxIZkjy+qvHAoUT1Eq7eNKhbaMwwlTpT/67sKU
 +FPOXEeLQPBxNQ1PDmdrDiLrVK9Bfk87QWyYRuO7UM10H7WQ2mDQkLAUSMr4gH4MfvC0
 xHO1wZpsr87oX+AAFPzSaLdzAsfpelwkbmGYwJWBLFIGsKuFzvXFvjQyxe13jR6Ovh3U
 z1qQx86PqtgrI3lBcOpe2KlA0WWUqzjMu1MqsnXqqb/3JkZaM9EoU76h6afNsnB7Lypf
 qP/Q==
X-Gm-Message-State: AO0yUKV0xbYfOkBVI4hZ50SsGPnLTT/qZ8DX/vPcEp4NvRnZG2j3q/Sb
 kcKNaADuB43vf3iz0BAkqWJmZJdWwQrF62vT+6U=
X-Google-Smtp-Source: AK7set8drnYJdNNAOTEFe8xSf353UXYmHIurctxJXtUdLMlnNv6nbwCZggbnrfx0Lz7da4bgRMPVyQ==
X-Received: by 2002:a2e:9217:0:b0:298:9d0c:ad65 with SMTP id
 k23-20020a2e9217000000b002989d0cad65mr1024286ljg.4.1678808153515; 
 Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:23 +0300
Message-Id: <20230314153545.3442879-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 10/32] drm/msm/dpu: clean up SRC addresses
 when setting up SSPP for solid fill
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.30.2

