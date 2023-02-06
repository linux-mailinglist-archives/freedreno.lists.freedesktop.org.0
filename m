Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C755668C0B8
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 15:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF310E410;
	Mon,  6 Feb 2023 14:57:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AEE10E3F9
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 14:57:14 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id mc11so34899109ejb.10
 for <freedreno@lists.freedesktop.org>; Mon, 06 Feb 2023 06:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=VT0DIb2218KDtV8LgUx4pLrKPUjw9ZaFe16Z7Em/3TwJGRh63ca6bVtA4lUQoDAwmc
 RMhElQT3TKKvJmnlOoiorjfI76//wbJtP3F3LdwX5Dw7eaFhCNhHIiuFS3ZHPzN7ykVo
 NmlXVHhTTwRkdshfWLBPhddHlNVmlqNc0L7ya+ohdj0Lo+17RCPyyOAkxaAqLt+mUY4Q
 w+jd9/fX4jeabLO2wf/nThycCl6Bvp2AwwGius4MLnU4BTNbXMlVwpXLMymakhgsINSN
 KQ17iVSnZFR8hc08EqXjujTYmUmG1hZNwOTp+TOR6p+U+C44m38PmdH5kkVZjlScljnJ
 pvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=yM8jhl3DKiG/95sV8vkRMq9asm1/0Lm2YKntIq5ANB6NjYIqbhWOUjJfyxwQm1Cpso
 v8awC5wg7TTW+C1K1XnFBgpC4ifFjCLuu2WbWK7f7ByYFcyzdJc7v/8y4IQo+On4dlsE
 z6h6QbJj98JMgyVybXIwCicryzmKBlU0s3q1O7dgefjY09M8tSa16KGC871NVCGlAeBt
 QT2mfMA3QNMZ/YEkv/dxkvNRTy9pDk7iXN7V5alVKWxvzWGA7q8BqPUoviCPatkHHduw
 L3wg+WjHb+Xu0AEDBgULpwFEN6zhHIv1rrJInyWEbo/UbDqqzcWItIPsYua45Unb/FpD
 0MYA==
X-Gm-Message-State: AO0yUKUAFAvf3liFrogdCQHEG9FxE6z5tCAN6Vjb+fCH8fXE0sOg5Xtd
 eilkgUJzqHL2PPVlSw2PfGUI0g==
X-Google-Smtp-Source: AK7set+ld7Fvjne/Ke0hqBwYqqTXSGFZP0hAmU5HtemMLaDfL1KIGo8qZrRQ8W0ZVVuQb26Um7NGFg==
X-Received: by 2002:a17:906:3189:b0:883:ba98:204d with SMTP id
 9-20020a170906318900b00883ba98204dmr20445587ejy.65.1675695432717; 
 Mon, 06 Feb 2023 06:57:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 06:57:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Mon,  6 Feb 2023 16:57:02 +0200
Message-Id: <20230206145707.122937-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/8] dt-bindings: display/msm/gmu: add Adreno
 660 support
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index ab14e81cb050..d5ce0dff4220 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -122,6 +122,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-gmu-635.0
+              - qcom,adreno-gmu-660.1
     then:
       properties:
         reg:
-- 
2.39.1

