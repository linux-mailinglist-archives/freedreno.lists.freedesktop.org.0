Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E436F4BEC
	for <lists+freedreno@lfdr.de>; Tue,  2 May 2023 23:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB7F10E0CA;
	Tue,  2 May 2023 21:14:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF95D10E0ED
 for <freedreno@lists.freedesktop.org>; Tue,  2 May 2023 21:14:44 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so189251e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 May 2023 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683062082; x=1685654082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9P/QuNBKbdebYLBwYAAK30MQzjSHHu9hFYcUK5a+Wo=;
 b=Y7pfv34sFJP6MWFNCCJy0saWVM3tcTkdqa3e2k49N7RTtCj6ZRniW07nCohVibpv1C
 5hMu8/cg4ksSvGHbwI8yupZJcRWPzENrThdeJla0/+ZF2ZoJAXVJVCFnBhtGvklVZViX
 /SSr1vdmIHP0QsEUxdiXl+/Tfc54mF51TNLIjiUHTOz6tflMtaFy6atWOgd0eP3vXyT9
 WJ2MRm8JH3ekjc/nip9C7WajsH3R/XAGTAxGjR4FQVn1UV0zWF1een8f1Cx2QT9hiQPw
 K/MtSeZZfNjH3TPnB6PLTANB7Kfl95zi4MgpxCJxFHd2lILA9FrS288EkwFapNBJamw2
 7lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062082; x=1685654082;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9P/QuNBKbdebYLBwYAAK30MQzjSHHu9hFYcUK5a+Wo=;
 b=DaZwcrrOh8a3yKW/LrglGGdN3Pn26jCKBn4jQVcgl01A/4NbPIM68mp/m+yN8AvCGy
 QZxHyHfVj8TK9WysuBCI5X23sgmWhC4/l+o3mjpOCaORKbekm+W6RpjVfkbsjxzO/z4L
 YBiPUONEyxkrMLlJ0yumrIP80+59yuGVILUbWmnMVO1u+iAZ2vcXbHyz4yqxzoWotypZ
 KGCs/B5znKTbbnmIsPKTF2R5eGMa/o342Jes7rnAQbF3GGu6uZ2983v87qq7zR61n8DM
 yGqfubtReM7zivzMYWlQZfrLnVMMqAiA3YsGn/tKSisWpuLsW4dniHleSVaAzpzJWu2H
 zXKw==
X-Gm-Message-State: AC+VfDwGCziI0FrieBoYYYLenYLXucculovP0sX4vpIjaMjK1LBUB11t
 G++B1g/AZTn36PD9yLTl75GFyw==
X-Google-Smtp-Source: ACHHUZ5qr2JMQgQ5x+vB+uEOUaiH2Lbv0PJnfjAWkSZJHxdNrTgNtmj9+eGDkM+hqw97nhQaSXfd2g==
X-Received: by 2002:ac2:46f1:0:b0:4ef:d567:4854 with SMTP id
 q17-20020ac246f1000000b004efd5674854mr307075lfo.11.1683062082451; 
 Tue, 02 May 2023 14:14:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a19c519000000b004eb4074f40fsm5573686lfe.241.2023.05.02.14.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:14:42 -0700 (PDT)
Message-ID: <e36a8034-605d-1f78-95c3-1c85689e2256@linaro.org>
Date: Wed, 3 May 2023 00:14:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 0/7] add DSC 1.2 dpu supports
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 03/05/2023 00:02, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from [3].

Changelog?

-- 
With best wishes
Dmitry

