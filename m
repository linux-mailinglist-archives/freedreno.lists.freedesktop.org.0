Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174D958E5C0
	for <lists+freedreno@lfdr.de>; Wed, 10 Aug 2022 05:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4379FA1C42;
	Wed, 10 Aug 2022 03:48:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B21E663D
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:43 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso9821899otv.3
 for <freedreno@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5D9+PsfZh11O34sosMXObQ3c3IZI2i4ZPZyxVLOQBa4=;
 b=T/g1XNcB5lKxH1br0VWmcAt4q0w4G5U2/SXerRfzVUQdnbwacvd35mjAfU/Bmi068Y
 +S/+czJWZ81cj1oHWKyNGzr2qBn4vPFMf7BQ2vzEV2vJVl+ZnSU8IZpGTfdY834jpdUL
 dEOxluqciPcFSTJyWSb+TcTP46ch6it0DnuhmmJigfikNF2mlqq9Zyi2YJlLH/PnqH8k
 Kb3F8lCkskepTG4Y+BNIgN9IUxch1FYnjSanyRnpKC6xcw7hpflnBIz/RQjphWMvocQ+
 arI6zXPRzG/EQLKx4zwmJbN8NCDcjXZzRBtC0l/hZuUJv86DOWQMDP8mtq3Td1wWfqPO
 DqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5D9+PsfZh11O34sosMXObQ3c3IZI2i4ZPZyxVLOQBa4=;
 b=VM+ckc2l54dAvpkbme0GRducGNCRwtQZunnRyAFf4tYCKf5TGC82bCQq6NZOQE+DS9
 LnaklmZhzCQVEKAjgzao9qV2d1FqkgbACeTOL29Bt7OWJvfobjzFLDgbqstBjcu+mrmn
 KbILY726tz3XeUtsfxy3oJPMdgfPKW/wsUFl7ZafjesbSqEOhr5DkctapzxTmFSnEjKP
 sQ8omlLViNncTX5uz0V9gvHDAKSguu1E7SiRj+IpSjV8djFAFRxW9Gzs4LpBh3gk3Ahp
 +g7wkmfev6MFJhQtRdIU593msXo5UIWkpuUerxjGpdBTAW6Wyc7OikaIKX9t5iofRmvW
 oW1g==
X-Gm-Message-State: ACgBeo3YrV8xcbGRB+zM2hPp/PRvI7kLxeMMZebuxIy9RAn8qADV3dY5
 Wfk8sY7bEyKO6UQ9l+OOJ7E24w==
X-Google-Smtp-Source: AA6agR69SJRWOU/4f5w8UNLQmEzoPDWv9YGDIFuD4FVXTNymk7j9PuepL3ouMkNnYCNx6VtsgGiBtA==
X-Received: by 2002:a9d:7a55:0:b0:637:1874:a2cb with SMTP id
 z21-20020a9d7a55000000b006371874a2cbmr812155otm.318.1660103260506; 
 Tue, 09 Aug 2022 20:47:40 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:40 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Tue,  9 Aug 2022 20:50:10 -0700
Message-Id: <20220810035013.3582848-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/7] drm/msm/dp: Add SDM845 DisplayPort instance
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Qualcomm SDM845 platform has a single DisplayPort controller, with
the same design as SC7180, so add support for this by reusing the SC7180
definition.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e4a83c2cd972..699f28f2251e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -178,6 +178,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
+	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{}
 };
-- 
2.35.1

