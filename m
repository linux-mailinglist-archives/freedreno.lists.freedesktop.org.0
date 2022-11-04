Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD06196E8
	for <lists+freedreno@lfdr.de>; Fri,  4 Nov 2022 14:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A6B10E758;
	Fri,  4 Nov 2022 13:03:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB97910E753
 for <freedreno@lists.freedesktop.org>; Fri,  4 Nov 2022 13:03:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id be13so7334093lfb.4
 for <freedreno@lists.freedesktop.org>; Fri, 04 Nov 2022 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
 b=LyF6T0FcxBLy5ij5H/10TivOAG6Bjid20IZywbGQqroqhamayx0/OgYbGnSf28WIYt
 Et9CfQ/uAuIdSXUgrNJjRVs7MmRw6LJ94RDf7WkFKvFhFMrZ9DHKqkYaOkR/PEfjnKO8
 13MtZD9rV5Mr78b8GYgO6f0KTLveC4HsaTP1wPtkHuzufiXMjseAFR7g8cc9nz4y7av3
 N1sySDNS9mI8liTtlskvC0bjhL/bcrKTsmmhGuocKpDeSfjv5KLKQbzEQcmNZRoCA42r
 n1/8GHVwhvsRjT3H69GNCXEoroHwtokDzJHwG4eutksqoxkP+R14SP1/ZyOu0VlysshA
 8FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jlP9nOL0nEzXJLWABMNdlQffQrykHT4joP6jF1+Vzog=;
 b=bcimlqfmp/1fphuIWWRRDLFEUPUm3D+YK4sN9EfZoXXaRtEhOCyfC0nyB7Zckpjw++
 ukLGLMFgUKIgakedgESdCboVv8CWO724RhnV6MShiJeNRl5pBrw4hkgSP1w5yvWNQsaQ
 GdwS0CwYhbEYjOtVqqZkd5z1OSCBvzRW4kKZDRsuKkT8CI9FQDmmfu0SI/1guYeY/+zK
 v+RDYFNlMTO0lbiGJW6XbICPN1WXs0IZjz5xZeVR1aIA9Jv9Hjf/8B1KYt59Oj9IoKe3
 S5iYl57laRQSLK8ps22hQ4jkW23CwaSUv5ciRdOkLJcuGCeo52SPvBh7C3CE6irCShX5
 CHTA==
X-Gm-Message-State: ACrzQf2t7FTeqHRiJrMvAQWCc9AQnMSMsmQANx7vOoMtQ5g0bHNQgiTn
 zj9S05RRbCHRqME6gvQiRjogIA==
X-Google-Smtp-Source: AMsMyM4kUsK6PeEQ0Vtt+fvOdwJgJUjDwnNa9yfhbNL0Hvmsa+8gNmsRGp3PawrGxQ25qyuEwFByZQ==
X-Received: by 2002:ac2:4884:0:b0:4b1:4eb1:f3b9 with SMTP id
 x4-20020ac24884000000b004b14eb1f3b9mr5355525lfc.83.1667567013501; 
 Fri, 04 Nov 2022 06:03:33 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 06:03:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  4 Nov 2022 16:03:21 +0300
Message-Id: <20221104130324.1024242-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/8] drm/msm/dsi: add support for DSI 2.6.0
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

