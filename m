Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEF692D18
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB5E10EE70;
	Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9214110EE43
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gr7so20207666ejb.5
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
 b=v4FWAlrhZ8qY1vmvSs15iWsn3X79USyE6x69pYDEipOlJUWglhd1TJOO/rLzoKXomx
 UTXQpNmlSvYDreaCBaMBijtg2V95d6TDJRW2gdpuL/aavhD4loD2K5LEpx9gu2b1k7yh
 xxfDOkGZm3H8qaK0q+F9JDZkOO7rzxX7Sj+QA7cYvZJxrL6iv7Fw869hMzCAv2HFNROz
 7YPwwfCUaI2pDIHN1rpV0MgtAxTAz6SJQ1DlrBNrN+IAjCBsbmeU4OgcIjDDxyRNdFbv
 gSMrqJi7byd5EL16eG6llxDrmIZR4Ohg8teuZsQOBIenQDe4oeQfv4xNYKSujen1MRYG
 /qGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jVEAHbit9HVr0SMJIWM3WcLEnURTHDRR5IlFfdrX698=;
 b=t/rhUxPMvVXgg/exD5gkmsEDqdaZHgxrbeIppZ6KYvMA1M07FBisuwhd2Z41FQBxni
 TwOqmZAJ4C6Gg4wXhpDtXeIlDIAl6GQ3SKKlYIIZpnx9exjIrj1yuH1Gjl5f6CxbHI8k
 jzg2nw33OcyKkkqs+aVVCsmZVh8SVtztFDaDEzshzqSrmWoiuTPLALZCeSepzgpkx3Yk
 VPUQe9XMl4lHFMS/FVZokFauj1M2KeO96QIQCM5msKAh8vNaciNByiG67yL8Bz39Jxla
 U2fNxJfFb5YTMbNxheCLM604zU+Z1iCq8B1gDj4nEP92PPRGT4nLLsQndEEww+68Ogs+
 L66g==
X-Gm-Message-State: AO0yUKXVTQ9IflrUOtQI7DW0YLo+rq4fCrqooQ6OCftQLZ7Km3YoIFa/
 wKY8rYpCgehNn3tLoWjz1e/F0g==
X-Google-Smtp-Source: AK7set/WG7ZMKG+x4O5+wEtXgz5P8czBMuU7wVJR7oGnPy/CnrHtfVyDusTKpW3KBC6HJG9zrUXffg==
X-Received: by 2002:a17:906:fd8e:b0:8aa:f74:3252 with SMTP id
 xa14-20020a170906fd8e00b008aa0f743252mr22089269ejb.2.1676081478181; 
 Fri, 10 Feb 2023 18:11:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:32 +0200
Message-Id: <20230211021053.1078648-23-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 22/43] drm/msm/dpu: use defined symbol for
 sc8280xp's maxwidth
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

Use defined name DEFAULT_DPU_OUTPUT_LINE_WIDTH instead of open coding
the value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9e2724ff6b65..56c9a38790bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,7 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = 2560,
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
-- 
2.39.1

