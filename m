Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8F4DD1BD
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162110E8F2;
	Fri, 18 Mar 2022 00:13:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCFC10E8F2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:13:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h13so8491217ede.5
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
 b=I6jh5qUUAfPbuFRo6X1vzR4jyxk+Jwj+tM+hcWGcNJ80NKQdHD3dt4WyBUnPLaQ43u
 fY4hRGaRDpfdxsttq4ka6QQ3hsN/FLOiF/BWyTy1eAv5/n1k20hVkDNHY/wy2ucHyIUT
 LyPuzoXHOq8/3MYayGZMQIPpAv4JbHhGQwbek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivABL/zW17W3xsGsFU4NNFD2vIhj9kJM89ziwsXeP4A=;
 b=i9aXIOzK8LjnK5OGBGlXcNrBrBR3q6Ay8BzHCihDc3w9uxZ/RQOQozIsgdbfAawlJL
 hVGf0Y2NM/AvVRZlZNJTW5dQZbNeNb8ZLxTANCkCxx518pBIwwYFgDjg6VdDaEnKACaH
 BWA0CeW+lQ26nHyqcbIOfCEXdUhmiQLwkEf9ZLWtcH6IZb/wEU58T7kKkUlQbkx7F2/1
 GvPsREJr+/LWYRmIcluB4kONbtq+t8akHyieb1s3AeT3AQimmLqRfw1FPo9CKoIYWar4
 fJZODUJu/YNINaBchAmhh1u8BLTzlPLssaPsjDD/HTcAv2q1pNWOjhKuS/r5MWb/U/pD
 TAkw==
X-Gm-Message-State: AOAM5322ngLdSy2flZIqvbWexgvgDdonaq5B1hV386Bu7ASMwEafxNrx
 LEblvkJdXzwkuVa/OnvJVdcq7ay8qevtyh5+CJ0=
X-Google-Smtp-Source: ABdhPJzXJLPBCI1uKWlt4SqgfdbpB+Af5rKTs6hBSya5NSqxc7oReUym5FJds2wTTlcO1ZOppV8bVg==
X-Received: by 2002:aa7:cac4:0:b0:418:85b7:adec with SMTP id
 l4-20020aa7cac4000000b0041885b7adecmr6965655edt.231.1647562381164; 
 Thu, 17 Mar 2022 17:13:01 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 g16-20020a170906521000b006d58773e992sm3026397ejm.188.2022.03.17.17.13.00
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso4035657wmz.4
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:13:00 -0700 (PDT)
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr5932331wmb.199.1647562379575; Thu, 17
 Mar 2022 17:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-5-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
Message-ID: <CAD=FV=VQV-2LTmVEPuJJYUhTpBT15A1fKAsRbZgpni8rGNNFsw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 4/5] arm64: dts: qcom: sdm845: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
