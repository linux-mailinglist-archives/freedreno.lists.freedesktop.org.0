Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93E9543089
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FB410E759;
	Wed,  8 Jun 2022 12:37:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5977010E759
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:37:58 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id kq6so28156260ejb.11
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NHIetuJMCCtxZ99NkRHS0VtGi8XQFFhwLSYL0Z9zvSg=;
 b=XxfX5E6ZIq2gg6arJxbd1VWHNHNd8ze3UjlEriuPNrOGHnYCMI7mah53xfcVh/aSdg
 7GIAQ4LI2gGc73+XLyIiv0n64nTwuGbgCLsYJylmxNDVAoOsBdgSRJPsjxms4wbv4A4/
 Iyx111eTK9xZBykGyFKpj/gc8kVV2FEhq9T0r2gmeIUHzkisSapdLi4cAiNl1f7L0ArE
 A37xUGJmxX6yhEKaZ8o7HZe5fbdNAldU9F7RrdUX/NPPlUItlCszUk4ZbeuWH0ZVa8SH
 iHrjM4Jb91fb2BKRbsoIknZb1lIptQTJFZowbZUZOmw1HWFUdxognHXvYLe8z9zkrsyF
 NiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NHIetuJMCCtxZ99NkRHS0VtGi8XQFFhwLSYL0Z9zvSg=;
 b=18ZGWMptQ6DKFHSeGCmlUDS1cYZ0XcpFAT3y7gzvX5SQqu5rQbd4BHKLBrs9WdCiRl
 8F7dUyC966YAxXRVq8Rzi7KNT/aJXKyXbpmlrN6jZ7FxwvwPaOmJEgc0b7xy2tXFv6bt
 DARKZta1SiXYQmKFo2T9zW5OBx/hDftkA3F4OUcC4U137C8FmUYiUfWkLbQbh++9hYLs
 2gxE1HxyS6hM+UBo1ITDBvtBpueyWUT1JLcb7+TqNKPh6UddfcbPZfVP6nKEsLmqx6UG
 BQHppWRAvwH9EfZAiZnwUbNuYlYG0UnQimVgwBaY4QcChU20rf+8tDajgKgp/aokYdDB
 w12g==
X-Gm-Message-State: AOAM533mhuKAz9Ch+rUg8UJiGIzTwJOnwALHQY9Ps7v+7RkmLu4c6Ev/
 Cm8RbR6ajby8LZfeS+BzHF1/eA==
X-Google-Smtp-Source: ABdhPJw9TCJr3FEiqfRvqPTVN3ZNekIiUPP4dDLMm5LkpOs1Bj7RM6hndPutXi1h9Rha1wG0AAaRDg==
X-Received: by 2002:a17:907:1628:b0:711:e3fe:50a9 with SMTP id
 hb40-20020a170907162800b00711e3fe50a9mr6738850ejc.746.1654691876853; 
 Wed, 08 Jun 2022 05:37:56 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05640207cf00b0042dd60352d1sm12304001edy.35.2022.06.08.05.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 05:37:56 -0700 (PDT)
Message-ID: <1abaa0ae-1080-1f78-70a8-6d263ded94cd@linaro.org>
Date: Wed, 8 Jun 2022 14:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 02/12] dt-bindings: display/msm: hdmi:
 mark old GPIO properties as deprecated
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

On 08/06/2022 14:07, Dmitry Baryshkov wrote:
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
