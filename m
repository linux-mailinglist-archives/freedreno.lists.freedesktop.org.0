Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAD54CCAA2
	for <lists+freedreno@lfdr.de>; Fri,  4 Mar 2022 01:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C321110E223;
	Fri,  4 Mar 2022 00:16:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55D910E223
 for <freedreno@lists.freedesktop.org>; Fri,  4 Mar 2022 00:16:01 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id j5so5417637qvs.13
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCjc4x4By6clCaeAiAFIhXtDZP9qpnoE7G+iXzZ8y04=;
 b=oP3Se4QqoP9oAlQ1HRVSjzyG5E2i34IxROypI6Bz8iIiSEekElY8/BTpuNTyk1HKwf
 G7LkEPxIO5SPYolkl29HrX0Ox50rktrbuHE/KZoQqyyZ1tJAlFmeVxoYHFGEQ363oRhz
 9tD+IEJaGkj6cadV74LDDg52Z4I4om+nAsNfXOsMY2idn/iul+VqA9UBWw28A6N4VLom
 +qwsMv4qn+Uo3rXGbQA0+czOGICIRcUvvdyT6zxOqZm73F6dk9FgBbqu6vVsKwjAeDiJ
 uzugSydM4U8v9MWShFmWMA1PVBrpWbLrdJ0eDQlRjim8O8Xfk69nxx3+yR3Us6QdFQYH
 uWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCjc4x4By6clCaeAiAFIhXtDZP9qpnoE7G+iXzZ8y04=;
 b=n6ZndcgkZNh1yOtipyehirTO6HH+F79QswkLPq261WID+XFEYJhtKPdmhFQ6zzCKQS
 I+wSkDikXDpZ8XVSKkD/hMlwVvlGCwNOM0PHlQ95houTvVBbS6LrKrPMxOSHWl5x33Fw
 Dmmb95NqZHh0mPd9f4PLTzLuugg5FyyFCfBomf/n1JhIT3g4h3FaKc8ZUpP0t83Z9HSE
 gUp6grpL4DZ6/7P89yLr1XVcsThZNHHJyrZofKdXcTU4qztd0WwloW9XQYySufw1kuq8
 oKTpPjXX+Vn0Zn8i7S6ddgc0MQ4lLtlZ4aJXaLY9mh7HrKbqVFOnv1MykZzMsPF+9jZR
 0+jQ==
X-Gm-Message-State: AOAM533+ETbjzklvugi8mDONSCK6YYaxVg7MfYqm8MY9jiiK2mDcsXRV
 Qej+vfI8ZNCBWzbpArbf6PVrn2XDCxxR0c+WMb8KI7f5u3I=
X-Google-Smtp-Source: ABdhPJxum/m+TEt3e7BQD9vNYZDUIpyt+gK4TZ209Fwn4ctVQ9miyXr7mySaKYi3BuSGNSTDSVnqVqbdgDlUxVbPp/Q=
X-Received: by 2002:a0c:d807:0:b0:42c:1ff7:7242 with SMTP id
 h7-20020a0cd807000000b0042c1ff77242mr26194090qvj.119.1646352960853; Thu, 03
 Mar 2022 16:16:00 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
 <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
In-Reply-To: <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Mar 2022 03:15:49 +0300
Message-ID: <CAA8EJpoEpn2RPByeDkaGPUX+OC7tvbEw4k78Gd+RKs02jpzG1w@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 robdclark@gmail.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 4 Mar 2022 at 02:56, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> > On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> > >
> > > Kernel clock driver assumes that initial rate is the
> > > max rate for that clock and was not allowing it to scale
> > > beyond the assigned clock value.
> > >
> > > Drop the assigned clock rate property and vote on the mdp clock as per
> > > calculated value during the usecase.
> > >
> > > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> >
> > Please remove the Fixes tags from all commits. Otherwise the patches
> > might be picked up into earlier kernels, which do not have a patch
> > adding a vote on the MDP clock.
>
> What patch is that? The Fixes tag could point to that commit.

Please correct me if I'm wrong.
Currently the dtsi enforces bumping the MDP clock when the mdss device
is being probed and when the dpu device is being probed.
Later during the DPU lifetime the core_perf would change the clock's
rate as it sees fit according to the CRTC requirements.

However it would happen only when the during the
dpu_crtc_atomic_flush(), before we call this function, the MDP clock
is left in the undetermined state. The power rails controlled by the
opp table are left in the undetermined state.

I suppose that during the dpu_bind we should bump the clock to the max
possible freq and let dpu_core_perf handle it afterwards.


--
With best wishes
Dmitry
