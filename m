Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4063EDFA
	for <lists+freedreno@lfdr.de>; Thu,  1 Dec 2022 11:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F8410E129;
	Thu,  1 Dec 2022 10:37:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BFE10E129
 for <freedreno@lists.freedesktop.org>; Thu,  1 Dec 2022 10:37:32 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a19so1434352ljk.0
 for <freedreno@lists.freedesktop.org>; Thu, 01 Dec 2022 02:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
 b=oRuEXXERKZYYDV9WimFhxi+n+W16yYt2dtOc7P5QG08IRUKnts1REggwWcSWA2K7GS
 CFWqZfYbNsg/vcgWQQ6gDHeVl1xTmW6BEWAWnS5pbY+gqcMzZsnq8L7hVPgEOrI+27Hw
 SPbvb6eW8+fT07BwkeFkFtubmtV5KF3Jvsky2iUBjMnzlpMQycRNe3Ezvx7xJEAcUhNG
 +Lgp1rl1ekNfciXbfK+C+cv2ofczu6yn0K8XW9aEDCNpWEGEK8awHimGAY5/lhZxjwwj
 5mTVf+6Jg1X0Nm1Krh54WT05EljJ43fEtjcKBJ7mDa00Sxbyc6tQuE766VVTCZjfEOXZ
 igYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIit3J5M4bcdITVWI6ie/I3FGXLXgR6m6GwfusmdrJE=;
 b=hUn6prj5gahaRNroYgyVIvQA6HDTamaMpIBr4+3ObegJSlsNrFZcVR2trFEZhC/+5b
 8fGNGMjU6hvGYPN+zgHBhGgEbAWBM3ylwM8LSo0199RMSERyJa5KeGb044spmXWmWi06
 6jaPRUOu9/7RR092zavczKgblesJzpMwniwWd45v6sIGB2p29xK4OYirIWM8X7nHLDOR
 FYhBvn7ldBaXuqUQDcsvoXSmz5hibCNR/31rh8/j7Yl1SvJE6tZkmbcQU99bbW8zOe2c
 RRT685jHtpOLJusdSRBZhiFEMlomFWRueTpCI/BQkw4S6sBDUUvhCYd7EsNy2OcmQWzN
 0YXg==
X-Gm-Message-State: ANoB5pm4FtXL+Ift3wLtNA0TGvV3Tn0AiHFOX79WDC7vdFou9XQD0BgO
 WESV1fUQMY2g39NHvsKg/3BWbw==
X-Google-Smtp-Source: AA0mqf7ynKkshYTZoTQ3GRH//Z1ZR04OWdvwe5TEjKbt7pYwLviofbMpiBkGttO94vlLg2DiroAsTg==
X-Received: by 2002:a2e:940f:0:b0:277:5df:9728 with SMTP id
 i15-20020a2e940f000000b0027705df9728mr14128145ljh.337.1669891050977; 
 Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a056512203500b004ab98cd5644sm601503lfs.182.2022.12.01.02.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 02:37:30 -0800 (PST)
Message-ID: <dfd2d1b5-4d1b-2381-ad11-5ea9e6654a55@linaro.org>
Date: Thu, 1 Dec 2022 11:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221130200950.144618-1-a39.skl@gmail.com>
 <20221130200950.144618-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221130200950.144618-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 01/12] dt-bindings: display: msm: Rename
 mdss node name in example
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 30/11/2022 21:09, Adam Skladowski wrote:
> Follow other YAMLs and replace mdss name into display-subystem.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

