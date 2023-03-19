Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B776C014E
	for <lists+freedreno@lfdr.de>; Sun, 19 Mar 2023 13:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9976710E126;
	Sun, 19 Mar 2023 12:04:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D4310E126
 for <freedreno@lists.freedesktop.org>; Sun, 19 Mar 2023 12:04:20 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x3so36705299edb.10
 for <freedreno@lists.freedesktop.org>; Sun, 19 Mar 2023 05:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679227459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oOFwXh6vZtC92bZGzjuIGNdPIVs7BRd69S29zualIkE=;
 b=uQR2XjGwTRSf/EIB5hGDYjQ35bm6+7HhgxNyyqkP7XjNB1b7/6oNrL2JXG5Z6uwNQf
 JJg+lgcEeM7gssCYgRebL6JhM8jOqa2PG4xGEsmI9JKaVk9QoJcdUr0CwKkU14wuazqO
 3ljFSsd6x0Sd/fL1iF+UMP9f4WneJdcJ/bDsJhWMMF/4dgkeIQgK6bMt4f4K2wxHAL7c
 htx1U3jtumILAa3qumfjgj9idqJrgrGzDhfs+yuNATEkUHkrUCCjJ1TARLO2KQ15aB++
 ZwV77V47EMVNQjcwhm1o5mTRTLpS8dmTR+FAcLLkncUJ9dw+Qp+DupT4MOgpLe/XTDGA
 nsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679227459;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOFwXh6vZtC92bZGzjuIGNdPIVs7BRd69S29zualIkE=;
 b=Swh4f6+SXY+YC1XcS4/+kte7UipJHp9X5S0VlhtayfVsEhgkYyy/4uFcruVEpvVwMF
 INg+/VcjNxECU6oCD+uxakjVKME8aLpKRMAA54e9S/2PL/cfRBD904NfljQpuqZJSIlC
 WR9Lg5wB9d89qwohflTg1BPzMQAtVjuG4Ao0A80pBPrCvm0wVkj3kp8CtTJ14mLAy41Q
 fAxSeDJBscv0B0A0ZHxHq18IxI/A+rTSKF7Xx337xjujA45o7ymJaZ00lkOKSelq0Dut
 1gm8ZobPcU+TtF6l78TYXWdHH+9bLKV9AF/YCRtaqzyznVbJrv5kKNOeekKbdC/WyCNv
 LUiQ==
X-Gm-Message-State: AO0yUKVW5YRJ89QuzKKtY69ekHxnvdN+ored+JZCvZmovR6tqwoWJKLl
 OQOFljD/O+rGUwd1b1vd7zIrBQ==
X-Google-Smtp-Source: AK7set9R/qYFVz69W0HqGLExknysHlO0roi/6WDV5hwj4pN19t6DqymA6BFC7JqA67tkpA97BsxpKw==
X-Received: by 2002:a05:6402:50d:b0:501:c0e9:4df6 with SMTP id
 m13-20020a056402050d00b00501c0e94df6mr872973edv.40.1679227459328; 
 Sun, 19 Mar 2023 05:04:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a17090681c900b008cf377e8795sm3176188ejx.199.2023.03.19.05.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:04:19 -0700 (PDT)
Message-ID: <9825ee6d-58b1-4e5f-16ea-2cb00822f147@linaro.org>
Date: Sun, 19 Mar 2023 13:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230307-topic-dsi_qcm-v6-0-70e13b1214fa@linaro.org>
 <20230307-topic-dsi_qcm-v6-8-70e13b1214fa@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v6-8-70e13b1214fa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 8/9] dt-bindings: display/msm:
 dsi-controller-main: Add SM6115
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 18/03/2023 14:42, Konrad Dybcio wrote:
> Add a compatible for the DSI on SM6115.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

