Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2246635A5
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CA110E529;
	Mon,  9 Jan 2023 23:44:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0610E522
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:11 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f20so10676693lja.4
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
 b=Bdicgaim+S/x4FRXmy4dvtoyZ5XlMAiqWJMSxdpDJmRjbbuU7qUnJkuH/s6IgRjFSq
 7643o6RWE2bvpoNHiwhtjw04KtUzRl9MoZ1Cl3JCsGFfIwPps3E6SqhBMOH4YZZpESI+
 nPjAFN7cLoOZ8GA0lDL1676Lr5vEk1oEpymLEvpgQgzAxvcnGKav2tFPw1MJNEvRd7Yl
 q1mXHgNsJX1Zjz6PYApcpxZUE7EaWPjI8nNzByOhHrlpCLPITn6w5cHeSEVW2xamNdzq
 MjcpBbzWt2i9o0RfbWYraQPzlfaP+fWFCx3KNJlG7VGJ/kbIS5yH2W+Lv1J7Z9Ywj4Al
 QUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oKRTpVUA1bI23v2sl/8AqQtigjh3NRGLCQQVjyhb50M=;
 b=vvDs8iJPjLXAO87P9yDbcIdRi96Lz17sco+ToCPn7D8kYBttCjI6jiCB4QVeswhHVG
 lkOBNS/wIqp0OT7MY3uwlvqXrlx4nYNzNd5wzQEH1kHkJnh8S4VaN0NThm6pfhR+5iiQ
 WqIRlQC8nhiI5ktR7DuXgShMdWYO+zTl5ZE6ALzjRzZtHWMt36gVmZm62LQ/rKCQZr0M
 bpo5/dkWfC3Xr/bYaxnothJE09C2YTVjZ2laP6CAaXiOlhDVjUGb2LKpGcNjf6MAOFZZ
 EONutHbQZd3KraC74GnDl4MOmI84ZkO+j4ArqqZhIj3NvvMZeqA2IM/iiurvaV2KZz3b
 3a5g==
X-Gm-Message-State: AFqh2kpxuxA5yL9onbmxKZ9sBkDKbRybLeAyO0dFLoD+DObMv2HPZeUV
 CaFYoVEaQl9PpDlxIg5CwzU5RQ==
X-Google-Smtp-Source: AMrXdXsOZpU28l3y37H94lhmr2bHmsNIH3dfotXZC47cIqYW2uFHrdZqwV0CAZijlaKuKbtiKnjuRQ==
X-Received: by 2002:a05:651c:32d:b0:27f:ee19:c8b6 with SMTP id
 b13-20020a05651c032d00b0027fee19c8b6mr7538577ljp.25.1673307849603; 
 Mon, 09 Jan 2023 15:44:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 10 Jan 2023 01:43:54 +0200
Message-Id: <167330408777.609993.13359003796525315964.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 0/7] drm/msm: add support for SM8550
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 11:15:17 +0100, Neil Armstrong wrote:
> This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.
> 
> This patchset is based on the SM8450 display support serie at [1].
> 
> In order to work, the following patchsets are required:
> - PM8550 LDO fix at [2]
> - DISPCC driver at [3]
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display/msm: document the SM8550 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71917f654bae
[2/7] dt-bindings: display/msm: document DPU on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/602082368233
[3/7] dt-bindings: display/msm: document MDSS on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cb8eacfb528
[4/7] drm/msm/dpu: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c3cc4e88efb0
[5/7] drm/msm: mdss: add support for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f96cca5ed719
[6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd17f93661d
[7/7] drm/msm/dsi: add support for DSI 2.7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d797ca161b87

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
