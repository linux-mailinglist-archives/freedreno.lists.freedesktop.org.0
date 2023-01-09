Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EFF6635B4
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2DB10E519;
	Mon,  9 Jan 2023 23:44:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E2910E51C
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:12 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id o7so10323670ljj.8
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
 b=zifUNGptKz27VGg9E7uDxzXmXek04O+3q/M5NdTQV8HrpLPFUOrhO/GjfX04zs6H+0
 9xDX5b7FziGPKY4wnEIxyCq59ia73G4eMOpU1RXlKZ1fHzrV9ognLXz8Z+t3UTmqQh41
 5DolwGqjBT3unDGZMQ15LUFKeiHvQ7Fzwl+wdmesZgdj6FnVu83JdJXumSkkEoxdtNW3
 Y1kO78TEpQPi0PK5tJsICDR1URHMrhHmwWwoynAgt7DKRcDT5yguaQAHciPtmEdIdrI0
 yX8ctcW8kkTboBANA3up/lo7PKU2AKytfdW3QyFtPBdwKN7Yct65Jj9q0NNQ2uHYfjGi
 IaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ORCokxU5jx6cKMaaTper0S84yDtXOhtofp7KVmnXiA=;
 b=SEYgpzNcXy8ZCpoAbuPJz8hUK7YUKvXWbtASf6x+GgrbE8V6QTIgwOIlyyvP3yQz3Z
 uCTUmE6svYEOlm3cbNPI0V/vZSssPVr9Otx4TGEG/14GLyWdovtotNRtGwuH80QT7dqn
 SlZxeL1SxeA91jslDwhsBK7m8xwMDwuvJD3MCm23Nn2NJKKkKFvhHtfvyzbV97Jlh4Bu
 q6rG2XgFAp8Vhw0uAgGavfKhl+CV8VfFp8/bWmYAZjiPDc4ArTBKk++Ee5uQ4g3o+X63
 xu1LdTqNrUOHQokQzcFoZcz6AQEXqBENuckyKf4Mvsxeto7G+OlflhnzUlCmk5Da7iG9
 ZTrg==
X-Gm-Message-State: AFqh2kq85IChJAmihI49KN+yaQ2vzb0HiKQm+UtJ/eTFkA3Y4bNWLWqZ
 xWcAUeOFJQZ4Ya17F1Kwx8+6uQ==
X-Google-Smtp-Source: AMrXdXtNygkNrwsR7+LJt6BNVO2zpRRKS/ZMCvdl7t4EZo57sWU7hxoGy0Q+wbZA4mCbIcvFX2qXpQ==
X-Received: by 2002:a05:651c:1242:b0:282:55b0:d8d6 with SMTP id
 h2-20020a05651c124200b0028255b0d8d6mr4256425ljh.11.1673307852284; 
 Mon, 09 Jan 2023 15:44:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com, Kuogee Hsieh <quic_khsieh@quicinc.com>
Date: Tue, 10 Jan 2023 01:43:57 +0200
Message-Id: <167330408780.609993.2871958303249366717.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v16 0/5] Add data-lanes and link-frequencies
 to dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 27 Dec 2022 09:44:58 -0800, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>   arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>     endpoint
>   dt-bindings: msm/dp: add data-lanes and link-frequencies property
>   drm/msm/dp: parse data-lanes as property of dp_out endpoint
>   Add capability to parser and retrieve max DP link supported rate from
>        link-frequencies property of dp_out endpoint.
>   drm/msm/dp: add support of max dp link rate
> 
> [...]

Applied, thanks!

[2/5] dt-bindings: msm/dp: add data-lanes and link-frequencies property
      https://gitlab.freedesktop.org/lumag/msm/-/commit/123f12555074
[3/5] drm/msm/dp: parse data-lanes as property of dp_out endpoint
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d25cfeeec064
[4/5] Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint.
      https://gitlab.freedesktop.org/lumag/msm/-/commit/381518a1677c
[5/5] drm/msm/dp: add support of max dp link rate
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e7f270591a4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
