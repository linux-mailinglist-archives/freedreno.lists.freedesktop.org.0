Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD827B3BEF
	for <lists+freedreno@lfdr.de>; Fri, 29 Sep 2023 23:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3309A10E13D;
	Fri, 29 Sep 2023 21:27:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75DD10E4FE
 for <freedreno@lists.freedesktop.org>; Fri, 29 Sep 2023 21:27:03 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-59e77e4f707so177204277b3.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Sep 2023 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696022823; x=1696627623; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KyO5YdXbOQnT5NUL8KE5RypLcV3p9aKnClGrB6+EVrQ=;
 b=jRiqptl8mNqExyNQfEx7nMfDhHTN/lq3WVStSpFxp/A/gS0bU8QC0tsZ5QS8WYsSzN
 8cihimlUDd+UvVIul+trZQhZ3v5QCHAUobTrXTOUKacRshkaEIMASl+t25sN+mBS0nPc
 bb8phwtFYmZ8JR56OGXPYyR70kJpHFtPdrv8N/shQJSIqU9lxyWdmPefNrxUWpnQ0dkM
 g3oRVmlq9gItqmnDZbYNv4Fl/0aYAF3qntZIzBvtUhQb1PhhDS2UWCGJ4ynykLxIzj7R
 tXrbUeOY1eEVReF2TrLTsmJ0ZD/fUcf9/tOrcOzNT3UcxvR9gVNYrSqRfvUvrU6noSvO
 IiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696022823; x=1696627623;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KyO5YdXbOQnT5NUL8KE5RypLcV3p9aKnClGrB6+EVrQ=;
 b=LWb8Mba/KerY6zBdoRWNUQiL+WvqXw49CrYJOWWcfezVnFxxQrfwln69YXC1/YaVrR
 Bb0AESDrNpyF5oBoge7UGccffAPjJpasBQ8gUUBz3uqTGXfwTnj9ekslVJimCsfuESWC
 ZmR8elQzBmwzO/IZKluhlsdZ0ha8mc+O43Hk0OoPx6IPxDsqAUsPjhUi1t8zuF1hML+7
 S9uCdsZzn5S/BMxe0Rzyq5TDAY7HcbsFX7+YYNMoriLogZpYVmvhIQS+CdS+Ibzn7YKf
 PA3grL1u7kr68QMXL1euTIZML9A4wviL5TRGH1/YGfP8z5mqOCd4sG07Ro5fp2LUwKVB
 HV1g==
X-Gm-Message-State: AOJu0Yx9VY4AdGf/zejMNy84+1eTf5Ms4HQ3Z1Y4sQWVGlyHsYqU9+HT
 4b7ztyogV8ImKxLIp61YhKRidsAydPLX+AONTb+kig==
X-Google-Smtp-Source: AGHT+IEnJhcZf0E4NuAEZiI6Q/aukTwmvALGSr0FGxjLseNJGx8SqY5OUcj+mlsTT3G9JqD6pThykj8Ub6nQffD9YAU=
X-Received: by 2002:a0d:d84f:0:b0:59b:51d9:1d6e with SMTP id
 a76-20020a0dd84f000000b0059b51d91d6emr5888082ywe.6.1696022822889; Fri, 29 Sep
 2023 14:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <20230923214912.1095024-2-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz>
In-Reply-To: <5711857.DvuYhMxLoT@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 30 Sep 2023 00:26:51 +0300
Message-ID: <CAA8EJpoq=6=__uGeQ2UhTn4+iqMY-p=XP3M6SdOWxoxChf=x5g@mail.gmail.com>
To: Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
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
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 29 Sept 2023 at 23:53, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
> > Experimental support for MSM8953, which has MDP5 v1.16. It looks like
> > trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> > etc.
> >
>
> Hi Dmitry,
>
> As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the screen is
> initializing and displaying stuff :) But there's some errors, which presumably
> are the reason that the screen is only updating a few times per second.
>
> [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu error]enc31 intf1 ctl start interrupt wait failed
> [   23.099821] [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done returned -22
>
> These messages appear about 13 times per second but as I mentioned, the screen
> *is* updating (slowly) there.

Thank you for the testing, I'll see if I can determine what is causing
the ctl start issue.

>
> Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> msm_mdp5_dpu_migration list, without this DPU is never even considered for
> 8953.

Yep.

>
> Regards
> Luca


-- 
With best wishes
Dmitry
