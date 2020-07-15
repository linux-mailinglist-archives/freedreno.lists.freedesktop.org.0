Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A822143A
	for <lists+freedreno@lfdr.de>; Wed, 15 Jul 2020 20:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B836EBE8;
	Wed, 15 Jul 2020 18:26:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67AD6EBE8
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jul 2020 18:26:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id bm28so2359502edb.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jul 2020 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
 b=uEvZT5ws7+T1jnEVo6h4JbcKv8hKOxVCiJq7OPNIAvwfhDPmyGLsLZHzlj3+UQdbDu
 AJKToPAaUqlIXFAC4vBVNmIbeFB8QSK3UYuQk68sX+Joam1O4wNo/I0UIbhcua/xk60a
 e1JadHF+95xJiCjkb4BPqj69zzhrMH3vOdDr9/57zwNbf1j0o51CmK+HkV8Fnv1oh3mq
 dsHG/eup+01xytoaipZGKywOhJg0gANnXIIwUNiURsyiVQoE6F3fjv5GsM9a4ECmV1Zu
 nsh/4VmIRcvcEWOFyXfYT657uKLnIh76SWifvHzJigNGdoc3EB2Y3w8AuF8RT8CkFJo2
 ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTQol0VmjKmBPC+M8imaYKdXV0XGdfLv0rh0VWky9EE=;
 b=dnLdQFesS1RY9/jfkYZB4C/Us7/r8RWExrSQjo5dM3hF7T++IhPk9sBdIHl+uOJB24
 +SQsxC8lFeglyPNWoWS6NZvEhC4FI2X7A3Ln4hrI4pojvRX82ZYucLxckann92rPbxQT
 vunhPls6p8/yrUsNZ51vhWbFjRp2sNdQq8hB0V0yWRNAEBQXGcrycE67LiKaXhCIgY1I
 Mcvxwzu4iNLiW2zspEepvV9nj5Sc5i4L4vorewRMn9s6Ov6juMOOz3j2cBaIofX21Vtn
 5FaG5rBE628Xck6xWSQU9P5iCTLHAB/JLXTEEQagi+ifsMTrHI+RbvjfKrpQBmGMlYOw
 wNYw==
X-Gm-Message-State: AOAM5326p1x7kvNVdBsCkIi/mPtiq3fn0fGNLJsnGUfMDOR9pird79DJ
 ctfkgrObexE6rEKpPOe+8RP3uIqLSR0kiHdkwm0=
X-Google-Smtp-Source: ABdhPJxLqEBMfJSdn3WSobb0Oqp5l9KTaKAbyXt1aXJeFG4g+SFo7Aq+S0ThjrslTJ53COSNmM0KR2c9PV+YQEl8Ctc=
X-Received: by 2002:a05:6402:304a:: with SMTP id
 bu10mr915071edb.70.1594837598280; 
 Wed, 15 Jul 2020 11:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-6-git-send-email-akhilpo@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Jul 2020 11:27:11 -0700
Message-ID: <CAF6AEGs9Ei=MAhC=OOfxHvw_AGeF25LTCrWLzxB_kGN7e2PgNA@mail.gmail.com>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v5 5/6] arm64: dts: qcom: sc7180: Add
 interconnects property for GPU
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
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:42 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> From: Sharat Masetty <smasetty@codeaurora.org>
>
> This patch adds the interconnects property to the GPU node. This enables
> the GPU->DDR path bandwidth voting.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 31b9217..a567297 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1470,6 +1470,8 @@
>                         operating-points-v2 = <&gpu_opp_table>;
>                         qcom,gmu = <&gmu>;
>
> +                       interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;

I suppose this and the 845 dts patch should have:

   interconnect-names = "gfx-mem";

(OTOH not having it was a good way to notice a bug in the driver
handling the legacy case without having 'interconnect-names')

BR,
-R


> +
>                         gpu_opp_table: opp-table {
>                                 compatible = "operating-points-v2";
>
> --
> 2.7.4
>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
