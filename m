Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A71EED48
	for <lists+freedreno@lfdr.de>; Thu,  4 Jun 2020 23:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE516E5CC;
	Thu,  4 Jun 2020 21:26:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1FC6E5CC
 for <freedreno@lists.freedesktop.org>; Thu,  4 Jun 2020 21:26:58 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id l12so3918099ejn.10
 for <freedreno@lists.freedesktop.org>; Thu, 04 Jun 2020 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WE1oe2yB5oVKYeXtakXr0zKpVIUuuVPE1o8EvQmvAgo=;
 b=MOfa19HtKuS1dBbVo7y/trtcUwipqOZV+Kcw2wnnzCFXuRDwAZJWnmNidsfNqKrhkx
 u38R3tD071DTiHuqoTAvaOwm34eIju84ayw93sVyeF+bHFsTuUr7CpnQynd6uWNH655O
 8avch9SwhLtb3xl5M7p4Jc/npv2R+TqFxSaRxpBaMWW/vpHU8TwpaHnYJMl5XfrXoUih
 Bi+0tNXvYRlLXGuoGkNGhr1b9khG9vGFYjwWS3q0n1+7GwZYgLG6tE0j6l38Jp7pC7UX
 dw2mUn9Ba8Bj8cb3xS5HzNcjwkBin1TWA1GblANMc/W1lA7ijjzE10YTqyGs0DJOxoZM
 Ko5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WE1oe2yB5oVKYeXtakXr0zKpVIUuuVPE1o8EvQmvAgo=;
 b=dTEoZFHuNq2i8WWbSEggelSJiicydyRpWuUDM+YB+Mk5Wx/2LVyDO5dPkzGtGHUzum
 oK8+v3MVxu5SPQa7UGkN8EyoSoMdrar2ufcolZzhw/J+llw71q4UmF+C/1Qe7vQo8BO9
 3wwsXOvtCcVMgrPuhRvQf8o2I7KnlZoc4B9/A7csrqpzobKrlKMKFxVtZOnVdkX/hsZW
 COF3lsFH8MxwQU30Hv1T5S2L9i+jxDn96jkG79Y+GFys6b3IQhnCg/D2/ugL8v1fINsk
 CmbnlAXW2vFfMBbr7lhRwwkgO+nhGBT2hG9GPiQqI7zjxy5/T9VKTYm+cjn59+c8QMTp
 t1dg==
X-Gm-Message-State: AOAM530/SHUbis5OfJRXO7NfmXg711HonXdQtaPq56a3Cnr83wBi7r51
 OxZUK7LH2TAYeLeeCQH9s8heAHorZXWp9pC6Vv0=
X-Google-Smtp-Source: ABdhPJy16zksl6Je748Tu/2bB0Pl9iDll7SpFPWhZUcw7BNspDhhcW4cw9AdU0+h0JLBpdnXeoM3Pm/krMB8v+T7THo=
X-Received: by 2002:a17:906:3bd8:: with SMTP id
 v24mr5183395ejf.231.1591306016754; 
 Thu, 04 Jun 2020 14:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200604205710.3167-1-jcrouse@codeaurora.org>
 <20200604205710.3167-7-jcrouse@codeaurora.org>
In-Reply-To: <20200604205710.3167-7-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 4 Jun 2020 14:27:21 -0700
Message-ID: <CAF6AEGt4N5+0h0fkrO7m6KD3VMXkdoFyhN5Nz72DcMjoHX6XWA@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v7 6/6] arm6: dts: qcom: sm845: Set the
 compatible string for the GPU SMMU
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 1:57 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
> split pagetables.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8eb5a31346d2..8b15cd74e9ba 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3556,7 +3556,7 @@
>                 };
>
>                 adreno_smmu: iommu@5040000 {
> -                       compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
> +                       compatible = "qcom,adreno-smmu", "qcom,smmu-v2";

Should this be something like:

   compatible = "qcom,adreno-smmu", "qcom,sdm845-smmu-v2", "qcom,smmu-v2";

so that new dtb still works with old kernel?

BR,
-R

>                         reg = <0 0x5040000 0 0x10000>;
>                         #iommu-cells = <1>;
>                         #global-interrupts = <2>;
> --
> 2.17.1
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
