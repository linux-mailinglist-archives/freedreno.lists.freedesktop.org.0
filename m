Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250B690A78
	for <lists+freedreno@lfdr.de>; Thu,  9 Feb 2023 14:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E2A10EAD2;
	Thu,  9 Feb 2023 13:38:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FD410EACD
 for <freedreno@lists.freedesktop.org>; Thu,  9 Feb 2023 13:38:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lu11so6436153ejb.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Feb 2023 05:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
 b=YgfHLZ0nxB4fnNrnVqPyn0cjdW01VV3ntd8kOMFGnXs4ZomPH5Ib1fPCzIzMeSDrc+
 liCzck42JmI8Agl4SPuD0aFns4u6Hev8ok8SXkRbL1+yShqD0ViraQyw7R9LVXxoJd2w
 e/YACNmWMZZ7q6mgHg/4YeNwAc+elKzBSZVbhBZ7dnd62F0nCTj4X8LQWEHkJsGiYpmH
 OZKb4ONTFpC/C8xxx/Yl7PFt1/GD8y8NM1veiHamk3Wqa3yHY1OHVTcRKtYr0X6VkbTl
 hZ/cm64TdxfSpzbwFnmA6BJVYiSUyF5800ixi+BuqXM6Lb9A/3SyM6EEOfqGB2YdoajU
 RCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00j4AQtDp3exXyYDIs2Yr8FW3T8oaLqnbNrY+Ba7dm0=;
 b=kxEUjp6kZv1ATbmjdqzrHnLOQxTI+z1CXlXzVOBw7Sq5TSgkTm2YEG0iO/VVhQqNmy
 HZWoV2/5dHu95sp3w0EXV682ccDq/Iexo250fRtE2A4V2za2gLTTPDEbnqIzvC1eu9rp
 HPPhqVu7U4bCxxZll98f0iXafwWbDM3TvQ+nn0s2JMlppqZbmP5DMm48fr/RjfOCuRoi
 rz3AumOEaC2g3kzP2WC3CbqXqDzKusHtSw8SIS9y8i/MiQ/YmKjPa4uLEh7CktdbQUWT
 4g1rTrOGy6cNpnsOMJ98aq/WvHJ6ZoJCmaq92UKCLf5y11a4q7OOV0EJg3/Cxhgqgwqr
 dYPA==
X-Gm-Message-State: AO0yUKUnheofJ/K4nUiNgjjDN3Au01M43XV56pjUZVOfo9+azk7+0kGZ
 rDNO+X9Tp1Xmvl9a4duuxsiuhg==
X-Google-Smtp-Source: AK7set9UTkWIJM92EQBven9Sq6OQzBr7KHfac1vI9Jxlu85/gUxZb1RJU15seSNGm2qCKr2bzm6lSw==
X-Received: by 2002:a17:906:4748:b0:84d:47e3:fe49 with SMTP id
 j8-20020a170906474800b0084d47e3fe49mr12341580ejs.39.1675949922813; 
 Thu, 09 Feb 2023 05:38:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 cd17-20020a170906b35100b0088f8ee84b76sm885553ejb.105.2023.02.09.05.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 05:38:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Feb 2023 15:38:34 +0200
Message-Id: <20230209133839.762631-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/6] dt-bindings: display/msm/gmu: add Adreno
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add Adreno A660 to the A635 clause to define all version-specific
properties. There is no need to add it to the top-level clause, since
top-level compatible uses pattern to define compatible strings.

Acked-by: Rob Herring <robh@kernel.org>
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

