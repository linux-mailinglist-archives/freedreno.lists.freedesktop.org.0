Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C759CA0E
	for <lists+freedreno@lfdr.de>; Mon, 22 Aug 2022 22:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5116A220B;
	Mon, 22 Aug 2022 20:34:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19633A21C3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 20:34:09 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id be9so8947071lfb.12
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 13:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
 b=MnkO0GK7zPhGQTTU5nw22JzPP9cYth/4/+c9bbtGBTRxAlXSdkDkEvSNUvm33QL5t8
 lh4V8HDA8GJw9DsqErxuEZxsOWEDElCOuEvrTQ8ApAHvDNqbm59AvfwlaHzhYTeulNWD
 cVLULTK4JVItAv4cPkixwjXDi+ZNr7lBjMMyOIrwVQhgApjnpK1NCiStUIYwHLmIFY+N
 qCru4TN8N+SMWvE1C3787wclJFRAAEO7GYowJviQYOiGIdgUUM5xbzhVVHgnBGWd/Hr+
 L6kYIDRD6ZbrYauBfF6bREQLbSdCCIaXmvg4g8oU/sngSa9//hAjP2d2mokpGgsrQfp3
 0GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=n+5KOQrd1zcRYfj9IdOVX1teuqbwsnScpQd/P5v+XSc=;
 b=B8RhRx+IBRXFGM1F7wY9hdoiZnVnC0ck0LsSI+TP9w9+3lSSLR1+mUuGf1PGwFmOqX
 6q46HxHMAyOa58lGpDk+f0tjA6IAmVnf/eNIE43GIOL7YnmaVhKjhy8Jusg/cYIEFPnI
 zhQJHPKvTqF+U1qMLqIAiXbf5rA/A33WZDVGag+w+BZw9HHyD+ysjnfzyPWm8Sjftuq5
 XJU7+nerOhrFXI8HCs14fV5sifTl/137hPbFqQMSRVmD+NBblTuDLunrQV9HdN5qG136
 Nli5Ks4hiYeiu/AewtiGWWRTklYbjars8JAYO9drjTYDs+aIjmw/xyR5J28e7aelBvym
 xCEA==
X-Gm-Message-State: ACgBeo24p9QMNxI9SRejsUVWtmzaOa6geU495GIY/Z1j+37Oz2i9SNPE
 gpz5H/VhnerAj3VPklGjHxBwCY8Nw3sieA==
X-Google-Smtp-Source: AA6agR753dxf3W5qo9qPUq3jDVTHWl504cW4UYh1AEjc/sllgbZkCbVKuNBo4Z3dcTm6sKBfN/fDrg==
X-Received: by 2002:a05:6512:1583:b0:492:c028:d2f3 with SMTP id
 bp3-20020a056512158300b00492c028d2f3mr7999834lfb.216.1661200447407; 
 Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05651c128d00b0025e4c560475sm1991849ljc.96.2022.08.22.13.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:34:07 -0700 (PDT)
Message-ID: <e13e644e-0f18-b338-1068-e4405def3c6f@linaro.org>
Date: Mon, 22 Aug 2022 23:34:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-5-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220810035013.3582848-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dp: Add SDM845 DisplayPort
 instance
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/08/2022 06:50, Bjorn Andersson wrote:
> The Qualcomm SDM845 platform has a single DisplayPort controller, with
> the same design as SC7180, so add support for this by reusing the SC7180
> definition.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry

