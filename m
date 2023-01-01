Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B9B65AA00
	for <lists+freedreno@lfdr.de>; Sun,  1 Jan 2023 13:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F4C10E18E;
	Sun,  1 Jan 2023 12:28:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD9510E18E
 for <freedreno@lists.freedesktop.org>; Sun,  1 Jan 2023 12:28:23 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id 186so27882599ybe.8
 for <freedreno@lists.freedesktop.org>; Sun, 01 Jan 2023 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k7URFysZSN6Z6LPVxT+yXBreQGfA0TGi/6KTxnv1zPQ=;
 b=m4CkBbsI2qgy3rEjcmWIb/RyUGvlTEsS4GqyT5053SOFVnaBp+7tlDJeyB/oNvBMqT
 rckKFnmUYYIIbyaeyeeDEVK8f4VERRlO9/iX913GnEkX/q3vw6w1em6eRrQm1rgATXTS
 FnhEcsgdR81pkKZhrtChIwFLhKUtVlikjkiN4uNsWGXT0pmG414ZfdeksFPcutWifcJB
 wN4NDlUQjlKWsQuNodL+X+w7j6BRAxpUMPnRzwcFOMrkkbJu7e5bVD+GUwVxn9lb33f3
 sM8MBV+EWOAIjIDRz2lLH/XoDw+1wAVLfkVQ+dyxyYkBq0nMUREH2P1/3ZRAWB05guel
 ID7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k7URFysZSN6Z6LPVxT+yXBreQGfA0TGi/6KTxnv1zPQ=;
 b=ZE+5CBjcS8SFGoVEfp5YiGZe04M9GP/vfSQRmsUWayR3ghSHO8ZW4MsqloVaCF7TCn
 /FILmECIJyuZQ8yBgrdJQiJqnhyLkdh/AHz7mw7c4zAp7/DxPVrnJxGsOzudatZTCMYu
 TXnF+s2VuZ16TBHRvfUB6dClKjD3UGDnBs5hcPlyTl6lE59MN8YUMhDPXPXRgXZqGQsU
 WS4xx9qjdrlmkMz863CLHTesDowsrzi3nJgoRXctuF6XkWVWnHNzePpguH6eIVoOqA1R
 90JA8Ui6st7wzjFjoFAlaVCuTfMG+V/GyX2JL5wNE4RutKzcYdEnw5+nFH6Tq0jtatuo
 nqlg==
X-Gm-Message-State: AFqh2kobJrEJx2bGmDS2w3wz5qiP6NmzLyMgCPHRv59xRbnWy8+8+0D0
 e5BLdtkbgJTFtZEVmlZ/3rJpouKKZiqUwYrnn5A1fw==
X-Google-Smtp-Source: AMrXdXvS4lpF3KQddvAF09DEYtTB4B8CaWxtR7z/xYy/Ud/tpPXFEsqZnY0VA0puIPo+mKWCXByVoSca3FxW3JEu9ag=
X-Received: by 2002:a25:cc7:0:b0:6e0:c7d3:f026 with SMTP id
 190-20020a250cc7000000b006e0c7d3f026mr4167854ybm.275.1672576102911; Sun, 01
 Jan 2023 04:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-4-marijn.suijten@somainline.org>
 <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
In-Reply-To: <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 1 Jan 2023 14:28:11 +0200
Message-ID: <CAA8EJppF7VcYLn3K6tV3WS+r+4W9XMGfFpD0hXf+fdpvy9osaA@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, 
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Kalyan Thota <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 3/7] drm/msm/dpu: Disable MDP vsync
 source selection on DPU 5.0.0 and above
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

On Sat, 31 Dec 2022 at 23:52, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2022-12-31 22:50:02, Marijn Suijten wrote:
> > Since hardware revision 5.0.0 the TE configuration moved out of the
> > PINGPONG block into the INTF block, including vsync source selection
> > that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
> > register has no effect anymore and is omitted downstream via the
> > DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
> > blocks used by hardware prior to 5.0.0.
> >
> > The code that writes to these registers in the INTF block will follow in
> > subsequent patches.
> >
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 33 ++++++++++--
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 52 +++++++++++++------
> >  3 files changed, 66 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 39d4b293710c..1cfe94494135 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -407,7 +407,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
> >       {
> >       .name = "top_0", .id = MDP_TOP,
> >       .base = 0x0, .len = 0x458,
> > -     .features = 0,
> > +     .features = BIT(DPU_MDP_VSYNC_SEL),
> >       .highest_bank_bit = 0x2,
> >       .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >                       .reg_off = 0x2AC, .bit_off = 0},
> > @@ -436,7 +436,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
> >       {
> >       .name = "top_0", .id = MDP_TOP,
> >       .base = 0x0, .len = 0x45C,
> > -     .features = BIT(DPU_MDP_AUDIO_SELECT),
> > +     .features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
> >       .highest_bank_bit = 0x2,
> >       .clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> >                       .reg_off = 0x2AC, .bit_off = 0},
> > @@ -512,6 +512,31 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
> >       },
> >  };
> >
> > +static const struct dpu_mdp_cfg sdm8150_mdp[] = {
>
> Sometimes it is only possible to spot such things _after_ sending,
> probably the thing that makes us human :)
>
> sm8150_mdp*, not sdm.
>

With this name fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
