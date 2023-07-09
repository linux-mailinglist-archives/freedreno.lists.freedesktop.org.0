Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54474C0D2
	for <lists+freedreno@lfdr.de>; Sun,  9 Jul 2023 06:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5DE10E188;
	Sun,  9 Jul 2023 04:19:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DDF10E040
 for <freedreno@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f9fdb0ef35so5256555e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876368; x=1691468368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oi8Fp0++hwDQI/DAfLZemJ+jf8MYYU/jQRwlmY9haCs=;
 b=VO/bld+0I0HysiI8754r00I3bCdlAyMXGQooiO2hSninRTQldu5dSqO6MtSRNUFREQ
 6JJiGVZEGtu8HWLnkUSqJeGdhwxC9s1Qj5HeC9mVuhIpx+SLcW5atOAU5p7QHxIeWJ/Q
 U1pX/2Y91jJ4lFGhpMcMsdiF4YvTXsxu/7DZszOzY8CLnmh8XMU7vLlFU0MERba4lGeN
 2YBtp1eiPtw8or9SCflcsV8tEO3HQZ8Ks5tsSFlI21pd9dQzTuTurJTMeRenP9zb1emc
 qqS/YJVBV3KzYjmGgwf28A7klzocYItCXnUdWayPEFZT+s9+rWwflEKbEa9C/Y31YSSS
 Urhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876368; x=1691468368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oi8Fp0++hwDQI/DAfLZemJ+jf8MYYU/jQRwlmY9haCs=;
 b=iOTWHbQ8sxsbqvC2ntB8enzVgj8QtDmkkdGtypOu8Zu3SEySzZNV2LLJ5YLHWcFEJt
 +bc49UJdRqaeaZLl4oAUYW1J3ATlcGKF7SncIldpREizeNIs65YB3wL3z4wA5gAb4Uch
 /4EcA1Q7hR4lP0yqmdGRppikj7qvpvzVEVmp5ObG78P0qtNrn+1KC/9XKNfOml2CtE/B
 LeedpBhY3pV0WcTDn99Imf6I/l0cVJ2UceEZaDIq5yVWRelAOv8DCfd4awRH8BMW8sdr
 czYaWVqV/vAE+g4rgazE08tXIPrC8s6jEMjaNbL6M33nacLDT6Cn8z+yE+56/Oub+y+9
 9WoA==
X-Gm-Message-State: ABy/qLbQK9z/eLrNtuIXlHOzSwhjMgqIzEk5KXK0uQ41dO9hDyo62Og6
 dcTvMhhGwXV2cwpd+6ww5mLZog==
X-Google-Smtp-Source: APBJJlGYMixTS72MV0mt6SRAn5KiXgy0NawZbAhvAYNPp9kX+KvymVPJwyCppGhflQtHkhnxmB3klQ==
X-Received: by 2002:a05:6512:3ba4:b0:4f8:8be4:8a82 with SMTP id
 g36-20020a0565123ba400b004f88be48a82mr8134660lfv.22.1688876368572; 
 Sat, 08 Jul 2023 21:19:28 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  9 Jul 2023 07:19:22 +0300
Message-Id: <20230709041926.4052245-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/5] dt-bindings: display: msm: dp-controller:
 document SM8250 compatible
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It looks like DP controlled on SM8250 is the same as DP controller on
SM8350. Use the SM8350 compatible as fallback for SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 7a7cf3fb3e6d..a31ec9a4179f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,sm8350-dp
       - items:
           - enum:
+              - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
-- 
2.39.2

