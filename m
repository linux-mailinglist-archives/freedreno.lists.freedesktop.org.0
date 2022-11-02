Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5015E61719A
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBC910E55A;
	Wed,  2 Nov 2022 23:13:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A974310E53A
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id be13so189235lfb.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
 b=n5miaVRsjiaJARxVz3j1dIUKNTjHIm7TVRr5uwxQathzjf+B4n9f2XbtqawIy7oAAS
 2rgg0WdDOARa+rbAkeT6c2g+14UQPG9Csw7aMQ4CpyZYSFisH6fpNvfiBp0f8ozICzOr
 GcFQD3AZMSydYH3reOUd3ss6wXGgvbdgZpjJqemyjCXlPsXTduRsYSLsoFnN8uoPMCmg
 jnWd2f6GUd4jXGd+aQ4JBrI1reX18NdRB5PTtboaUmZr2t5W+hbuOzif1NvbuuvkyOFm
 kPiWoe5qTL/SvOd8I+G5WbbHW4wROjBW/4tS6ODg9GJa0p2zGrKyEwWfpGeP+T75Fb14
 KB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
 b=ltSEg8cbJU/zvg/K9vGp2x6szr2bYFlFyAylzxCd/wOHt2kihPayH3EIE/qcF8MeAR
 N9nrs7/Tk4419MQxBQTRy5+oUcbr7lMNfhL3o/LbycUdQiZoWkbsYXZ7le98Ye/z5WJM
 jrRUU/06ScinA5MYT9WrkNXklOSnb2OXD0JTcKUiwdznawsxX96NHZorxmDqGes7tjp7
 5zXRVIpjybQR89J/j3MGr4DHaUTAaR+2JFwiBn1is1dIl8bU1e0YdvS7oWT9q/A7NZ6F
 5FVkEs7YEg/zTz+f5CcgRH9gM53nh/vtWgA910ooOcH6UEKY0lgcZN0Ua1EDrvRZy6kg
 s3SQ==
X-Gm-Message-State: ACrzQf0QwU6CEeWaQkZ9cZC2v6n/+mK8j02CbE2XObO8/7qW07Jolyf6
 EN/nksdbZgaETpKtzdHwWyV7aA==
X-Google-Smtp-Source: AMsMyM7M/mgRgW91t3eXTPJRtBHSK651g8/p++9q6pKQifOnkW/kSeP/+kiXivQ6gnqoRdQfs69QFg==
X-Received: by 2002:a05:6512:1154:b0:4a2:7d6f:7814 with SMTP id
 m20-20020a056512115400b004a27d6f7814mr9515624lfg.342.1667430795823; 
 Wed, 02 Nov 2022 16:13:15 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 02:13:06 +0300
Message-Id: <20221102231309.583587-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/8] drm/msm/dsi: add support for DSI 2.6.0
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
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
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

