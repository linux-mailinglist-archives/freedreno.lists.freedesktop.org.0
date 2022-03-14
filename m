Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490914D8647
	for <lists+freedreno@lfdr.de>; Mon, 14 Mar 2022 14:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9294B10E710;
	Mon, 14 Mar 2022 13:58:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7828C10E6A9
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 13:58:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b24so19991744edu.10
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sGwhFLRtiH/ykUra8RNv5VtPDl39PfWAyeMQdseV4U=;
 b=E4HfJt2lpl5yMCJkmr268M1C6Xw1SdJiBIbXECMsySpxvvMRbBTqo3MSLg3VnfahpC
 P7LzLbgUQFA4BE/DsfILmqLQHUV+ASwOd5AcDTChMfwhP9mK0rdOs6tf3pdCjfyIgHEm
 lfiSNtrZ23gznqQr7osIXvkgdlCoTI2SO5lFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sGwhFLRtiH/ykUra8RNv5VtPDl39PfWAyeMQdseV4U=;
 b=eeZGLeSWqWo+b/xzmYRSLjpT3vBqjGhC6eu+ZO/9AA8bUo4EsuDr/Qy6IeX/NzxqI/
 gH6kiqZzxajgpUmNMmYR9t0c3madMgtZn8Ms3SO2nAjTkEZAyPuTbCO/GYDBKTPkqzIg
 1mP7f5c4F6oAyHFTF9CiGbYWmYAetHbuVuSyCSoFTyetNoPg5mI7L6RwqMNYlRGQ2Np5
 KwhPl4QAhdhJIcGeWGnRXAoiyBVrFV0amvrn9Zt9uAP7A87ChLJUTHOG+2pwiXO+D/Kj
 0cHk4vbm4huKZhd55eZz5uHCaaB3bKx9QmquKnMuq5QuVMLaxhaMY4v1aFSPtyh8ha4F
 SHyQ==
X-Gm-Message-State: AOAM530W7BesfndbE9/+HdCzfr70bizyKiZwvuryTcDINPRG3wPITS6v
 ijkwY9qVtsvzJe5+0M7OO7qTxaKDClBrkg==
X-Google-Smtp-Source: ABdhPJygZ23/poowEmey7naM9lkzrvsM/d13NBNEtiy+UcG2QEzUxN+myd9H53lMmE6CrA3kgievWw==
X-Received: by 2002:aa7:cd81:0:b0:410:d64e:aa31 with SMTP id
 x1-20020aa7cd81000000b00410d64eaa31mr20895366edv.167.1647266287687; 
 Mon, 14 Mar 2022 06:58:07 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 bm23-20020a170906c05700b006d597fd51c6sm6952069ejb.145.2022.03.14.06.58.06
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:58:06 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so9698228wms.4
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 06:58:06 -0700 (PDT)
X-Received: by 2002:a05:600c:a53:b0:38a:fc5:3a90 with SMTP id
 c19-20020a05600c0a5300b0038a0fc53a90mr3788786wmq.15.1647266285495; Mon, 14
 Mar 2022 06:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
 <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
 <BN0PR02MB8173F2E408848216D489D503E40C9@BN0PR02MB8173.namprd02.prod.outlook.com>
 <CAA8EJppt_NjOdJWGrP=8zwG1yEAyJBtnv4G5vLW3CHZ8WrGFvw@mail.gmail.com>
In-Reply-To: <CAA8EJppt_NjOdJWGrP=8zwG1yEAyJBtnv4G5vLW3CHZ8WrGFvw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Mar 2022 06:57:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
Message-ID: <CAD=FV=Wy-ew3sbsQ_ojoAdAXeZPsRzwGJWqNQqpuZDb1GPknfg@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 quic_vpolimer <quic_vpolimer@quicinc.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 11, 2022 at 1:22 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 11 Mar 2022 at 11:06, Vinod Polimera <vpolimer@qti.qualcomm.com> wrote:
> >
> >
> >
> > > -----Original Message-----
> > > From: Stephen Boyd <swboyd@chromium.org>
> > > Sent: Wednesday, March 9, 2022 1:36 AM
> > > To: quic_vpolimer <quic_vpolimer@quicinc.com>;
> > > devicetree@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > freedreno@lists.freedesktop.org; linux-arm-msm@vger.kernel.org
> > > Cc: linux-kernel@vger.kernel.org; robdclark@gmail.com;
> > > dianders@chromium.org; quic_kalyant <quic_kalyant@quicinc.com>
> > > Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-
> > > rate property for mdp clk
> > >
> > > WARNING: This email originated from outside of Qualcomm. Please be wary
> > > of any links or attachments, and do not enable macros.
> > >
> > > Quoting Vinod Polimera (2022-03-08 08:54:56)
> > > > Kernel clock driver assumes that initial rate is the
> > > > max rate for that clock and was not allowing it to scale
> > > > beyond the assigned clock value.
> > >
> > > How? I see ftbl_disp_cc_mdss_mdp_clk_src[] has multiple frequencies and
> > > clk_rcg2_shared_ops so it doesn't look like anything in the clk driver
> > > is preventing the frequency from changing beyond the assigned value.
> >
> > Folowing the comment of Stephen, i have checked a bit more. it appears that clock driver is not setting the max clock from assgined clocks, dpu driver is doing that.
> > i am planning to fix it as below.
> > 1) assign ULONG_MAX to max_rate while initializing clock in dpu driver.
> > 2) remove unnecessary checks in the core_perf library. If rate doesn't match with the entries in the opp table, it will throw error, hence furthur checks are not needed.
> > 3) no changes in dt are required. (we can drop all the posted ones)
>
> Why? They made perfect sense. The dts assignments should be replaced
> by the opp setting in the bind function, as this would also set the
> performance point of the respective power domain.

Right. You should still _post_ the dts patches. It's nice to avoid
unneeded "assigned-clocks" in the dts. The patch description should
just be clear that it relies on the driver patch and shouldn't land /
be backported without the driver patch.


> > Changes :
> > ```--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -284,17 +284,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
> >         }
> >  }
> >
> > -static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
> > -{
> > -       struct dss_clk *core_clk = kms->perf.core_clk;
> > -
> > -       if (core_clk->max_rate && (rate > core_clk->max_rate))
> > -               rate = core_clk->max_rate;
> > -
> > -       core_clk->rate = rate;
> > -       return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
> > -}
> > -
> >  static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> >  {
> >         u64 clk_rate = kms->perf.perf_tune.min_core_clk;
> > @@ -405,7 +394,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >
> >                 trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
> >
> > -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> > +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
> >                 if (ret) {
> >                         DPU_ERROR("failed to set %s clock rate %llu\n",
> >                                         kms->perf.core_clk->clk_name, clk_rate);
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
>
> This file has been removed in msm/next

To echo Dmitry, please make sure that your patch applies to msm-next,
As I understand it, that means the branch msm-next on:

https://gitlab.freedesktop.org/drm/msm.git

-Doug
