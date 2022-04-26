Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72551044C
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 18:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B93510E10F;
	Tue, 26 Apr 2022 16:48:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809ED10E167
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 16:48:56 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e93ff05b23so6858670fac.9
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
 b=lbevqTbjrMzew+TvBUwm8ga5txWZPoMaMRCYck3EkDpZOmQVjZzWs1fkRugwMUs3Q4
 rSogqI5UhQVAGgfUnjFPMDg0I4SNojGEZpdedS3rgZnfwvGL9yIR0hKUGXNVN37AzPOn
 +Xmz/huEGxKXt0+gVSIQP44eFAsECuoqN4gV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=m0dX/1KkBnKssPmbdM8A9ciemnXAWPrdbbwKQbZ6324=;
 b=BXS1zrNcmvtYOcvbmB9PCKgmv3DtAX4xlMtK2uz4ikP+Bwbk2+gPJOCdb85PnLwupN
 3s8pr/spA0u1V3aRcG2PCiD+EVzWWhhj7eul7bLXuw5j2NS9mWlm2bwXD9zHvwIq5tVt
 0fC/Mi83DqjLGRXjF+B9SiQ83/OMtjiPIqXf7l6L98xvQ1zrTxQIDdIrk+lliP99TZp/
 elgzq4lV3CD/u0eQDEOZtaNrfp1Bc/8Vwy7gWwXX18jthvFgb8TWjHHzOMSrQNAfsbHA
 gzEWMjEilpMC5PBfo4YXpm+6gN+EB3rNzReej3oeRhyv7PKJfteLZIda21iC5+EwapCM
 o/iw==
X-Gm-Message-State: AOAM531F6Y9Dof2gTmqW1nlkrIiVc8ys18b/POe4XNH51/oAvegR2YQr
 9YZeGki0s+RHCdvD0PvzZEvwlo4svcCWCD72soLnOQ==
X-Google-Smtp-Source: ABdhPJzJoj8RebjuyUxme6w64EO990J12PUN0kdxhOkG64VbiJmkbcwOUDHEsfvQOnjxeHd9GO22tLYxG/peHrubmCc=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr8126116oad.193.1650991735808; Tue, 26
 Apr 2022 09:48:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 09:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
References: <20220426004128.2832555-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 26 Apr 2022 09:48:55 -0700
Message-ID: <CAE-0n539VhBtwH8wjZmkraZE08-ZY-Yjq3Po8eran7yE4q-20w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1] drm/msm: select DRM_DP_AUX_BUS for the
 AUX bus support
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-25 17:41:28)
> Add missing dependency on the AUX bus implementation.
>
> Fixes: 82c59ed16695 ("drm/msm/dp: Add eDP support via aux_bus")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
