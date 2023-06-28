Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1F741669
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 18:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CD010E383;
	Wed, 28 Jun 2023 16:29:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0256D10E37E
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 16:29:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so4170069e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687969795; x=1690561795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=DQZ8bQM6OK1Jdf9uCG5L3p0W5NUTxn2k5hoJpqJ89L7veP52vetsvHAr9/3u2T02s3
 FwN4eefSkPJdvODiqNbplGuLRIWZ9Ug+o+/AbFNmiw3XMd8YQpmooiF/N1hUHh6vhSbk
 +ZrenMM5DtHlclnuBwZWPPEv3Ol5pFBCNQrhnDE8PhJzrMoTF3hwMBgVtWxIpX2LQ8Bh
 J8uqKwhu4k/HYE5Y5Jcu11vJbOynqrOf5likeOo+7J2v3/gC2Fd1cRt5h/ihwA/b/FZz
 zFCTB1P8rWz7AkjVdLLpogD/SCEe4jP4gZDSyaMdjoEdjth37IpwKnetCTIOvTGKKC7J
 ohjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687969795; x=1690561795;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SEhHQ8qdRfQQVMmnLHDVdeTjikaeU7SDTha8pASydDI=;
 b=hodfWXpNKEscVALEerMQc38f+7yeY3LWfqZ5Uoy60xo4aNM2RCCyWUIn/7uZaUeln2
 VHVUUMAZtadY2jD+OTLa/WQh9wAWD6kVIyy+VVVvCE1HFlFlfpOWhl/QGRYtLWWpMjOu
 WMOsd1pNAI7Gn0DGo0rlqG2KZ5m8xRq1V7FvxmwJP5XYQN1rpcHkladISmZaTpxAZQWF
 VH86NPPv01tp0Ja+IzPkeq7KrG1AoHFstBrrMI8ap1bacKltj846HoUXrNMlC+ZLZX06
 tz89aeVXMsxnmjeAiwtCgAlFmRUfOA5jUf4h4du5J4nJWTW2noN4DD8mGMEcsVd/zxCL
 PTpg==
X-Gm-Message-State: AC+VfDwoz3Ig5i9SmyXRZXHFVeD5Uyr+wo3xIHTJzGTTqiAkqLtpGyqt
 PEqN6LgTEMeHuoVs849cVWIuwQ==
X-Google-Smtp-Source: ACHHUZ4Lrm2R/nQcM5BRiDtkitE2zrl7ditARQnOGBg5dQFQzWYPnI075o/ZH3A36BQhfejWQM+KIg==
X-Received: by 2002:a05:6512:3d26:b0:4fb:89c1:c209 with SMTP id
 d38-20020a0565123d2600b004fb89c1c209mr4023314lfv.62.1687969794861; 
 Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b004faeedbb29dsm1678783lfq.64.2023.06.28.09.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 09:29:54 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 18:29:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-refgen-v1-4-126e59573eeb@linaro.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
In-Reply-To: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687969785; l=1019;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=bdVFkIHME+ksW97iOZJH0yeZoPTsVUfCpblAjJVbJjI=;
 b=k+jAhj46mh/Oof9GvJUQpt/J2u2Kf9BOt4qC0dCu0ivMbU0GBjjqGdhsVkkJrQVyrqAml8JoS
 YHTy+kjdBZUDW1wpX+4zBYjHF71ydli6DvpRMxSVeEkmb7N7RPRelKx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 4/4] drm/msm/dsi: Hook up refgen regulator
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

