Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DC568E4D
	for <lists+freedreno@lfdr.de>; Wed,  6 Jul 2022 17:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6811B24B;
	Wed,  6 Jul 2022 15:53:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9F11B24B
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 15:53:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d12so3319472lfq.12
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X7T59me0wj8EL8IWcKYPdBXPVV7Xe/PyIIDPA9tAhFM=;
 b=dl4RsWOOioDPEEZSV8Q6d1C3NeXb2s6TuE2AtCTvg1n2n6/6YwKz2nxQSaM9tjfRx4
 hayZOC68rIk7ugJTK1DzmSsW6EQJqgtKirrG4qYdZ/XKCjidBQAJt8OVMxX0hOko2Yjw
 QOEQhj6uQKEJBMR6hkkKGUzYR0dRjysM309Gm6zgtiGXVtHLdPrIsQMf1rJrtyulksaX
 0hPPbXPYnYCMQqlEtgabfJUdZGrLNLHxfgTzJFo73d+jRerPsesaK7CXHqsLf83WLseU
 V4VFhxLkQLh5PtSecTxnpY/eHIKb6ZbTuDhAbWf+/BEG8Z+Wx9yCavzKM1Y149j2SZHd
 mfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X7T59me0wj8EL8IWcKYPdBXPVV7Xe/PyIIDPA9tAhFM=;
 b=LE8P59fbC9lSc2eqEpjlzkZz/fL8rUhCPO5EW7bJM938cgo8AX4BR5VZDeDLkZT/QE
 lB2CuvYz6946MgMeKR/GSSZnQgP2EJi7tzQZuusPMFnbe56gXm4peGjVpIFgcKxWwGUS
 8NZsGuho0Th9kJjT1wI+Edujt4uSgTnUm1Nm8laFwz5TX5DCScdjRe5VshkPj5MylN7d
 Zavmc4EwUr+KoUMCFyIgnvN1FXzRDiAMklY9gRenHU1DsJcgdMcjNDcbJYzHZphceW4t
 fjlVjuXWgf7nXNo/W00lvRNkg3ciCnC1nRd31tcrJritWMfjfK9W98enu93XpBiXt4Rq
 8TAA==
X-Gm-Message-State: AJIora8/CgZY+u/IyHRfzhyHoCa6xmNCV7E0ROT58i4/2bcXylv81v3m
 1t3LPld+RNzVBHXA8iU5D62iCA==
X-Google-Smtp-Source: AGRyM1v3k7cZraOuJLcFdr4BGuOWAHZA/5OiHqQ5QQb46JslGgrl4Cflu5asFPXT2Tam6Cs/eLAhpw==
X-Received: by 2002:a05:6512:2210:b0:484:f174:bd51 with SMTP id
 h16-20020a056512221000b00484f174bd51mr4617778lfu.482.1657122808976; 
 Wed, 06 Jul 2022 08:53:28 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 cf6-20020a056512280600b0048724eb8cffsm211734lfb.255.2022.07.06.08.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 08:53:28 -0700 (PDT)
Message-ID: <c23149f3-9070-8727-e30a-4a7a82794082@linaro.org>
Date: Wed, 6 Jul 2022 17:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/4] dt-bindings: display/msm/mdp4: require
 4 IOMMUs
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

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> APQ8064, the only supported mdp4 platform, uses 4 IOMMUs for the MDP4
> device. Update schema accordingly. When we have other MDP4 platforms,
> this spec can be updated accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
