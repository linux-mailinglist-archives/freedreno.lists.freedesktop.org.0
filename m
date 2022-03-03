Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945F4CCA32
	for <lists+freedreno@lfdr.de>; Fri,  4 Mar 2022 00:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F310E300;
	Thu,  3 Mar 2022 23:44:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715AE10E3C0
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 23:44:16 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id b20so5231454qkn.9
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 15:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
 b=J/hBx5WYUZmVSlCRRaLBicJAHyg8XJ5XIPfWce7YT2VyURvm1AM8cw8nrxtKvSkNpp
 prRmDYzsL6pSd11su+tw62J1FowvLNze/q/+dlFVj5CvIyu6PNf3QF9/KFfi6TAfu6b8
 +4EZuTUknOKMBqW1Qgw7hw3upBT/HnKoCv38fuIXjGGDlqHBzRTt3V/szncIuWVOTmUq
 FA4WmzlC+N9kc8P6jdlDlXSOXV7IW7gecfzNrtC4B0O9Njf/xf7gNJKYEqGnkNOP15VV
 9/pLOqDD3s7HyYyxU+udK+HiSSKbzn2gciIc+oMRSI67oyZNHsF6GPVZbEG3pki58yfB
 UpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
 b=AKI1ABujFbjDteetZ6Ll1PqaNlw7zbEp8oWEfULQOkrPbrAo6X8TIgnoW6ip+jv7je
 CVF6XJPY5Z2KxNpMl4Y+3QdFrL225FzzMo8fzEyOMz3IW4dZGfMLS05Ynmzvb2GF188E
 nJ2JHaMMZ3S6YQUfC9Ml56H3Otax7AonOyA5KuKX/9GXowRlSteS00EED53661DS4qni
 vL4Wr3Sg3OY+pTv/Df887eZJ4pn3FEf92y+kkXUEqF+K2W6HwiQ4VGwbilz9aLR9aeJA
 gIg3RTI8yDwuCwTpDlmD6hVIU55E9mEROIkn9FC2Lc1paEAyQGwtEC/1qdvpq/z5k6mk
 Qdfw==
X-Gm-Message-State: AOAM5308M05QaPFv7EWJh3c8I0MMoANBNcflQooeVc9DNQt2RVQDI97D
 u6g8OhefoSQ6nDwjw3bkD/bvQAXbwDHInr4XOr5qyw==
X-Google-Smtp-Source: ABdhPJxJO+KCmM4Hjc8qhnEGGjI+t24ab51EgjVhBiPnsrIH6bD4ba37GDxRkz/qOxkjwsmpq+tsrxxV7q0PEMYatdA=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1025852qki.59.1646351055546; Thu, 03
 Mar 2022 15:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
 <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
In-Reply-To: <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 02:44:04 +0300
Message-ID: <CAA8EJpo6o8TZKqHx+eCKSWAshKV=MjYYVt2dVdCpf=w1gBOHmQ@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm: remove extra indirection
 for msm_mdss
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 01:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-19 14:40:03)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index be06a62d7ccb..f18dfbb614f0 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1211,19 +1212,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >
> >         switch (get_mdp_ver(pdev)) {
> >         case KMS_MDP5:
> > -               ret = msm_mdss_init(pdev, true);
> > +               mdss = msm_mdss_init(pdev, true);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
>
> Drop else
>
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
> >                 break;
> >         case KMS_DPU:
> > -               ret = msm_mdss_init(pdev, false);
> > +               mdss = msm_mdss_init(pdev, false);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
>
> This is the same so why can't it be done below in the deleted if (ret)?

I didn't like the idea of checking the if (IS_ERR(mdss)) outside of
the case blocks, but now I can move it back.

>
> >                 break;
> >         default:
> > -               ret = 0;
> >                 break;
> >         }
> > -       if (ret) {
> > -               platform_set_drvdata(pdev, NULL);
> > -               return ret;
> > -       }
> >
> >         if (get_mdp_ver(pdev)) {
> >                 ret = add_display_components(pdev, &match);
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 2459ba479caf..0c341660941a 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
> >         return num_clocks;
> >  }
> >
> > -int msm_mdss_init(struct platform_device *pdev, bool mdp5)
> > +struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
>
> Ah I see it will quickly become not static. Still should have static
> first and remove it here.



-- 
With best wishes
Dmitry
