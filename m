Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB7D80E437
	for <lists+freedreno@lfdr.de>; Tue, 12 Dec 2023 07:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FD10E120;
	Tue, 12 Dec 2023 06:23:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9210E120
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 06:23:16 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5d8ddcc433fso38265247b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Dec 2023 22:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702362195; x=1702966995; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iiILM31E6DkzVgO2qo0gFXNyzTl9J/ly6YMsqQ+U4+s=;
 b=FdtpzUR2mNpRRuTq5ijvbYq02sZLSbilepW4YSmFUzdslHHXFaNLetEfynlKh6wuf3
 4cdjkmzxfmW1OdSscAMemF9PMUVHB+l5/OHdTG/Kzcn/nERFkjzq+7FYO1D2HJAJVkaV
 OQcbPJXECsl75GWVtj8j1lnVguc7TyJ1DdCeAWNRcRgA9AtKiQdd8GQsfVgFTki/t0G1
 snmF17gALPMTQkUpNecwzyMyQN5LYbTuIhTC7Kvqe9BN7mu4CJFr7HwNF2/CbEdWsfJ4
 Qp3Spgb3+SKvNpUy/5lJCVEcsISULC7UwKr5YmsnXkOt2Co29CL9LoTwBr2lg5dbZ9qV
 P8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702362195; x=1702966995;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iiILM31E6DkzVgO2qo0gFXNyzTl9J/ly6YMsqQ+U4+s=;
 b=K45hSIrkqTwWkGHpFbG/nhkU1OI9MF9DY9F3kdhlZv1lFNXG3JNTUKB7dK4PVKYthy
 vAaiXTbSlU4/J4TxUyA0SQAKMfR8ZOMsiD8jYI/61BbA5h5cvaZlEhhFyCJTpZy92xkQ
 Nd7pZtSM1AAQQvvd45FkHACZ8jkHwm6qXB6SAr2HPHfDUnLUSpUX4TGZcR3pTuwiTMmY
 VgPIKNqeZ4S8K74Fwg5e5QE1Kchiq+vXk0cwTTGdDhBJKMa/kwXDtSNgpSDt3mcZGWRz
 aQKy9IaMKN8ng6X8xfdH93KeCGjxRZrAG55aN61Fd/jnr8qbDF+G5wMHg2N/BIVMOtRn
 HMxw==
X-Gm-Message-State: AOJu0YyuoDXSks8GItEk3Rer/zo6KqsCD6R2/C3Cdhab1K4CrzYx5Psw
 89k4kylOa3GpCKvkTCAnTO6qcDFGy0IgERgkcPPGPw==
X-Google-Smtp-Source: AGHT+IHMSmzL1GhX733i9qyeRqWSt5GjXz2vhpxca8+A+ee2K5EieVksUobvlXU13YxCT8ZtBI1vuiBvCLvFDFFustg=
X-Received: by 2002:a81:7b42:0:b0:5d7:1940:8dd4 with SMTP id
 w63-20020a817b42000000b005d719408dd4mr2237054ywc.59.1702362195612; Mon, 11
 Dec 2023 22:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
In-Reply-To: <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 08:23:04 +0200
Message-ID: <CAA8EJpqYAmbX6=wKYJ34=FxewCaqp9Lb8kqqCumL1i_wSZdvfw@mail.gmail.com>
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 at 02:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/2/2023 4:31 PM, Dmitry Baryshkov wrote:
> > I was not able to test it on my own, this is a call for testing for the
> > owners of these platforms. The git version of modetest now fully
> > supports writeback.
> >
> > Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
> > connector, cat /sys/kernel/debug/dri/0/state to determine
> > spare CRTC and plane, then run something like:
> >
> > modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768
> >
> > where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.
> >
> > Then press Enter and check the test.d file for the raw image dump.
> >
> > Changes since v1:
> > - Fixed the DPU_CLK_CTRL_WB2 definition
> >
>
> I think this series needs to be re-based as WB_SDM845_MASK is no longer
> present in msm-next and 3/4 patches in this series use that.

Quite the contrary: the WB_SDM845_MASK was added in
https://patchwork.freedesktop.org/patch/570189/?series=127245&rev=1,
which is now merged to msm-next-lumag

>
> > Dmitry Baryshkov (4):
> >    drm/msm/dpu: enable writeback on SM8150
> >    drm/msm/dpu: enable writeback on SC8108X
> >    drm/msm/dpu: enable writeback on SM6125
> >    drm/msm/dpu: enable writeback on SM6350
> >
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
> >   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
> >   .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
> >   4 files changed, 72 insertions(+)
> >



-- 
With best wishes
Dmitry
