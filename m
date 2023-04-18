Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C6F6E60C1
	for <lists+freedreno@lfdr.de>; Tue, 18 Apr 2023 14:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF3810E78A;
	Tue, 18 Apr 2023 12:11:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938D810E786
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 12:11:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4edcc885d8fso570611e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Apr 2023 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681819862; x=1684411862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hUGnN7QmHFXWvkEalaWeWFmgMZnzSnPU7k2aFfVSknQ=;
 b=plwhb253A2LkIUiFPKKW4tqA+balXv3q+Z41+HlVwEO3GGJ+I18gB2x6IWwj2CxBqE
 MkqKmzM3QCoOqgtTPx33+3L+IFglDAYxAhtLbAOq/tl7qDv1OSnFRDJ9Tp2uRPyJ6U6C
 Ovawe47VfRsAAKWF2s6aPHes/ywxtaferpYz9b1i66XNYCmsIy1Po2JoPpycLeqXrMks
 2+fiz6J9kiydSk2brE87B8PpmnP0/3yyD0+5iXuHttN9di6fyDXGnd3uDbTOA1095hhb
 G3gVnQOZQh/PNxVUDsu1UikNdP0M9EgcZO6Imf6P/SpV04WKuHELycwNlC26b6ODtYqc
 QVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819862; x=1684411862;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUGnN7QmHFXWvkEalaWeWFmgMZnzSnPU7k2aFfVSknQ=;
 b=FqdAJfstbZ9G0QEzuo2Wmpxa/7kwGhrCruPn+7j89qy3el4V7gV8+jiw5lzz5T55pD
 Lhoxe4+Zqia+uPV+XF3ZB0ofoYHQ54iL7y8vScS1yhk4E+TGgJkPq2KjqZ2L9FmKBvU3
 EgmQMZz8uVEDmQsLcCjv1362NBLy8PNwFD+UBkYRSqP9AlS1w9hWPIMJvigo24/2EnMC
 w5+R1cXX98A0rfWq7Hb55cIsVjlZ12UqX876qlV3vW349E2LaYkuUffi1rrKmHU3cVV5
 xFmfcbi1ftbMtYgwynobOHwodg1M1AqsbBPe6YCGGqOU6YXq562i7RfvVHu8fhVYRzQc
 Sp5Q==
X-Gm-Message-State: AAQBX9dQd/9att6c26blR1jCe1qIs9WOg9+CN7p1EfRz5I0d9uAZCtWE
 Qi5taDXUtfzwtPL1T2m7jWkaXw==
X-Google-Smtp-Source: AKy350aAdkn4iy8subFZX8jCGOCNgse5k4x4SZZ/utypiAf7lkYkLQQR1tmWw2ojXblWEpk4Tc+Awg==
X-Received: by 2002:a19:ac01:0:b0:4cc:a107:82f4 with SMTP id
 g1-20020a19ac01000000b004cca10782f4mr2762138lfc.64.1681819862525; 
 Tue, 18 Apr 2023 05:11:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:11:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 18 Apr 2023 14:10:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-3-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=2175;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mFT0UyX9LhxCNCpprLZW/XLO+LLNqKMZSGZE8MZeFUU=;
 b=GK2A60TzVMQEAOzKUYKUR6rw8jItcwySKTJju9xkPZNGM9M1lTpTARcjPYfRz6gWTY1sXayeI4j8
 7oyqnIXZBh56Seh+aoobZZkMDYr+Pqf4TEujHIxmbrCBrmvszl0p
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 3/5] drm/msm/mdss: Rename path references to
 mdp_path
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
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e8c93731aaa1..9e2ce7f22677 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -48,8 +48,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -62,13 +62,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -79,16 +79,16 @@ static void msm_mdss_put_icc_path(void *data)
 	struct msm_mdss *msm_mdss = data;
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_put(msm_mdss->mdp_path[i]);
 }
 
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)

-- 
2.40.0

