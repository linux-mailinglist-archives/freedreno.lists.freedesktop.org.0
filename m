Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 640535A24E7
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4CF10E7F7;
	Fri, 26 Aug 2022 09:49:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42C410E815
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id x10so1074073ljq.4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
 b=ZKjXAMz8pcymkVteFl94YoiUT4i+0H/GnJWZZD+19egMi9JRgYIzvgBmCgceFkobin
 GJ/ByY5Rn34tSNA9+0J3y2k2w7mID9Br4UDV1ziUweyTvrgC22eR/a6jxQ/Xz3cwb12L
 WR3r3qy4A3AVCXdAXOmEjVe87Al5+bbkFj8rnFR0QST3F4jJ2yqzT3wx0N/kfmvHb1rG
 gdf+cqGzv5tNeQIxf8GsVMH72XdcFQE+zmAVBt9rhM4bbc99xkQKOypE5hE/nxJnACqh
 EPmEbE+dxz1lTUVuQXb1ZTj/He2B/RMM8qfPdB/0zatUW2AbBQAkoUp9piDsNrzMB3S/
 jScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GsqQd6SAPDb0fT70p8X6mFpGFngwmS41ZDD9UsqFcxM=;
 b=amJsibRP+X4Chw7oqTWleEv7lkFmWlAqQCspa0g/3nFvNkKPl6BzaZILk5rt56M1lU
 X1yOKJ1SZHF4g9f5u6TFuVfBjccsG0s/uHyxHks/z58i7P04/2Oxh0YJFSzgk6pu8YM9
 X9fzg3d5U6YN7cKwDQEF1Jll+bIUbydFuxqUpaTPydLPELd9I0L+3eKmaZCL9JUGaat8
 sARM6nRiL+ohjIcmPCA88ZpziutJpplHqRiETLC8yQNjDAeT/MY6AcGdchUxsUql9ILf
 V8sD+7qwsdr7ZDJ+jC7r/1es17oErJWuaWFqlcIDljL5UEPXPVThVZavrH/DF2+LYu7g
 6ydg==
X-Gm-Message-State: ACgBeo3JXvM2XhrYDE3E6TQhOG4jCmqrxJ4VTsgNjmQ2MK9TX3ksXUZJ
 6kcaLjkpmU79+HKHVTAZ8YQLMQ==
X-Google-Smtp-Source: AA6agR7ECId76gxdTj+Hok9vpI+zeUXckjiUcPYxRPDp7nQ9KYixIuJxEsgttN74oxS3l80Y9y9SAg==
X-Received: by 2002:a05:651c:88e:b0:261:b5e5:8622 with SMTP id
 d14-20020a05651c088e00b00261b5e58622mr1990934ljq.99.1661507359218; 
 Fri, 26 Aug 2022 02:49:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f13-20020ac251ad000000b0048d1101d0d6sm327311lfk.121.2022.08.26.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:18 -0700 (PDT)
Message-ID: <8489a606-9894-acb6-1b59-bb29f7a6baac@linaro.org>
Date: Fri, 26 Aug 2022 12:49:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-4-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/5] dt-bindings: display/msm:
 dpu-sc7180: add missing DPU opp-table
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

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

