Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6B5A24D2
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC1C10E7EE;
	Fri, 26 Aug 2022 09:48:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CCE10E7F4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:48:56 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id q18so1049766ljg.12
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=TkqTmoi1tOqF4HMRlYNheKD9nEw5Pj8tNzIuXeNE4iM=;
 b=EQFZJSsNvYyxtp06L5o2aPeIvRVgy+df9Ssuq4i0UbRzsx0gG3J3svHwlcq1PGwAi2
 mZFQbY1Ux3++T7kPhEQ9624nB9K/Fz2T6KA3OMO5pP7XWZdRncCgVt2RmvrRYRSGwX6Z
 VPQ5apGl40gAESdjsSBq5aIrqn1xoaQQ/wFCL8WnNC+u6rPD4r+JcmUCB503CajIhGKV
 k9yJqemevwFdM2hTJSrfc7xBWX32HBoqDsPGDjapISVnECAAPkTuHWH7PGUsmsqnzvLb
 u1d9ZWxbFPa7IqOxWL8YRp3S1toreSApRZb74+oIqCogDS5md9iEtlUlDYhbR1CRvuFJ
 V9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TkqTmoi1tOqF4HMRlYNheKD9nEw5Pj8tNzIuXeNE4iM=;
 b=sWEn6jDzzhfp/wofXKsS07MlDDETTAcgH6LSnw4X0tfvIKOEZxH+IZECPW5hkvXgYt
 5HSiKrPHcoZ7/NfiwQhki14rj/Qbd7qp/j822sra6SbulnG3SrQuqd4b3CT55LNpMpb1
 +cbdk0p8nWfnenfMIhQ1Z/U6fyTe6AZSe5x+h9LbY4acKchLwo44p3fX8+zOhTqDqhCb
 r0p7MHtlGHFv2gq34k+1wx+vIToRWh0nO/dOb6VcAsuDD8bXAr2/Q9jRcxHuyatJ8eYZ
 e8rcTDxl/SALKF0g4uW+Mk2O+51oN1ppWaNs+Nytt+h4EOMuJsLdyHg5ON4pe2Y0luWE
 f7tg==
X-Gm-Message-State: ACgBeo1Z1HVMOIjq/2AgzNbYmmFaMr1ZuTdlQzEkl/IJWZYUN88uGwML
 AM4nw7OnLbX/gt3MAWh9nYN8BQ==
X-Google-Smtp-Source: AA6agR6jczYcy+0sMAbwo/6hLXzTNzwXZSfY4M2/FtvC1XCFcvMDBDdf92yDw7Yko9914GrpUtyU+Q==
X-Received: by 2002:a2e:9b59:0:b0:261:d61d:5f51 with SMTP id
 o25-20020a2e9b59000000b00261d61d5f51mr1978993ljj.418.1661507335234; 
 Fri, 26 Aug 2022 02:48:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 11-20020ac25f0b000000b00492c1e36b22sm317540lfq.262.2022.08.26.02.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:48:54 -0700 (PDT)
Message-ID: <051c5463-77b5-cb29-a4d3-6b9645b365ba@linaro.org>
Date: Fri, 26 Aug 2022 12:48:54 +0300
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
 <20220817062059.18640-2-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/5] dt-bindings: display/msm:
 dpu-msm8998: add missing DPU opp-table
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
> Fixes: 6e986a8f1cf1 ("dt-bindings: display: msm: Add binding for msm8998 dpu")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

