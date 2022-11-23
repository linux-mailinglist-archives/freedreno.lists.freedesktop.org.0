Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F3B635970
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 11:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207B910E538;
	Wed, 23 Nov 2022 10:16:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCFF10E1B7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 10:16:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q7so412294ljp.9
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oR+nT74thFGcbIER8q3m9JwKnBmR6qe6ElNikxenUz8=;
 b=JxGPcQKrEPSSUhCC6ygX1GehOAUzCEl9NshprOVA6VHzal88q1R/4JjYva6DgQIpnY
 tSUjglqAX+iKhSCvyGyemn6CyumZA7DulpMRgIoer3K0oliihzmuAExmt3TtMB/aX1ak
 oSuKa58dFXPt+nxS52HC+iNM8qz8rMTgsxKMZesczhI92haC1K2T313cBHabBfpPK7fS
 kpuFyfv/6Gb4+JFvH45PBM4U8c+lqeEgF6aiN1niU5U5a1LlfNq1UhkYydmeuxd7srae
 RxJWhgTaQlmEcNnwIb6aVksvGTHFWvyGx3D87s/aPvfphjS8ugeEHOXkNEsm6RZW2Ndj
 KgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oR+nT74thFGcbIER8q3m9JwKnBmR6qe6ElNikxenUz8=;
 b=FAz1xDZb2kkdhva9E0I3Kn4ig1bUs2qXm22vlESj3YDBBa+eeXtyAN2c3CcaWv9D2A
 8KKAqZAmjdDWRlCZKUobwECiBvm5qU2F19PK1MWtwgnW3m4Pb0kVzlRW4ZVhbdVB2sgr
 qKyXzkgu1vNKjEcLPZ/CO51vKP68AJvrbNv32XCuxAk7aD5BxLlkDrZm4Wp95h/dJYmt
 Zwn1BtsB36O2ZgZPzPYgmTYVaWPueZPXFssBX+ESIouttlxYDjGJiq0h3mz16tqyvUCo
 WgSH4H5RmSzi7TDdsGYmcO0hOSRMrTxao/dVJnlpaHBu22/6iMEn5rPPZSPUi6NFYdJL
 Co+g==
X-Gm-Message-State: ANoB5pkA/ZiYvdn5VLsSWPdUV945WQ2r5lPdTr6IoopuAmxPUidGufy0
 1Avz0Pn2gzMClHVgPUHwA7w8ZA==
X-Google-Smtp-Source: AA0mqf7Fr+hlU4ACIE/wbE6+CccvQNxVMBNeRpJ6RvXiJ9IIZcsq8kVQ7Lt9akKzqCQD5veG8hoJTA==
X-Received: by 2002:a2e:bc10:0:b0:277:11ec:ff2a with SMTP id
 b16-20020a2ebc10000000b0027711ecff2amr9288820ljf.163.1669198560808; 
 Wed, 23 Nov 2022 02:16:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a2ea238000000b002773a9b5898sm2162259ljm.138.2022.11.23.02.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:16:00 -0800 (PST)
Message-ID: <dd555711-7dff-faed-a618-353c8d840d9e@linaro.org>
Date: Wed, 23 Nov 2022 11:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 02/11] dt-bindings: display/msm:
 *mdss.yaml: split required properties clauses
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

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> Per Krzysztof's request, move a clause requiring 'compatible' property to
> the file where it is formally defined.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Commit msg could be a bit changed, similarly to previous one and we have
a tag for such request:
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

