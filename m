Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809255552D8
	for <lists+freedreno@lfdr.de>; Wed, 22 Jun 2022 19:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AB110E0F6;
	Wed, 22 Jun 2022 17:51:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4149F10E0F6
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 17:51:43 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id o23so13162974ljg.13
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lyHjNlGIepIT/t3IaYDnRx3eF0Wl2lezOvJ866alVNE=;
 b=phpEogNR2Dg76Apl+C0m8n/9gUnfdkc6rnmv8hg35SveC82wohLJms9nr8qUFjSTrt
 4Wqhfvb7TrbFI0PccZBegFGbM6GWr4WH60OyCtbhsxjLU5Gc19GKXWPP4ElsqfSX70r4
 GI8QbEhNgxtYK4Xyzgo0aD4lxO8yoOXSP1ERqgttwcWrM9LBVriiDKrg6TWygQvTAYD1
 gwUXdUJl30pALaY/eKtcdJDLVMhcpnDNUTG8kt/basq2l9yPy5n4cAJPiHRVjSyhApU7
 AIhFhue8YAUjo6mD/YxRMnzlCFrk8+m/fUb1RIXRUrWefCqJsAgGjAgmDmmRQZi0niT4
 eSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lyHjNlGIepIT/t3IaYDnRx3eF0Wl2lezOvJ866alVNE=;
 b=Wi3aD2bo9MsX6ozpLt9wSV/E2PCrp2DmCZy+YTanBJv24QvVcMt3D3UQVKKO52JvMS
 semRKRoZNpySNzw0hzOgcLZSDobQOabfy+4HCD4KqFK88VHKM3vF7VjFX2Gjp506kghF
 iglwaOKibZ2+rjHqCkuNh8WE72tNW74G0vrWWL0SY8jJcvD+UeWHZyqFTMGW0QD7Dt9e
 dTT3eqajp2u48jH/ePE5XkHQknwW6bcdIKYB4yXCbDFiPAAgMuAEyQ3zCAn0GMYbEC9H
 9dPPZFxtObRR1JOgHSzmF5ppZnTq/OSP3XE1hz0fgN/0C/u/MP1nclLwfl/XRCaD222I
 16fg==
X-Gm-Message-State: AJIora8t8ybSwnFMY40ZXSBB+XKy5VF9e0mOpujpFSJFaRKA4PqhCt2J
 AALsqDJacTjHMfu8rjbf9fsOXQ==
X-Google-Smtp-Source: AGRyM1uqRH0eeNtScZfg9vgahrtzqeNiUZh3ZaiXJFRiWQWm4xvksCJ8mnE2AFxPxob07sW9BfcD1A==
X-Received: by 2002:a05:651c:211e:b0:25a:88ca:d766 with SMTP id
 a30-20020a05651c211e00b0025a88cad766mr2448216ljq.230.1655920301613; 
 Wed, 22 Jun 2022 10:51:41 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a192d01000000b00478fc20dc88sm2628594lfj.73.2022.06.22.10.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 10:51:40 -0700 (PDT)
Message-ID: <54ef4527-bb30-c7c6-ab74-0a2557c763cc@linaro.org>
Date: Wed, 22 Jun 2022 20:51:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1655916953-32039-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655916953-32039-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm: update maintainers list
 with proper id
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
Cc: linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/06/2022 19:55, Kuogee Hsieh wrote:
> Use quic id instead of codeaurora id in maintainers list
> for display devicetree bindings.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index cd05cfd..c950710 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: MSM Display Port Controller
>   
>   maintainers:
> -  - Kuogee Hsieh <khsieh@codeaurora.org>
> +  - Kuogee Hsieh <quic_khsieh@quicinc.com>
>   
>   description: |
>     Device tree bindings for DisplayPort host controller for MSM targets


-- 
With best wishes
Dmitry
