Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442865552F9
	for <lists+freedreno@lfdr.de>; Wed, 22 Jun 2022 20:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7B1133FE;
	Wed, 22 Jun 2022 18:08:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107E11133FE
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 18:08:39 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id q9so2334010ljp.4
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jun 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YYOVza86qJ14cSLpuOVf8g0H0wsocOlznH9bAfGGaxw=;
 b=PKyLAriixe9E4ti02dlcBihreBCiDlDIyYUbwbqrQ80mcn+af+bhNahW6lNsGTayD3
 J27iq5UCLFANnCtAGRRWtDYzS6FEox/9W75kUPwSGPTyBXku2DVcMxFU1Wi5IsMpvfCU
 E8m++fQ873QasSbFL4oaDe6Qy+AfLFvN8eNbHFv+/O+HW1glFRayCJItG/b7IIyMdAQM
 hfPASZFxucjPOV/w+O8dQcLtESFvfSreJD18JuKz7VGQDjNmNZj37ITIs1MNzGnKHHeS
 hnsas55iXcuROPPbICg0kl86ic+iKVSp/MiR9ETzL+nriHqBp8qeQw0iEt1KMKq/w0mZ
 vZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YYOVza86qJ14cSLpuOVf8g0H0wsocOlznH9bAfGGaxw=;
 b=VkRKhFpg2QbWnVyZijRTBe/rizSyrclrVjs2isJek16CH5OtzgI6UpaMSSU/uvnfs1
 0EFOGCZsHfDkK+jZL5FMPRrjK6R/PqvvYptGhrZZk5VrsYzxlt/VWpTfbzs9NjfPweCP
 EPvsRUIkd4EL3iEYERzXrE1NVzOHZ5bDT9T7wuhFjWwhzY6Bt83Z8xWSjvnxbfvKaakI
 3oV0mChihkeZHdprkCYrPUWUyenXw1qe+ESPqXKabSrPBhyuOIMQK4omvd9jbySAZow6
 ldKZOzt3JFdue+jHSxEwrCb0pKhSeLasOjcHqza1PVTViFRvpKr95wkSrPq9gXMaRzfL
 AVxA==
X-Gm-Message-State: AJIora8ChF18M7dveG2/Lk9KQNcWyB3rRc2QwAcVRrGmsqDMXdLGpmCT
 CRKdWDRsHR7vMpuPfBZw4G0ynw==
X-Google-Smtp-Source: AGRyM1uhQxkDu4CTbNs4cg12dNZuoExse8UIX9Yk4z3BH/MUJryNDchCf5y8fAWed3JmdHP+Tl//LQ==
X-Received: by 2002:a2e:b8d1:0:b0:25a:8ee9:86f4 with SMTP id
 s17-20020a2eb8d1000000b0025a8ee986f4mr553926ljp.480.1655921317316; 
 Wed, 22 Jun 2022 11:08:37 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p12-20020ac24ecc000000b0047f7419de4asm1158515lfr.180.2022.06.22.11.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 11:08:36 -0700 (PDT)
Message-ID: <687c302f-6f7f-a43e-de19-73b42b569d64@linaro.org>
Date: Wed, 22 Jun 2022 21:08:35 +0300
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
> ---
>   Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 +-

This patch has been already accepted. Why did you resend it?

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
