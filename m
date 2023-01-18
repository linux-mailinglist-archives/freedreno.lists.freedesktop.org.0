Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E200670F5A
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D5E10E623;
	Wed, 18 Jan 2023 01:04:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639E410E61C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:33 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u19so79543690ejm.8
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s4Hwtg2zYGRteABpg2Gt7N6Et+C29koIoHOiolG/j8=;
 b=SITs6oBbmLzfxfyTHpwwYvqgEH1kGNSx0Bt5aSGM1cdMyui3dGi9EIGJgWkYYsiiCh
 Q0j2jHoFS4UPpFDkEgSqQu5lxPICMX114cDAH5R/uAkz0B/g5R/iz1XwZMfmFCSkrHWZ
 o2PuJw/4VgL3bRnb4BQTvsFTUwkkVoLD1H85FDTiKHWzu8ajoDWNC9H48CtE+Pq0Y/nQ
 hXJT5tlSX2Yc5aesjwiP/Q6slW8kDNlwFOwvqVI3k/FaJm/4IgLHV2T1gqyFtI6Ym5Gr
 oIdYJUToNeYnFnCvCvxl7/drWJa+7Jqu9mLDm1rFkjsOAueE/as7RLEPk8gMope8zPxH
 X/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4s4Hwtg2zYGRteABpg2Gt7N6Et+C29koIoHOiolG/j8=;
 b=fBxqawGUGQrvcoQDa4MOlwzkhLa6OIRl3YRbGuHwkUmxwNK9XKK/5Tq0gURLOlzYop
 8XJ72OYSPJskT3/ocoIDTNnBAJVRzzWksMJXHj3FhJBGGzi5nXYVLFVV2lvRUN5DG10w
 yYa37xFPp6Vmto9H0lT/ZDD9IUMZWbNP+nG9eVCFp8uSMWz9sX3TRxLVYxEYUYzpD5YO
 3SkD/msUXsI5x9ZPFeXxOCarhhbJBCOWBMPaaEH75zCg39yHmhJJ6G9XjDrp/ioxRyz4
 H+PYgDjzD9pMboUKn73urEXlZFIlxhiCPxSh/oNrR3OTS8X+TkM/clyO+lb6mOvdbjSP
 /moA==
X-Gm-Message-State: AFqh2krKDBiyH8ZcvbAjaLYSg/3UGWAV9D6ywzVPvoq5z8t4KvJ7G/wb
 ewxRS1SMkUuYkTgIIYpjDXmQdQ==
X-Google-Smtp-Source: AMrXdXsv0EgCBY0a12ywp5+iQzl/7G+zgNe1C7etzL0Agtyn5lAz/myJB5ungktF2MxZmCKeqhm7nQ==
X-Received: by 2002:a17:907:a092:b0:876:9069:3fce with SMTP id
 hu18-20020a170907a09200b0087690693fcemr1099984ejc.72.1674003871821; 
 Tue, 17 Jan 2023 17:04:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:04:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 03:04:27 +0200
Message-Id: <20230118010428.1671443-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/mdss: add data for sc8180xp
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

Add platform data for sc8180xp based on sdmshrike-sde.dtsi.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 799672b88716..158d7850c4ba 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -516,6 +516,13 @@ static const struct msm_mdss_data sc7280_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sc8180x_data = {
+	.ubwc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_0,
@@ -555,7 +562,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
-- 
2.39.0

