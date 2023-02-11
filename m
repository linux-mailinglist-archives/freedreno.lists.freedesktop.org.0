Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48EA692D1F
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366D10EE72;
	Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BFA10EE56
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id dr8so20122128ejc.12
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zSayp2LjaFdAdnYzpEY9EAyvKmYr5groJvofi6dSVE4=;
 b=GBWjGFuoNo5hZbB+cSFD6MmxSUAX6lZUIpLnQCgifqCsoPrOJEKVv32r3sutlxuEkI
 qG9EgRMVqHOzln6L1k9N6P2XRqGO2QoNtGbyhJXDJ4jAVNoZSf34s0nosSq3zLH8ZK3G
 5Fp3ev7mH2GXGoaS2BMcoYsVJ1cMhdqQsXQ1lzG67vKei1sYUaf8HksnzcGnk7oONYxJ
 JJa0rTpF4npuAAt1uMRqN0lKhg+82HGDKkYk61tQPOuCSDMlJhY+MB881PwaX4A8aGmg
 83mHOkYtOXnYaTLl6CM4lib/e9wnESnOUrnoxDBGUn9uBpBnxT6jKT3ZE7dXGKwM9XiB
 7jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zSayp2LjaFdAdnYzpEY9EAyvKmYr5groJvofi6dSVE4=;
 b=DPC6V7nei5by9BECaDojKjNVZdSvC9GLJ5bGr04MWFT1xU4vPD0HTlI1g74EEvu99b
 QDiAKXGUfSXxL7Izg5yMEE7zIEVfJoPeWIBNkPqUMicrJq6De53OVw3JJg29tpsF7hFE
 YeVZBnjLV4JacLqGJiWysr8Da2YLFOnHdZSm57ovEagOtTC41Uvbcq0A1vIbr+isdHGW
 08BNxmjwF4KXmKJRERbA1Sor6/plYwRdx1MVu7d6cvFnhLXmWmBFUDByUBAgSaFH7i6D
 J7td12KeA/rzFdvjTQBPg3NyhvTtd819XuOcEZJOt69mSS6iekRhBANftjvm2jvEKmwC
 TAjA==
X-Gm-Message-State: AO0yUKURq/d3Q/0ilKX8ljCG/WyDnDYCUcljhwdIMfLDiZhLQ+PSjY0B
 xWmA2VagloI7fulI3eXNFrqw5A==
X-Google-Smtp-Source: AK7set+QAo8MN85RR6ICDSyTkBe4jK+9H4MQYdFmM9phdVHg5awfxHpjHxQKnj2voaZB+MpBw5PmTQ==
X-Received: by 2002:a17:907:6e90:b0:8af:91a6:de6b with SMTP id
 sh16-20020a1709076e9000b008af91a6de6bmr3108941ejc.50.1676081479438; 
 Fri, 10 Feb 2023 18:11:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:33 +0200
Message-Id: <20230211021053.1078648-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 23/43] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY
 for sc8280xp
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 56c9a38790bb..a9df4c1a714a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -47,13 +47,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.1

