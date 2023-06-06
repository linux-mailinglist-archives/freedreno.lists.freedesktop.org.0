Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B68FC7242B4
	for <lists+freedreno@lfdr.de>; Tue,  6 Jun 2023 14:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C52710E356;
	Tue,  6 Jun 2023 12:44:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562A010E351
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jun 2023 12:44:24 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b1a46ad09fso70893821fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 06 Jun 2023 05:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686055462; x=1688647462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=xTXMPt5qjw5ckeNtSZRbmcSRWPRAvhSPcMgyF58k7vwq00/q2YHpIDU5Y585K9ufUA
 kofsA+W6MX8KmmOS9eAIjAtShpicrKI4zU/inx+Chc8QQ2sW1olrALALUzpWOQ/Fi0wQ
 O8rQF5F0A+jDNRyhpmyBGyGo0seGE7/GXW//Yk8Q5oA2tW/VuzvexQz97Yz35m/+yJFh
 jaHTWWX8QYJYZewDC2mCVy1GC7QSR9U3alvUql+u5jPk3BA8RZnT7P0QDYxw5Xgtw+1V
 Vj5II4bd1Ubjgj1SkipWP6MlatybLMO6ZHDU47bem4qgALW7rTGW6vTo0MLp247U2Lnj
 dhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686055462; x=1688647462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=eVmmwLTuOvtkJHheJcD/UDKAiky/utQV1nqTMA6VxNNp6yt7CzfehhMXUIW5uLXu+M
 lvBCgBpy6UN7agXVJv3TNZ5WEz6GQWp+F5ph432bCCZAT4/kUIWmxKafjh0FhfUrb01H
 nF+8zmVXSDBDDyQD1hSL0h+riUUjUKnpKdy/J29vFx0NvdiIXLiEwYNUx/5jUtmV4m+u
 NpvVY+2zp50AQlubiHxq+o3bL9eGlObbMFbcS83kjzg+xV9oFe9+OaNnStKQDcsCZ32e
 7WUh1a+hRLZVaIZBdAyapXs68pEuc3P+a8CakO44D2CeDbGiUkGOk+2Jdudi/+X/Msw5
 0hfw==
X-Gm-Message-State: AC+VfDzJIi1E7Ze1Js8pinBE8j7giXCq+Nlj8mRhDH3v/miFE/j7ch/B
 UXXBQ4NmXKPTaKms1Kj8J8JFQLV4XqtCIIIRaMg=
X-Google-Smtp-Source: ACHHUZ7A3GQghxMA8gd7veJ/w95rzySJ/qmOxD+nL9U3cSecVLvIc/gZ2Kjtj0kgX9i88gP8VxDHVQ==
X-Received: by 2002:a2e:8606:0:b0:2ac:75fa:495c with SMTP id
 a6-20020a2e8606000000b002ac75fa495cmr1093452lji.27.1686055462014; 
 Tue, 06 Jun 2023 05:44:22 -0700 (PDT)
Received: from [192.168.1.101] (abyl150.neoplus.adsl.tpnet.pl. [83.9.31.150])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e9f17000000b002a9ebff8431sm1830823ljk.94.2023.06.06.05.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 05:44:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Jun 2023 14:44:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v6-9-dee6a882571b@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v6-0-dee6a882571b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686055444; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Nh6zuYJI8gb14gxje6MmS/hbQSaIA3Eeoi75EfztoC0=;
 b=OxWGteNTPcUfGPGr2JL2cA95wzVZAKIBzz7/e/VX6ySLc0zf6TYdbDyWq7IlwKcdnUOqH76uv
 5RDrPgRuFIkBcbI8//m86Ae0h5O/Rd1iGp9/vcUd1WXHPFfFGFBgYFg
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 09/12] drm/msm: mdss: Add SM6375 support
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
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for MDSS on SM6375.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..05648c910c68 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -580,6 +580,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.1

