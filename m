Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4586D14BA
	for <lists+freedreno@lfdr.de>; Fri, 31 Mar 2023 03:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C7A10F0C4;
	Fri, 31 Mar 2023 01:14:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9918A10F0C1
 for <freedreno@lists.freedesktop.org>; Fri, 31 Mar 2023 01:14:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s20so1179090ljp.7
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 18:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680225296;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xMt5o7eVOVyetFxZi6Wtlfos4TgIUANblrdBkQ0mZ+g=;
 b=ovLvv6Z3mM4rfJoKMIhlkqF5ZX9/tY0KVKB5Iksff70ffOL8mKfTOWOHOXEBDogsLy
 zmeeH4c8yT/NCB5HZvz22V4u3k0Ax3JutM7KiKHumlVDFSwGkjA3TpirAR3MXE6nKQ2M
 0X1uWbcsqKdFB9LLh42tYPAsYxCTYRa8G6lqsczqqNCqGRuP3pwlrAKg/4EFz0Ur83v/
 qvoRBbuHeKJ8qvhUi++M0Nihvp2Zrm/1CEwOiZr9eR+SnHTwpOpFqIX2p9QgvghkI7qZ
 SOwhDIhwVFdFRe8P12/JxoMTwrYazUnsQAAtraLr6pEpTDFLKEsxFapccp05p4xCoS8S
 3kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680225296;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xMt5o7eVOVyetFxZi6Wtlfos4TgIUANblrdBkQ0mZ+g=;
 b=2PmnLI6DBfPwGBfLFtn5qDzp3Fpptfbll9r4JIsnPuV/is+Hu8ZkBSfF5LX2+X/nm8
 cYPpJG07pgziQ1cCHiHPeMA41ex/1T/xmHsRlT7qkSDgMpP+PFOKb51lXy4cCPN5j2Dd
 iymy4KPeDLlLzeAZ9K62LNtFao/hHKVrb+W05rJsKRFVgcDG8Co/7jY/W2BXP+50+SGw
 5yV81SDT/WDFiLNl4xMVQsgIsq0gQ68qFhQQFVaAskmiM+9uEuK5pFK3e6klS8XkDH30
 l7CM6Ue0N0lJG5LJe5XMpIvnow9P4RzGQwo77FQFHDa/kVyogrjjJL2xP7AuaZFcQ8vM
 HmTA==
X-Gm-Message-State: AAQBX9cXcI3X50ZQBczk+Oxv2bIyVb/CGighhnF2ighObD5kAqbES6TU
 TaVCagPp/d63xYvuw9odCzzN2g==
X-Google-Smtp-Source: AKy350bB+awwGcgIgXmdkRxLiXinTgLBgl/AzH2xLNTvmCh9sh6FfYlLCnNuLerm3AcQT7uXNulBNg==
X-Received: by 2002:a2e:b614:0:b0:2a0:3f9f:fecd with SMTP id
 r20-20020a2eb614000000b002a03f9ffecdmr7740015ljn.49.1680225295836; 
 Thu, 30 Mar 2023 18:14:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a2e7207000000b002986854f27dsm134573ljc.23.2023.03.30.18.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 18:14:55 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 31 Mar 2023 03:14:48 +0200
Message-Id: <20230331-topic-konahana_speedbin-v3-0-2dede22dd7f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAg0JmQC/x2N0QrCMAxFf2Xk2UBtJ4K/IiJpl7ngSEujIoz9u
 8HHcy6Hu4FxFza4DBt0/ohJVYd0GKAspA9GmZwhhphCSkd81SYFn1XJZ7pbY56yKFLmUM7xNMd
 xBK8zGWPupGXxXt/r6rJ1nuX7v7ve9v0HC8vjcn4AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680225294; l=1580;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Z4sih2qa0PUG8gStwgxQKZOfyMiBl0L0thVhEIYRgTA=;
 b=dDH9R7V3yQBHD6qeTJlYEPlkejHdOYxSa8xt9FibgBrfIH7UZSZ5KtyijfLN7/4YvNKdhxl1le8W
 5AD4PNGiDVycRXBzI/kobVEyCawYc6HG0/SuS8nTuprHGsz7ivQy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 0/5] SM8[12]50 GPU speedbin
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
Cc: devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series brings SM8[12]50 (A6[45]0) speedbin support along with a
touch-up for 8150, allowing Adreno to cooperate with the display hw.

Tested on Xperia 5 II (SM8250 Edo PDX206) and Xperia 5 (SM8150 Kumano
Bahamut).

v2 -> v3:
- Don't swap speedbin 2 (with fuse val 3) and speedbin 3 (with fuse val 2)
  on SM8250 (no functional change, this is all a software construct but
  let's stick with the official mapping) [2/5], [5/5]

I kept all of the tags in good faith.

v1 -> v2:
- Drop bindings patches (Applied by Srini)
- Remove leftover comment about missing speedbin in 8150 DTSI (Marijn)
- Collect tags

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (5):
      drm/msm/a6xx: Add support for A640 speed binning
      drm/msm/a6xx: Add support for A650 speed binning
      arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
      arm64: dts: qcom: sm8150: Add GPU speedbin support
      arm64: dts: qcom: sm8250: Add GPU speedbin support

 arch/arm64/boot/dts/qcom/sm8150-hdk.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 31 +++++++++++++++++++++----------
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+), 11 deletions(-)
---
base-commit: a6d9e3034536ba4b68ac34490c02267e6eec9c05
change-id: 20230331-topic-konahana_speedbin-abe0c725f244

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

