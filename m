Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F236620F0
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803C510E0D3;
	Mon,  9 Jan 2023 09:06:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5F910E374
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:06:57 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-4c9b9185d18so33885167b3.10
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
 b=uxJqcr/vA16Jbso7FMrCavP3Cf2jhnnlPgVnsuBsvS/o+Z1jwaAnN1AQdnbbe+GJc6
 ixviHjNm2JTcHR4e5QhHj1v3nXBUyMlCCBLXphPY6Q+qVkTzrxjlykCBgc2y7oRrP17s
 A5bSkfDmbgJreYllwN7sl/4BZpeZJ/z9eUcIoENMIMYTupxqrttaUSwQCj8s/SrP+sIQ
 6wbCC9UCbTxxCG3hCIRwUkCdwfAGRw4ZfRIfAuJDLhTbJR+AerCjSUWlZklTY53Ts7Et
 bD4pvNfviMu91QcLX9ba5HawO/FK9vk9Bayawpaj1Wn4PcYxCp7iUlPdFSLxeLu0MHla
 foSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pk8HoU5sl6UY7My5Q7QXvnwfSNOwL/YVw0rPqcw5wI0=;
 b=SfBE/RGdLO2jWzF/HrJZmJzeldDOnG+TAh29m74miRcfiHc+b4HcOYxD0HhPKmRm3a
 xVRi6Zfe08ZkGDa7rqTV3s8tkll0n+8ar0JGUJbCocTwTaAu+7O/IXhDmTa58xJw3J8j
 Ssy6CooQLd1rChZnvI6bPr6CsHMNJtESBXa918lyFofd9nEbijZdnfApCMfxhow62F+R
 TxDlSmdvLoqcPpJSypwWvuLH2OGNgq8vEP13FNVy1YDrNsdYKDozM5QQqqV5hLceOFar
 FqC0LFDV+ScuPcNl1Qq3kAGJiAVpUYK4WdcFcLqRaQZ8H0O+teU9zOkz/ld88E2leHC0
 GZGg==
X-Gm-Message-State: AFqh2kppCBLKbnL/HA5d/hBXIuu80hEqQDSPCZzxPMrzxTrUMZfYPihZ
 WjJdn9CNErUtVehI/ErFtkceFe7/YEWI3PvdFFPXow==
X-Google-Smtp-Source: AMrXdXv7lpAYFxmW/eV/4rKWRDYgiJ5liDzlAKLCsDctqH1bw7LEQ8Q1lC1IVljbsIzfzyvSmxnDP2lGZbHp6UK7mUs=
X-Received: by 2002:a0d:d692:0:b0:477:b56e:e1d6 with SMTP id
 y140-20020a0dd692000000b00477b56ee1d6mr6161ywd.188.1673255216324; Mon, 09 Jan
 2023 01:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20221221231943.1961117-1-marijn.suijten@somainline.org>
 <20221221231943.1961117-5-marijn.suijten@somainline.org>
 <b415a91d-f804-1fec-52dd-4124d3f1e583@linaro.org>
 <1b872a47-6ffc-1fe9-f283-897dbc37d709@linaro.org>
 <20230109082357.meebk7udokdfvwle@SoMainline.org>
In-Reply-To: <20230109082357.meebk7udokdfvwle@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Jan 2023 11:06:45 +0200
Message-ID: <CAA8EJppqocjgTbZLhcJtmRGjE4X2u_jDEGDWS9Bsp7MEgD+Ldg@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 4/8] drm/msm/dpu: Disallow unallocated
 resources to be returned
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Haowen Bai <baihaowen@meizu.com>, David Airlie <airlied@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 sunliming <sunliming@kylinos.cn>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 10:24, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-01-09 01:30:29, Dmitry Baryshkov wrote:
> > On 09/01/2023 01:28, Dmitry Baryshkov wrote:
> > > On 22/12/2022 01:19, Marijn Suijten wrote:
> > >> In the event that the topology requests resources that have not been
> > >> created by the system (because they are typically not represented in
> > >> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> > >> blocks) remain NULL but will still be returned out of
> > >> dpu_rm_get_assigned_resources, where the caller expects to get an array
> > >> containing num_blks valid pointers (but instead gets these NULLs).
> > >>
> > >> To prevent this from happening, where null-pointer dereferences
> > >> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> > >> increase past NULL blocks and will print an error and break instead.
> > >> After all, max_blks represents the static size of the maximum number of
> > >> blocks whereas the actual amount varies per platform.
> > >>
> > >> ^1: which can happen after a git rebase ended up moving additions to
> > >> _dpu_cfg to a different struct which has the same patch context.
> > >>
> > >> Fixes: bb00a452d6f7 ("drm/msm/dpu: Refactor resource manager")
> > >> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++++
> > >>   1 file changed, 5 insertions(+)
> > >
> > > I think the patch is not fully correct. Please check resource
> > > availability during allocation. I wouldn't expect an error from
> > > get_assigned_resources because of resource exhaustion.
>
> Theoretically patch 5/8 should take care of this, and we should never
> reach this failure condition.  Emphasis on /should/, this may happen
> again if/when another block type is added with sub-par resource
> allocation and assignment implementation.

Yeah. Maybe swapping 4/8 and 5/8 makes sense.

>
> > Another option, since allocation functions (except DSC) already have
> > these safety checks: check error message to mention internal
> > inconstency: allocated resource doesn't exist.
>
> Is this a suggestion for the wording of the error message?

Yes. Because the current message makes one think that it is output
during allocation / assignment to encoder, while this is a safety net.

>
> - Marijn




--
With best wishes
Dmitry
