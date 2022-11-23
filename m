Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A99636AB9
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 21:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB410E611;
	Wed, 23 Nov 2022 20:18:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E86F10E611
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 20:18:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id be13so29807448lfb.4
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 12:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ecST9nT/YcQwW35//EplrlkRqIWIVC66eBdnZLwwM+4=;
 b=QZQ/jJ7LjkL8hAeYXlFlOg1bxlT95iqex3nxXJ24iN/ZfpuN3mB3zvf2T4zslMD+g5
 mfAYwNdQ5MUD0WvmDjTILGmB+zMgPGuI/FlxGarsrblHRVx7MBK/nLJ4RxOYD2NTjtIt
 0O6YEh/5AfLIrLQvawbJ/bWrFyEYAldFCnTNedKUDQ3c82n1BwVBPztKsvXMujwNaQhL
 1mruzN2ERFvlhdgYLHD9qpYTI5CPlFN3JJjRMvrfDDZZE3DOblGKNG7oBnAdEmm/s03z
 golL4ZLItXDI0sNKPuKdkgp6cwsBWlQi7rS4T/DN8EKetDXdStgx2GF5dKsKBvc5HZIB
 4Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ecST9nT/YcQwW35//EplrlkRqIWIVC66eBdnZLwwM+4=;
 b=ehnMZdlpVcAQ9zTaPZxzoDwtHndXHKtD2N7sM6/818xHeLmbM+mKUU2VJrM0Iy5KcH
 PFhAvvkopH5QVdI/yMVpcY4FtqCB1kOiK65EbjFkNU19Gecqf199B5TPPk/dheyCvnhs
 LnuNuWkap98P94m2P9ZQRxRA5Xb/YehgNJHO3hlA3UJqCrFy7pbFzT0QbfPYf4cS+6A6
 30nnMvB2k0Kr/yjagND+AFYCdEADisU3uM9JiDRHcWk5mW8poerGwzLF1oXyIfmVZn4L
 CDCWhaDvPjpc20MfjqzMx/KQVJnxgNsqruf9N/3vMOpYf75xjraF14T8acEXAk3sayj2
 2VpQ==
X-Gm-Message-State: ANoB5pnGLbTsZ4c92zQ+q4v+yk8v7QEgNZkv51+LWHFE7xgW7e6rL8r7
 BBjcW1buDGSw/ZLC4Lq7ZBXOkQ==
X-Google-Smtp-Source: AA0mqf4BQ4FuKuZDygKHET70fMHELwqB+ogCPgJHghJ08EZZIhz4651jCGxWeDveGnGlGKWQHheJXg==
X-Received: by 2002:ac2:43d9:0:b0:4a4:3059:af15 with SMTP id
 u25-20020ac243d9000000b004a43059af15mr4353327lfl.258.1669234694420; 
 Wed, 23 Nov 2022 12:18:14 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v17-20020ac258f1000000b004a03eb21c4fsm81985lfo.288.2022.11.23.12.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 12:18:13 -0800 (PST)
Message-ID: <5fd29bdb-c93c-fa77-19ce-175fbfb8e639@linaro.org>
Date: Wed, 23 Nov 2022 22:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
 <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 03/11] dt-bindings: display/msm:
 mdss-common: make clock-names required
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

On 23/11/2022 12:19, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Mark clock-names property as required to be used on all MDSS devices.
> 
> This we see from the diff. Please tell why you are doing it. In some
> other recent bindings we dropped clock-names from required, so this is
> confusing.

Thanks for the question. It looks like you are correct and we do not 
need clock-names for the new mdss devices (only for the DPU devices and 
for the old qcom,mdss binding, but it's another story).

So, I'll drop this patch from the series. And for the next cycle I will 
check whether we can drop the clock-names from existing dtsi files (and 
from schema too).

-- 
With best wishes
Dmitry

