Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78217635987
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 11:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3410E1FB;
	Wed, 23 Nov 2022 10:20:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CDD10E1FB
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 10:19:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id c1so27480922lfi.7
 for <freedreno@lists.freedesktop.org>; Wed, 23 Nov 2022 02:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wcEhC14eey3OipJGC9PHGuhf2ZSRAQeKcc070wSp9zY=;
 b=OhLsJ14k8BHQ1JtpAx3RrRI1Q2lSGUnYsZmc8eVrkbyY78/BKyhu17VAPG88/7B5dw
 pYwzWBH0VXGnTGKhdxCm/PNaOrL6QqXndiR1Q7FIDWRduIFzdWF5NW66V0mKBUt3qXVX
 CBaypwxJedKzhtJamJQSziV3Ihx2i2BbVS8bMPrf5OTbC05CzsjXRzbn9pmGqlyd6ySJ
 +LhteW5RTbkyttah/UkLfnn+2btK/AQye/S9rYdKlUMS9yETgC586giPa9cdw0iUy+Ex
 4x/IyroFjpQ4rvn7lz7iMBmkQnz/3TuBTH6UJoD35YuryKavg+7GiUR3JVwkO4MF+C41
 cjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wcEhC14eey3OipJGC9PHGuhf2ZSRAQeKcc070wSp9zY=;
 b=n+IgAEXe7BcTFR2byKQzXM8oxJcjJxRRESOePZnV0OL+HYTDccQlqM/3r0o8erO2H1
 eQH4e5u84zDIR+6ML9Lz2ymubxjptOQY8vcGI2DRqwP+mZkmbn9pJ00LWCq5KPhgyWVx
 Uc7Hw4wihDQme03JjOMhknYgKI6ihwsQFAogorlRgikJQ9SUN28GzOos2wBYhmZ9BAS3
 vkoFsbJCk1QHLTXcSmoCviBzp8rPrr++dT0Fp72jNhKjG4oNmdFBDr8ZObq3madVv2MP
 VZ20i6fn7Q8wmE3RLIzHvGmqUyfGCGov9UsOykAaDzYHTPrpl0e1D9um7LyeSAu3H3q8
 iKyQ==
X-Gm-Message-State: ANoB5pl4O2+HDUxEMOeByTL+YvhTokeRLdSYYmYXXuq7tpKwbDej7XuE
 N9kbDXm3+7nOtuBPX4wjSJmeZw==
X-Google-Smtp-Source: AA0mqf7Fnoiose8tFgDHJPcjMa7kbY6JJPrliBCN6rODrYiAtw1SYLXAF1GyscHc7BCxjfjeCaiXrw==
X-Received: by 2002:a19:ca4e:0:b0:4aa:bad8:9b5d with SMTP id
 h14-20020a19ca4e000000b004aabad89b5dmr9027202lfj.540.1669198798258; 
 Wed, 23 Nov 2022 02:19:58 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05651c10b800b002770473d813sm2083037ljn.140.2022.11.23.02.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 02:19:57 -0800 (PST)
Message-ID: <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
Date: Wed, 23 Nov 2022 11:19:56 +0100
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
 <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 23/11/2022 00:12, Dmitry Baryshkov wrote:
> Mark clock-names property as required to be used on all MDSS devices.

This we see from the diff. Please tell why you are doing it. In some
other recent bindings we dropped clock-names from required, so this is
confusing.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +


Best regards,
Krzysztof

