Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFB4DD1BB
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E392710E13A;
	Fri, 18 Mar 2022 00:12:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929110E13A
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:12:56 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x34so7312188ede.8
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
 b=WmrOuRLIO0Ac2yhoWChAS3mMdEymf9q2gT1itHWGIVZGaH+oPlHGJc4Ee3mLhpjJyz
 /KOPyenA4596wt5yxVjvtdxfN8GH4bugNcacafDRuP5vH1xVx88HWnxUWlfstXDyW9iQ
 j77Pr/D/gx7SNRYOy03j2fM7u66ODTiwxMI7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0JxEaW4VXWR40cLYJjku9wMK0TYnJdxwPBMKsUQN5x4=;
 b=OT60I2X4Bu5L3AJXLhO9t96l9owiydnlBsEvgmP66DrEjtxzowFWL85r5JxCMdzM96
 ealpCKGozTE4uN0/UlJeeHj7oCWIUS8AxIQDff7qnar8iJiCcG4TzkLrmNJCZuOD/gWj
 pkId0XplPxz1tztS0eqg1p4Y0RfrP/IEJLhQF12Rr7UwJGf91TvX1cZvi7qQ3xdbzkV5
 0Icxdt5CQYY4U0sx16XIymysFcqcZT99Eod6AAoTevfyC6lt0SP8hvZNWBB4Pl8rvPfI
 xJuEDYkdUQW6xcWHdyvaGCE7uKpSLEZKWcXFz84j2xpywjpBaQaAoJ9uNKBemzRf1TSM
 NfuQ==
X-Gm-Message-State: AOAM530Y7PNrOa3S0ux9u2aVpm8wupBNB6xm4LK3b0uxZh9aKprH+E8L
 zvYBQ0LTBT0+URSTZvq/6ukBe3Cqj2rDPIRMW40=
X-Google-Smtp-Source: ABdhPJzimd7HDnBKBcmI9Z8ja1urjexrMkEUes4hBbEfmTpxiAr19hSPSrRga5Iu16PEAhlLbH5nQQ==
X-Received: by 2002:a50:9b11:0:b0:419:a8f:580c with SMTP id
 o17-20020a509b11000000b004190a8f580cmr807912edi.292.1647562374519; 
 Thu, 17 Mar 2022 17:12:54 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 l5-20020a170906644500b006ce6b73ffd2sm3026800ejn.84.2022.03.17.17.12.53
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so5926807wmj.0
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:12:53 -0700 (PDT)
X-Received: by 2002:a1c:7518:0:b0:37c:7eb:f255 with SMTP id
 o24-20020a1c7518000000b0037c07ebf255mr13488223wmc.29.1647562372833; Thu, 17
 Mar 2022 17:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-4-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Mar 2022 17:12:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
Message-ID: <CAD=FV=VXJJYUhDYau1HEG4M7aKA4vVzN7xh_LAJXf_r=Tj0XZA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 3/5] arm64: dts: qcom: sm7180: remove
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
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
