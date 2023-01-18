Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27607670F5B
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 02:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733EE10E61F;
	Wed, 18 Jan 2023 01:04:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D9210E61C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 01:04:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qx13so21217826ejb.13
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 17:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
 b=AT1Pog3PcNorxTSf251HHthQzeLgINleh4Jm7oHRlPpYH46sS0Q9oNfI68pErWMRG6
 /q7+OS1uKFtcOdefn/Kjyolkv62aWR1x/RBGZCTuDeJzu4VJvnjwlnRhgs0q5SI8TJeO
 gmUCY1vVe+E0kJ8zmn4ZfS/xmDUew6CofUd9M9IrgmAsLSXznbzj0DyVDQFCYzY4koHH
 teGSYAXgu++y0E42dA6+39ASkg1ycXfRXfcLDKRNYPnYLm4u8fQDTyEp/qtOVI+Z0bDw
 qj7XJgi2NennnXnJhsLJCJUao89TzxZqSG1dXjX6mAopTlsURaVetzCrZ0eNuH/RDWJv
 zq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2AT9KHC4pUGTo4hjZu7eOwD5Wo5qB72fPWxQDAYAOU=;
 b=Hxq5w3WSqgu1PXXIy+S28K3TfBkmVccEryOedxe7P/D6nHi3CoEI2dq8cwhCsWWxIg
 gr3oPF3Ax1ZsBUGVWNo3zh60z/KyAZs3G4Z0ZffWzrsay2WnYlePeRWv1XVxeVfElqsm
 qvg/eXUovbeHy4sTFKi56bDcElSiUm4Su3zj6zauZTwuJD50SaJ3yD49foQCRB7ccG2h
 FEt4AvvXlpjWxOm5q2qE+f6B9oDdPPaYFDNenTyV0k4Q5tib8uLrE6eSWqd9bUhhqUJc
 iU4LTSjulvDDtk1Q5nHz5xFqpTyQ3lSYIi9/AKUacLYsbNT5p22FTzsaKBHJ5EOj3M3L
 USuQ==
X-Gm-Message-State: AFqh2kqvfnuIReVmTaAYT/EQ0/dYhTGFFWsR8/mdwigvJEbzTLcV4p/d
 jZE/Yi2farsAgzH8QMEr2K1fNw==
X-Google-Smtp-Source: AMrXdXv/DJl6VMwscZYu1N4Y0oWY34Lil+ABtbQJSPHsIb6SSMQ41aYxuz+VnhkOiNw6WUGvnwkCNA==
X-Received: by 2002:a17:906:1911:b0:870:29fd:be41 with SMTP id
 a17-20020a170906191100b0087029fdbe41mr1043765eje.48.1674003872748; 
 Tue, 17 Jan 2023 17:04:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:04:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed, 18 Jan 2023 03:04:28 +0200
Message-Id: <20230118010428.1671443-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/3] drm/msm/mdss: add the sdm845 data for
 completeness
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

Add the platform data for sdm845 platform.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 158d7850c4ba..c15d1e2dc718 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -532,6 +532,12 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sdm845_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.highest_bank_bit = 2,
+};
+
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
@@ -559,7 +565,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
-	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-- 
2.39.0

