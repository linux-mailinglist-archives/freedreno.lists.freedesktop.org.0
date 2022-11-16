Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9F62C478
	for <lists+freedreno@lfdr.de>; Wed, 16 Nov 2022 17:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D89A10E4D9;
	Wed, 16 Nov 2022 16:32:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982210E4D8
 for <freedreno@lists.freedesktop.org>; Wed, 16 Nov 2022 16:32:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bj12so45339423ejb.13
 for <freedreno@lists.freedesktop.org>; Wed, 16 Nov 2022 08:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1QOj2w1cuKEuCIniHGOx+eV8LLJOHngxV7TUVqDlP5I=;
 b=u2k7Aq29+rEZRuq5H9ipwm5MwIJyfeSnavYzCbkSR9sRcej5GhYU7gxUCwFnNRXOwu
 cOeAxAiSan/C9H+9EzluRSKGEbbdZd6Y3cf5ck+dK4fm4E4Z8GSuOY+Xgy/N1G8tqzTl
 aDuRuoDAZiJEMaghbnstJRqW+IByKbn7exB6kMzRdpYqIZhyUNjuwqt4wdHuFPHa8uow
 YraOE1CTGUZcqDYovZ1qetd8lK79fd7kFoZHfoAeRYo4GyPKb6eaby4vcU8jfZXx/fNR
 JhKwb7S/Qcnn9Sulgb0GCCykyBjNiz+sm0GGGD9egaJr8ltxpCYQVK9cpma1vSOR7A7C
 zMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1QOj2w1cuKEuCIniHGOx+eV8LLJOHngxV7TUVqDlP5I=;
 b=YETEM9SrGrkUznA4Wg5tfiVzf0A7O90CMUPUNRtzHO6FSHQLZnVXEgrBn/mTY5patt
 ig5Mfmr6WMXwQaRAr4GTvw7GC34UUgPWo1mK5wi8H2IHTui3ujmTWcEwxSLx8JNegdq+
 E7NESrpXvKQNXAlPYPHapIHlI+vGgkCNiZx7ur3M8bt0vhR2SHO8dCg6mdcEl2/6TlQJ
 6uZ8n4OZ37P9g5vVqJ4U761HszdbuXtgoiP1YroXwwZV81bMPYWR8KuV1//uX10F5MvQ
 y3pHamOXJU9lOKNiPpdhAUynvMwr7I7HuwLoiNrL55NtCDJv5CeMvLHxAeWoEJmRv/vq
 TUBA==
X-Gm-Message-State: ANoB5pnHzX0cKsADWQGJ0C27L119bsDZCgAkDKyr6BzL9TMyciJjcCrA
 Up196j6BmazkH1iZ751x6dkpwqFX5R3QhwY/
X-Google-Smtp-Source: AA0mqf4jxfP9I6wfX2k/5npoUZddyBUv0XsHwgJSeKCwsjhDVGtEdz+uFqYxcGQVmf4awiHn7Q/UFg==
X-Received: by 2002:a17:906:c18b:b0:789:d2fc:41d1 with SMTP id
 g11-20020a170906c18b00b00789d2fc41d1mr17987998ejz.642.1668616348355; 
 Wed, 16 Nov 2022 08:32:28 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 hw20-20020a170907a0d400b007add62dafb7sm7082093ejc.5.2022.11.16.08.32.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 16 Nov 2022 08:32:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Wed, 16 Nov 2022 17:32:18 +0100
Message-Id: <20221116163218.42449-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply
 on 10nm PHY
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@linaro.org,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some SoCs (hello SM6350) vdds-supply is not wired to any smd-rpm
or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
which is voted for in the DSI ctrl node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
index d9ad8b659f58..3ec466c3ab38 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -69,7 +69,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - vdds-supply
 
 unevaluatedProperties: false
 
-- 
2.38.1

