Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEFC742278
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 10:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0158810E0D1;
	Thu, 29 Jun 2023 08:43:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FA310E0AB
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 08:43:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so618942e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688028209; x=1690620209;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qo4yGUv1TOFCIrsnfkNO3R46DvaHvrlG+9D5FRJF5Jg=;
 b=M3FTGszHO6OJxctxtz0KJywXYYbX7jV/+5rSXgCzHg5cYUb6W+I37sd9TENmRHfi2W
 iSCFErZa/f1Mss1p45fguznG1BbnuGnVkfswH6fkVEwm7ZPs4n/bl96MNFPbI1P4VzUH
 aBsiVd0KgUibCfpQfaKkf26Fk9fk9j6HFRX1NHJYGP5L5fBJZbssEGtgRxP/dLTUQ80A
 FeWpG3prcSUD8CSviJBo7m4EejOXdY7vpCNRM7P/WE53wN6zZcLO7Segdo8LVC1nTnpT
 fVBb3zVv14xqN6KdpY7vNWwbuGgTsn6TTiVdSfjiBIhDlXO2H7yFdMWlVFm7qWzPhxgF
 fufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688028209; x=1690620209;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qo4yGUv1TOFCIrsnfkNO3R46DvaHvrlG+9D5FRJF5Jg=;
 b=S01rHMkjC57HryS2r6GlqGqS1Y9JU+TFZGLTx6sHQVyjl9XjzNCWqmuqlLCKz5ruXZ
 RKUDE2ZZsZYxRRc3EM73kw24CH7lldSOs+MuGIqAeNi1SNxVxJ5+CU3cPiFCrV11T22/
 ON12hbdt+DTgt+0RxYBlRsmbVm6z7hHWjnXMWByx07t2KzpX1Imhfu6Hwbk03o1IiGx6
 NAF5szT2b5ACjMPtV3tZ81Gt4wb/QUM5Qee4lQ94RJfH7mxPtQiSK7SNiq9p+8SF7+Fd
 NJfKc2KC6SL4P/RQ0KiM1N6xZnNHP4zBk80q3bCzU0ECR4FxALcCOLsUjS7Y8yqnf0b7
 VF0A==
X-Gm-Message-State: AC+VfDyWK7ZA0EdJjHmxcl8hQpuSak3/FCjZfgXz8e5WwjrxB+Lm5Qu6
 PK5NtQHpsRjCsOdqx1o/z6njaQ==
X-Google-Smtp-Source: ACHHUZ7stWXiuLhwXrWPZUUzH7IcRisV14MnYsT7ncg2kjCKJUgtYj6FUKnNJRwbW1MvDGNrQus1SQ==
X-Received: by 2002:a05:6512:3f01:b0:4fb:89bb:ca19 with SMTP id
 y1-20020a0565123f0100b004fb89bbca19mr5157774lfa.66.1688028209160; 
 Thu, 29 Jun 2023 01:43:29 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056512390600b004f21f196701sm2241839lfu.203.2023.06.29.01.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 01:43:28 -0700 (PDT)
Message-ID: <6109d966-b705-4e84-d8b3-c895ef540db3@linaro.org>
Date: Thu, 29 Jun 2023 10:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230628-topic-refgen-v1-0-126e59573eeb@linaro.org>
 <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
 <76e2f865-1a37-4517-b343-6aaea397fcf7@sirena.org.uk>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <76e2f865-1a37-4517-b343-6aaea397fcf7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 2/4] regulator: Introduce Qualcomm REFGEN
 regulator driver
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>,
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28.06.2023 21:28, Mark Brown wrote:
> On Wed, Jun 28, 2023 at 06:29:46PM +0200, Konrad Dybcio wrote:
> 
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2017, 2019-2020, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Limited
>> + */
> 
> Please use a C++ comment for the whole thing for consistency.
Oh that's new!

> 
>> +static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>> +
>> +	regmap_update_bits(vreg->base, REFGEN_REG_BG_CTRL,
>> +			   REFGEN_BG_CTRL_MASK, REFGEN_BG_CTRL_ENABLE);
>> +	regmap_write(vreg->base, REFGEN_REG_BIAS_EN, REFGEN_BIAS_EN_ENABLE);
> 
> For the enable and disable operations we use a mix of _update_bits() and
> absolute writes with no FIELD_PREP()...
This absolute write was accidentally fine as the mask began at bit0...

> 
>> +static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>> +	u32 val;
>> +
>> +	regmap_read(vreg->base, REFGEN_REG_BG_CTRL, &val);
>> +	if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
>> +		return 0;
>> +
>> +	regmap_read(vreg->base, REFGEN_REG_BIAS_EN, &val);
>> +	if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
>> +		return 0;
> 
> ...but when we read back the status we use FIELD_GET().  This looks like
> a bug, and given that one of the fields starts at bit 1 it presumably is
> one - FIELD_GET() will do shifting.
...but a 2-bit-wide field will never equal 6.
Looks like I put unshifted values in the defines for REFGEN_BG_CTRL..

Thanks for spotting that!

> 
>> +static int qcom_sm8250_refgen_enable(struct regulator_dev *rdev)
>> +{
>> +	struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
>> +
>> +	regmap_update_bits(vreg->base, REFGEN_REG_PWRDWN_CTRL5,
>> +			   REFGEN_PWRDWN_CTRL5_MASK, REFGEN_PWRDWN_CTRL5_ENABLE);
> 
> This is a single bit in a single register so could use the standard
> helpers rather than open coding, the sdm845 does need custom operations
> due to having two fields to manage.
Forgot that's a thing!

Konrad
