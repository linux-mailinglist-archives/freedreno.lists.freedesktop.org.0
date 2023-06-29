Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97070742E8B
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 22:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7D310E3EC;
	Thu, 29 Jun 2023 20:36:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E96210E1B4
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 20:35:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b6a16254a4so17775551fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 13:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688070955; x=1690662955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=m3hhlMn60IL1waEjrx0D33Ti5jOy4qgbY1zwxUHKfKVTEGzhFuNiPbZ7tmI6qrrSH2
 4aOJaC0opR5xQsPOukW/lvTykomgPtkcEXH4CMAed1wt1M7+Pp62YjYMm6zXnL2Heexa
 8cD1jaM/oTvEiUApCdMpYAOlSO+7ylXRRG4xO1/b1ekgyomZP54dv7Ky/rwwocfSSN69
 m6ZrSmUkP5fFNS0t9sf+/fOZozaxQ6UNxQWxbjnRXoMpEgs+V6ev4HEM6Fvly6zpfwwv
 HsOuAh6YnbqYakHg9hITq+Bya04sWPNalfeDX9TndlCdEOU7519XytxyIlR6GlcO2FIK
 24rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688070955; x=1690662955;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=fzbKaNI4pfRiZW/TlyJcGUd9F8p6oxmZ25hSBUNQv8s+/xrkAAKAcze3LCxxGhvzry
 MY0Ch8T82QH9rtWzFfLwg15Pl1ZYo/HnoPk2LejWr0kpVOYUkpO5fOOYOtdmRohAtSTW
 JSjdRtORzyhMX1e27bDw3V2G08iiDiVTEgUT4VSb0Yd2iOr1M9PDvtbcyJlTkvE/ai7S
 LYVBKVPn5ThXEXyp9L0dIhpAQ0siIrsEw6owsJczHbc32j5nmLU7lDWaMcvqViwFosxi
 flA97nklFdwki1k4lc8o+WB3+OtiOGAV3TqwSEGAtr3xfAfsdwLmPrQ+k6tNMQWPNGiw
 DLqw==
X-Gm-Message-State: ABy/qLbMTOnqDZFLz2Ec1l3KSufcLNKnSHDrlZfTLrRwzQacVaLQLljB
 ctan6rdI+yprjyBQLERDHpGsPg==
X-Google-Smtp-Source: APBJJlFo0T9+tZTTTTFhfzWS0HOJF58QbYMK9rRBBBCNxiXUoTICAC0SLWQJVYDjsz9BS/wGW/cUSA==
X-Received: by 2002:a2e:494a:0:b0:2b6:c9f9:9f8f with SMTP id
 b10-20020a2e494a000000b002b6c9f99f8fmr577770ljd.4.1688070955475; 
 Thu, 29 Jun 2023 13:35:55 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a2e2403000000b002b6b849c894sm1136008ljk.111.2023.06.29.13.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 13:35:55 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 29 Jun 2023 22:35:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v2-4-6136487c78c5@linaro.org>
References: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
In-Reply-To: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688070946; l=1019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bdVFkIHME+ksW97iOZJH0yeZoPTsVUfCpblAjJVbJjI=;
 b=WWHSrbYLRRkudi8WmumNn/DjTCsjM+ZBe0IDArrKqLIbchE2qvRZwS1cjEwKIOOjoGwojapCH
 lf+swQw2gHODxIICQ93jYJ+yf4+oZOiY1Zo5FrbmyCxLXFFy07oqzBB
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 4/4] drm/msm/dsi: Hook up refgen regulator
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Consume the refgen supply on configurations that may use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 8a5fb6df7210..1f98ff74ceb0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -160,6 +160,7 @@ static const char * const dsi_v2_4_clk_names[] = {
 
 static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sdm845_dsi_cfg = {
@@ -191,6 +192,7 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
+	{ .supply = "refgen" },
 };
 
 static const struct msm_dsi_config sc7280_dsi_cfg = {

-- 
2.41.0

