Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B1D6CF378
	for <lists+freedreno@lfdr.de>; Wed, 29 Mar 2023 21:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055E610E19C;
	Wed, 29 Mar 2023 19:46:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C1F10E18D
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 19:46:04 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id j7so20852364ybg.4
 for <freedreno@lists.freedesktop.org>; Wed, 29 Mar 2023 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680119164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uw+Hse+KJzv0y2FSFqFqsApOoihx38C1GEdX++8T4mU=;
 b=Ls7zjQJXIsTIXK8xa12UAtG31viT2wzMU0YcliPrqQwfiS28W+VSdxEZCOHXi+RobD
 XJ9KXSPw5B0DaQod948Mcm4Qe5V/oKODzQN0VNyyLUo34I+uIejSXd7Yil7OLKaWM3Ic
 mDCDMu1lQm16AhfKyfawdB1xpJL3jxmlF2mcmnpp67Oe1PKzWojDN94zz1dBnpaD/F8n
 73x1wO5Vu7TyBgqnybHaJwRlqGhN+FyoVNHwCokw5NLLun+bYLCaC9NxH5xxs6OuvGfj
 eKXowAHQQsuzG8s8sypYOTlw9Ob3IXxmPcPDbdi07zqSSX5gApCeN57e0aEDnXq8mZNE
 yCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680119164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uw+Hse+KJzv0y2FSFqFqsApOoihx38C1GEdX++8T4mU=;
 b=huMtB1fe7FeAETvMfGB6Qr/EGUpTdf1XbqFQwQPlmJv5G/l1/InTarQKhDuv1INNEf
 LH87ejGC8AyGZlpWhDm68WQBH/LvM6pZmCS8pzfqDIk/rwKuJExLwla9Egr9O7jtNEMS
 y6rSLXUYavft4NyajQLsUDj2pNwmRYyKFez3i7pJEbCEGdu4quwgoYkGsoujmotE+TPf
 nhNwf24ISIp0EG8XjW+lGG215uh8LlFdCjH/snwIEDS+OFvPUgQVzvdtOr5HQpj4glQz
 zs1Zd2A9Y8FrxSurezsw3DA3qWxXjh8RuftCieo88y1AmGWRiGxzsW8/KRV4lWj9MknN
 aU2w==
X-Gm-Message-State: AAQBX9c5izWCNTPFBWJ49KwKx3JxORxjC2uQtBNvJuNXwKM4xRDGwh6h
 uyI1l56ZZFZ/8tL+B+AD6gCS2v3asDXvfU4nP0HdPw==
X-Google-Smtp-Source: AKy350Ylj3nNZ+UsrhOAFg1PNOleWiB7Ukh6l+gs8gz1nByk+hbUAS4yZ4upJ6ElCZNHNv03bHuKs6bpr3HesgeAprk=
X-Received: by 2002:a05:6902:a8c:b0:b7b:fb15:8685 with SMTP id
 cd12-20020a0569020a8c00b00b7bfb158685mr7538197ybb.9.1680119163802; Wed, 29
 Mar 2023 12:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
 <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
In-Reply-To: <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 Mar 2023 22:45:52 +0300
Message-ID: <CAA8EJpohEo+kMw7fx5112m+z7JHSLDmsqOL4T7hmyvr2fPP8vQ@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: adreno_gpu: Use suspend()
 instead of idle() on load error
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, David Airlie <airlied@gmail.com>,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 29 Mar 2023 at 18:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 29.03.2023 16:37, Johan Hovold wrote:
> > On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
> >> If we fail to initialize the GPU for whatever reason (say we don't
> >> embed the GPU firmware files in the initrd), the error path involves
> >> pm_runtime_put_sync() which then calls idle() instead of suspend().
> >>
> >> This is suboptimal, as it means that we're not going through the
> >> clean shutdown sequence. With at least A619_holi, this makes the GPU
> >> not wake up until it goes through at least one more start-fail-stop
> >> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
> >> shutdown.
> >
> > This does not sound right. If pm_runtime_put_sync() fails to suspend the
> > device when the usage count drops to zero, then you have a bug somewhere
> > else.
> I was surprised to see that it was not called as well, but I wasn't able
> to track it down before..

Could you please check that it's autosuspend who kicks in? In other
words, if we disable autosuspend, the pm_runtime_put_sync is enough()?

That would probably mean that we lack some kind of reset in the hw_init path.

On the other hand, I do not know how the device will react to the
error-in-the-middle state. Modems for example, can enter the state
where you can not properly turn it off once it starts the boot
process.

And if we remember the efforts that Akhil has put into making sure
that the GPU is properly reset in case of an _error_, it might be
nearly impossible to shut it down in a proper way.

Thus said, I think that unless there is an obvious way to restart the
init process, Korad's pm_runtime_put_sync_suspend() looks like a
correct fix to me.

> > Also since commit 2c087a336676 ("drm/msm/adreno: Load the firmware
> > before bringing up the hardware") the firmware is loaded before even
> > hitting these paths so the above description does not sound right in
> > that respect either (or is missing some details).
> ..but I did some more digging and I found that the precise "firmware"
> that fails is the ZAP blob, which is not checked like SQE in the
> commit you mentioned!
>
> Now I don't think that we can easily check for it as-is since
> zap_shader_load_mdt() does the entire find-load-authenticate
> dance which is required with secure assets, but it's obviously
> possible to rip out the find-load part of that and go on from
> there.

Yes, I think we should load all firmware early. ZAP shader is a bit
unique since the DT can override the name, but it might be nice to
check for its presence earlier.

At the same time it probably should not stop us from fixing the idle()
vs suspend() bug.

>
> Do you think that would be a better solution?
>
> Konrad
>
> >
> >> Test cases:
> >> 1. firmware baked into kernel
> >> 2. error loading fw in initrd -> load from rootfs at DE start
> >>
> >> Both succeed on A619_holi (SM6375) and A630 (SDM845).
> >>
> >> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> index f61896629be6..59f3302e8167 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
> >>      return gpu;
> >>
> >>  err_put_rpm:
> >> -    pm_runtime_put_sync(&pdev->dev);
> >> +    pm_runtime_put_sync_suspend(&pdev->dev);
> >>  err_disable_rpm:
> >>      pm_runtime_disable(&pdev->dev);
> >
> > Johan



-- 
With best wishes
Dmitry
