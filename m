Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E900B68B359
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE3510E300;
	Mon,  6 Feb 2023 00:27:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9E710E2BB
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:44 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id mf7so29842218ejc.6
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=VIi2F2pZUyy+B+NkrpVYi2Q6A8T6HtVUjp+xZrhdeLDnUrs9JJt8xQN5RJMOD7e/QZ
 jrv0LLpF+vpQFEHuS6j4Ddg9BuY1RiS4hN+KvZRrDyyXarc2G2qSBdU+jovnjW8nHx8y
 mCyHS1kyjOEINo8dmpU9uJyj3Smmd05pxwdrBogkW2kD4lBHMCezNHO7BruPzUcRAveO
 Q9xLuxocys0S/bJNmt7BCqbJd73YEAtuHMiPdgFxCO790OSC/dzf5jxPAtOmq7b08QVj
 t2UeuopfepJRPuA2WnObK0XAytjULT4h2gvpHWSCvItuqEdHfD34N1+fGthq2RL6SlPl
 ncEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sEaaIXvwNj4Y/ABcyEFSpp75hgY1fYms1s4I3xha300=;
 b=Mxf2YylbuJ/G5WuC1kNX5ie77/tvaRM2dPe9w1RlQI5r1iWJp5xA28BReH/417P1eK
 NnsJi9gUdRN4DFdyZTiBrKjsWNpnwIZgMJAid7SYUh65vE9293jJ9KA9OiuGm+YlDkCU
 Zk6XGUrHB2IpwI3diTiZ9CT9iN12pZU6/xbWhhuuG7XSCJscYivx2kLQFc71fxPfu0Ot
 Fj/pzbiQjWHBVPHof9TUNfK8cDN9jkvK4JnK7TXAl61WehW8IHTiPvqeJXPfY4D+d6ak
 zzpcvRLm8FjihR9dpbIXCh5qZp+WD5ITSVpqczBFG8t7XCoiqgANFdUIjw/XyW3TzodF
 wX0Q==
X-Gm-Message-State: AO0yUKV9xhqCC0C6SwEevvj9RU6l+VoLoSmYehY8rq042z+K14f29Klz
 Cs5mgsMbuF2YVwO6YaA5ZrogGA==
X-Google-Smtp-Source: AK7set/4Albb6Tlbe9anok/PLMa3zrG4HRemMWmi/keMOrlZr+NTLlu0MlRZyw7atb7i2HtJ4j8Y5g==
X-Received: by 2002:a17:907:cb20:b0:885:2eb5:68a2 with SMTP id
 um32-20020a170907cb2000b008852eb568a2mr16411673ejc.16.1675643262670; 
 Sun, 05 Feb 2023 16:27:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:30 +0200
Message-Id: <20230206002735.2736935-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/8] dt-bindings: display/msm/gmu: add Adreno
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
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

