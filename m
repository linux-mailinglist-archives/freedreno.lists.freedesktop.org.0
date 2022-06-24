Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4D55A518
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 01:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D4B10F5E6;
	Fri, 24 Jun 2022 23:53:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0405910F5E6
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 23:53:48 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id b24so2263117qkn.4
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 16:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
 b=OMISmZTnPSyJ2Zmlprhg32lCJnHsse7hunOaQZu+IvIUb1JqifQ8/cVFphlQf6U1I5
 s4lLnkgPy6GCPqoTsRc38Ek7n/CZs0um1eNVdC12bLEMEahmryIhhQjecpXv/H1miJib
 2oeTjESwobonRtBvptbyFmqVPMEA+eE7tDV8CMWIKfpiR8bNm0NAc+oIkppKCXQpWKOE
 BXJPPjElweEe+KUkC174tN+rPS54PuS+mBCih3c1hS2xH5LS5v4GPJjcNjMlCiHPCNNd
 Hd8vHuPbA0/Ws6k943RaB75NmTs799P4g3AseYGngL8KMbPsS/VnqKJhRcfyR37ZYKbx
 1j1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XWbRuL2HNJOazJRDZ8Yz9uaYitC4uPW931tvugnImWs=;
 b=nkrYJJMIFNloqDoVcP/Uc48CB2cWYSCJMbm6rqFyV4e2xHg1eOj4mtqWE0PyzerP/u
 H5FgUWB48e5vE7qgd5Ce56MBiB5N5dQLApob8ZprEf2QEpxLOmdpnR06ZxxPwMSq0OQC
 3B9Kp4LwXGWUcqoVbCr+IEw8jb4AyuEHRcS3bDFYCnk51FdielETdYdB6QuCEaRY7xTt
 53uluuTXYtLV2r80V05oHYwbJ+ZUV/gddj8Vma7TtAWkZlI7r9JkOpJFDm/m4OX0bSLk
 3AZSQ99/lWJo03dMA2msCiPU3NCChaLQBti1S8l8aGnIOvItRTybf6HuuULcPwV64g2U
 V6CA==
X-Gm-Message-State: AJIora92NvT8QMfqQwTLNs2ibW7NbOzzUn1jNGbBrYPowghuQn1tcmNr
 xROi4OL4DIJyZDL8oTjrCvHA+dM12AVz4UP9t4m5yA==
X-Google-Smtp-Source: AGRyM1sssDPYLQQkqtjhG0C1nm2ma0r4GcjmmJkpT053S48MTsShoxEygLh6xlx3b4oYiFps99tJYYPjpkLME85zmwY=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr1333795qkp.593.1656114827059; Fri, 24
 Jun 2022 16:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
In-Reply-To: <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 02:53:36 +0300
Message-ID: <CAA8EJpoD-CJ1mgzef0tA4R=BJUdbSPErXG1fvugAd+5UhWiobA@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of
 dp controller_id at scxxxx_dp_cfg table
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com,
 airlied@linux.ie, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robdclark@gmail.com, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 02:45, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
> >
> > On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> > > Quoting Kuogee Hsieh (2022-06-24 15:53:45)
> > >> MSM_DP_CONTROLLER_1 need to match to the index = 1 of sc7280_dp_cfg[] <== This is correct
> > >>
> > >> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
> > >> of MSM_DP_CONTROLLER_1.
> > >>
> > >> but .num_desc = 1  <== this said only have one entry at sc7280_dp_cfg[]
> > >> table. Therefore eDP will never be found at for loop  at
> > >> _dpu_kms_initialize_displayport().
> > >>
> > > Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
> > > the intention of the previous commit was to make it so the order of
> > > sc7280_dp_cfg couldn't be messed up and not match the
> > > MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
> >
> >
> > at  _dpu_kms_initialize_displayport()
> >
> > > -             info.h_tile_instance[0] = i; <== assign i to become dp controller id, "i" is index of scxxxx_dp_cfg[]
> >
> > This what I mean MSM_DP_CONTROLLER_1 need to match to index = 1 of
> > scxxxx_dp_cfg[].
> >
> > it it is not match, then MSM_DP_CONTROLLER_1 with match to different INTF.
>
> I thought we matched the INTF instance by searching through
> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning that
> INTF number. See dpu_encoder_get_intf() and the caller.

You both are correct here. We are searching through the _intf[] array
for the corresponding controller_id. And yes, the controller_ids are
being passed through the h_tile_instance[] array.

-- 
With best wishes
Dmitry
