Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18E576FB0
	for <lists+freedreno@lfdr.de>; Sat, 16 Jul 2022 17:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A511C91658;
	Sat, 16 Jul 2022 15:19:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662B91403
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 15:19:13 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10bf634bc50so12851492fac.3
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
 b=hvh+ZXn27ZYbuIcHm+5baX0viLyxD9zAwNRcRcHRZhgmbBWaMgcnxPOR2Sc4IMCibZ
 C0ha3b32m5PMps1kCfPEoAI6+v6U+iEduO3Mc7NBcfwoUbtpfPtHETxcqKAyGxUd7Yif
 koRm+tpW/YDraYTfGXw2wyInOYdTKqQkLsXnJ5VEBDC6rTHwV/B7nCMhowFnzOHilHGM
 X0T++/P76k7eGh6OJxi4npjOiqHiF5Cjd6wNxSsaLzFRPVgFXIebxEi8zho7C0jZGV6n
 H6Av2TtX5t/FqmJXNKb/2GreIHtzbkD77k9YCusY7owoX9607IgUnBksp1Bbqr0q8IZ2
 4COw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGpMze8Cu0x5aw2jz/djjciZugDe/TnizDWYWXMdwrw=;
 b=1UA8cusw4YMl7ayQg7h1mgbUyLA69u4e4NorvNJKAhGePaHv+TuTqPvJsEgsSxFyY3
 4CIoT+ibvq+Bkd+kvj8Isguwz9g6wxcBOvCo1HpoyKnHQAaYd8MU4BtYbx2Ggt1n/GNX
 kTzkqRqSxTvx63NQsOxRUuhiZquSnu1KM403TpcAA8fb6c17hYIuFv9dVl2A4VojLZlp
 f6AWXIrhzI+J6WtNisfXXNEJMDFNNudCapfYcogALXiCEoGObrN+KTBE+lKcJwJCHq+a
 MGrIb3gCFyYkgD/L3WZ3hX8z2hFZoZnCwLNIpC/vKyvHk6kRJyAzCXbpfgDKTWJC1ZuC
 b3xg==
X-Gm-Message-State: AJIora8WB6WmcYq87srb+JwGDQNdDO7uKUlJb3HZWxn8KDFp8CJ7Mz8y
 zedsaA/SQaWN/MeyOJesJBRMaA==
X-Google-Smtp-Source: AGRyM1vGN296YAzt/BeCYxhczcXUWMLFb+GMEusEzYT6LCFpTZKDhdqpfPXaxfKZZTkGU2MgUWYtzw==
X-Received: by 2002:a05:6808:10d4:b0:339:f690:1ac4 with SMTP id
 s20-20020a05680810d400b00339f6901ac4mr9650262ois.210.1657984752392; 
 Sat, 16 Jul 2022 08:19:12 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 m21-20020a4ad515000000b00425beedad70sm3035254oos.32.2022.07.16.08.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:19:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Date: Sat, 16 Jul 2022 10:18:55 -0500
Message-Id: <165798474063.1679948.9453224348232992822.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v2 00/11] dt-bindings: display/msm:
 rework MDSS and DPU bindings
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:29 +0300, Dmitry Baryshkov wrote:
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards.
> 
> Changes since v1:
>  - Renamed DPU device nodes from mdp@ to display-controller@
>  - Described removal of mistakenly mentioned "lut" clock
>  - Switched mdss.yaml to use $ref instead of fixing compatible strings
>  - Dropped mdp-opp-table description (renamed by Krzysztof in his
>    patchset)
>  - Reworked DPU's ports definitions. Dropped description of individual
>    ports, left only /ports $ref and description in dpu-common.yaml.
> 
> [...]

Applied, thanks!

[01/11] arm64: dts: qcom: sdm845: rename DPU device node
        commit: 1d52eb6cc827d0f166c728a7577609de75b6b8b1
[02/11] arm64: dts: qcom: sc7180: rename DPU device node
        commit: 37e3558b79392ab864fe887b4593c5f737e063a5
[03/11] arm64: dts: qcom: sm8250: rename DPU device node
        commit: ce5cf986cdab1973df0042ac5b743d5df008c338

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
