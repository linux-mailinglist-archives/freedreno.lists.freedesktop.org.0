Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1ED3F7BBE
	for <lists+freedreno@lfdr.de>; Wed, 25 Aug 2021 19:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93826E3F7;
	Wed, 25 Aug 2021 17:50:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2CF6E3F7
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 17:50:58 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso55882750ott.13
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
 b=KQ/HOnYdFw+ZF7qnp9jzF+z2MCLSv7IKlKnFCKpkaTpBdl0IV/CWYsbPjRASTs3VWj
 C8D+/SNYVY9IGiA27L3o8j3qjmjjMV97Yu49ksmzJ38yL5BetbwX6MhIAwcJao+hAYSH
 jTyNQJKSx3VVVhDdnWLkrTjoCNTbzOFv6mOCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
 b=OYH9rw/ij9mc4Ysp2am3tSJ6mh35qUzedxbo+ShD1K/khV8OHWB8jwkXASgqpCp8mb
 7aKXy4F+eNolXhFDCvzpgez2bU5FRxgmouXA6uuEV0SConpmum1M41v+LEgb/DwSKO+k
 vmjaDUraU8/eXWe7rcsskK8kvHSkZM+GswB+BLGd0I2liHrGJw/yI/EO2+uRhZQ5/M7c
 LBwRip63GOdaGYEEhM4b7xBKhVwK/QojgAVfUuKdoqEnT1yEFP9qPucNX46fo1OekxuO
 34degpLcD59ToC8SMPjLYYinIihUWHno01B23Ja2zvRiWRhLBKUJVQ4sjCp8HWb7yLsz
 8HdA==
X-Gm-Message-State: AOAM5325IZuhOo2p+tISPrIGYKlskMNhEjTwl418G11oiIpC0BK00qJW
 jkClKgK+Iqu6iyNmEHEkrSnSCL13gdbTbR4P0MNxUg==
X-Google-Smtp-Source: ABdhPJymKW+Q9r5NjGs3NkVet38E9V3EJHm+kKtdiXNkSMyDOfTN6qr7Dk5rQ6mPq/5GfCmqKJ5umNsFLQNCvxojzg8=
X-Received: by 2002:a05:6830:2b24:: with SMTP id
 l36mr21464418otv.25.1629913858077; 
 Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:50:57 +0000
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 25 Aug 2021 17:50:57 +0000
Message-ID: <CAE-0n536PraSR4oqGNtxcDnR0+H-N3eQTpsgTt84oU3NAXEjeA@mail.gmail.com>
To: Sankeerth Billakanti <sbillaka@codeaurora.org>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, seanpaul@chromium.org, kalyan_t@codeaurora.org, 
 abhinavk@codeaurora.org, dianders@chromium.org, khsieh@codeaurora.org, 
 mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/2] dt-bindings: Add SC7280 compatible
 string
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

Quoting Sankeerth Billakanti (2021-08-11 17:08:02)
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e..23b78ac 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-dp
> +      - qcom,sc8180x-dp
> +      - qcom,sc8180x-edp
> +      - qcom,sc7280-edp

Also add qcom,sc7280-dp here?
