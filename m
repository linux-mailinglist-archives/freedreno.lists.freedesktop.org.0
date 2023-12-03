Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031F8022C5
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8094110E27B;
	Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D5510E277
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:41 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bb8ff22e6so4838769e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602800; x=1702207600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dsGJkEMgYOnC7T1jGA9amysHXRjV1SP4w3jzP2mqKYo=;
 b=t+dcBxIHo5eHGADxlPRYIg4mig63oaxi0jYb6S6HXYHyhFsT8YZA1g7DwD7EHTYbBt
 hqV6hB7bw4GLc2FciIstsKUZmXvx47WOXTgpKIxbRwT8D/yF6tmCSxbfvCPL9lGydbVD
 MlRH5C21WEhKLjMsXblXCJCNG1ge9mdyWmAUIwMVKDKjwCgxiyViEYQrRNb4bxGRswht
 ja+puZoYkkD3aX4xBHwFxhoJRAAftL0ZwsOnhMKKrzOgE3wSdi0Y77uZSA46CI7rIkVt
 0AroXwY1cizZ5QW84egdn2UYLDRsP5FZvJBfw9S5Y2yZkmEGoZvMXxgSA7g15ikfFUvA
 +Pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602800; x=1702207600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dsGJkEMgYOnC7T1jGA9amysHXRjV1SP4w3jzP2mqKYo=;
 b=oCTBw6iDWKedQzw984ycbQNFQ+dvGMjci/qcduVUCCVn4M6QfGtSY8P9MoFsy9OtaX
 a+HVTQz10ay44yjRFe2P3W5CUDpocz6VSIxJ0mQZWc+zVKcv4E4Hy+slS48L3QMwbnFW
 9ukEobUeR3j/3WddnRdo1nxSEcO7dS6qsXmcnNq0CGvjKt4OCF+LVzraf3ydCvkN7U9P
 00GtCcKmi1eAPKcXvKIFJKKAYI1iSlGWkF71VM9DDaq6w/rZ3zNA5dMswCyvHu9EEciQ
 fctRx8aEYrL6b0936VjgLHe51FpN97jpNcl710Oi4nEOUovvnYDR/giFKlMa/bbaiojo
 KJ7g==
X-Gm-Message-State: AOJu0YzievKMFzjWiz5M5k16oBB1BNOmkGi2Synnx019otjGS0r4HU/y
 E3xEWGOZu+/6ggPDOD9kxftXrw==
X-Google-Smtp-Source: AGHT+IGTXjNHVOlRK83VPte/bws5CiHwW/uyqVkiKfSIsKv+KpW+bT01/1EwXLC4NivAlf5yAF6gaQ==
X-Received: by 2002:a05:6512:2c8b:b0:4fe:2815:8ba7 with SMTP id
 dw11-20020a0565122c8b00b004fe28158ba7mr2247401lfb.25.1701602800000; 
 Sun, 03 Dec 2023 03:26:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun,  3 Dec 2023 14:26:24 +0300
Message-Id: <170160265545.1305159.12554929694574480322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
References: <20231111142017.51922-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: qcom,
 sm8150-mdss: correct DSI PHY compatible
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 11 Nov 2023 15:20:17 +0100, Krzysztof Kozlowski wrote:
> Qualcomm SM8150 MDSS comes with a bit different 7nm DSI PHY with its own
> compatible.  DTS already use it:
> 
>   sa8155p-adp.dtb: display-subsystem@ae00000: phy@ae94400:compatible:0: 'qcom,dsi-phy-7nm' was expected
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sm8150-mdss: correct DSI PHY compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1cd83dfe9a58

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
