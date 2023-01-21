Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CB676526
	for <lists+freedreno@lfdr.de>; Sat, 21 Jan 2023 09:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AA910E1CC;
	Sat, 21 Jan 2023 08:47:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F234F10E1CC
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 08:47:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id by7so6992397ljb.6
 for <freedreno@lists.freedesktop.org>; Sat, 21 Jan 2023 00:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTId012Gt6PWvQonFnbk4YKgwaLEuR7guf1cpuZhcdc=;
 b=AvgoHUPeLfhtPkFAC32ZIxPPeDAQrZNhLRXrU9i+vt0sIJ6oaTdVlE3k0HBG1RhBi1
 yDzh2lvVWzp8wsxQ8BVPd/hQJhGE608a3K068rBapLfV1FrreS4mZcCk69/C1JSB0/Ix
 Hkp2jQPeUr5iV9iE/J+u7gDBZmqJJoHsHjxNRAFHwi1NOlJphpe35XsvZorPk9E5hBD+
 QYtjG19EOAqTkp84BN4naMakh3d0Mjss1n5Eejmk5AWaFQIVqYhdodAdWj0bbjh+Oyyz
 oUDgdc5kbSbDGQLlUEG1rcGRJvHF3DFmkbd5wdUG9S0kEB+Hx3uC9KpDUucRDK+koy0L
 4E3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTId012Gt6PWvQonFnbk4YKgwaLEuR7guf1cpuZhcdc=;
 b=ZNVN2hiIvC09t/ceYcKr7lBG19wx+IjGh2ClfGUM2kPeFxX/BvUG0Nhvt+Ax6AR7Gj
 1+cq1EC7vDWXTDYQg6tCiQGlH5TRDJ53oxEtELtFeoT9QJ8mxfNd7IaA2B02PjPZzN6/
 F7ftIG7ZK7a3X4CeLl5cEiruW62bqxsfp9Ffk6GXICUis0/cmHdilqkdzsm9nq26sdVt
 q021D5hl8e2nArbRB1XJ+Hcz8P+EFkpWvr4GczwAl0iZif9MBlEqLFsIY+wjr7vfLjYp
 7kRu9WtSUj+CqGHmeIcuEkjiTxjlqCDT0RAFFgtnSAMTgEysJj76rj/p6xLt7QBEhZOI
 RRDQ==
X-Gm-Message-State: AFqh2kqg/InMppS5nIsfNHHPYdO4iOvjaemqFN0Twusxj5jDLkXZXznx
 xo/hV1Ebk7i4GZpHo0mx0tEMcw==
X-Google-Smtp-Source: AMrXdXur8w/pIdAGPL8mUMuc7WdalL3iKUhClyPKVUXZnlyW+pK+ZV5CNHrDP+Xayp5Gis9ElJ4cxA==
X-Received: by 2002:a2e:a22b:0:b0:28b:7a74:15a4 with SMTP id
 i11-20020a2ea22b000000b0028b7a7415a4mr5098563ljm.12.1674290819340; 
 Sat, 21 Jan 2023 00:46:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 be31-20020a05651c171f00b0028bc41df604sm448646ljb.39.2023.01.21.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Jan 2023 00:46:58 -0800 (PST)
Message-ID: <60f2da52-a757-87ae-5333-8275f98c986f@linaro.org>
Date: Sat, 21 Jan 2023 10:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
 <20230120210101.2146852-3-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120210101.2146852-3-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 3/8] arm64: dts: qcom: sm8350: Fix DSI1
 interrupt
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 marijn.suijten@somainline.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/01/2023 23:00, Konrad Dybcio wrote:
> The interrupt was wrong, likely copypasted from DSI0. Fix it.
> 
> Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry

