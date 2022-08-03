Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34F588AEB
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 13:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F0410E105;
	Wed,  3 Aug 2022 11:09:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4B10E105
 for <freedreno@lists.freedesktop.org>; Wed,  3 Aug 2022 11:09:29 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e23so427512qts.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Aug 2022 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Ni8odVu9N3fk9U9c9SMmRIWk/Y6CS1n2Honac+jmqgs=;
 b=Th5oMiLjG03N9iifNJ+PqTAXgjG8zvJ0AEDvGCFY4OmRya8dUm1vyXHag+GTqc/UH9
 g63yIX90v3j3GhyXhCtEJR8a97K9KRbms0q9AZb4WCqU0tDqUTBM7403hP+yEHMKTMAs
 8Fgwcm5ZP06m4PxK/WZEmfee7579c4OpAMvGP8/JHVyvgGC2BQoq3QYN11tI/rTw3M4a
 Km0n4F/sLlmf1Qyy+NtyQXRKCk+Kfewv+RMWDeNiuSn2pyzn27e7C0dRCRftX30AXelh
 dH+n7OCSzAjSKZfS0OYZeQl1GihHZVFu1rpsE45QcePSqDaYKKLmnRoLDg9+R3Z5vAzZ
 eRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Ni8odVu9N3fk9U9c9SMmRIWk/Y6CS1n2Honac+jmqgs=;
 b=U1YBYNDdVlHXTkzMWpQcPzuxW1Qj+0BkBFJezOav3tWB8JgugsVUrXhTHfnRxpI/X8
 ZFyVxCGpLWnrxeg8GV6Q7F1lnmTzMWyzSHQEJcHqIrxXbFUEuhAzUEV5wUa0TQ5s4tJU
 lBHB5h6P3I9ih70KNdOtrdd7+siM6ZW2x4bSSPHAbG1aUM0v53dCQ8YpDHrdoXveGJiB
 wwh7tijPTfnsHo46sYS5owrLBmWpg3UuuMxzSWH1qE2v2znoBicIBDFZTMx9DqfAUzhv
 bz25XYkc3mLAFdmBZ/DsZ295FTU0RRED2jKDDPdzLLcamP8lhCgi2De9yMvJ9NVJYJxY
 dobA==
X-Gm-Message-State: AJIora/ypwRRzrooypZ+TcGGemhEwFB6NZ6Rv6dKegq1X/3/pCYOnqkw
 Zy235ApJOAPYiyCUYuXC6H6ZCgyVH08nwl29Znqi+A==
X-Google-Smtp-Source: AGRyM1seDx27XYMUBT57CYfQofAFqfovuO2uZ8Up/W6X6P7dbfW63+VBwTQvz9D+Wu7uMwiNerkJzyu2CRWYpP9Q8cE=
X-Received: by 2002:ac8:5942:0:b0:31f:39f6:aba7 with SMTP id
 2-20020ac85942000000b0031f39f6aba7mr21127160qtz.295.1659524968328; Wed, 03
 Aug 2022 04:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <1659174051-27816-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730150952.v3.5.I176567525af2b9439a7e485d0ca130528666a55c@changeid>
 <8715e07f-9d58-1ae3-9a3a-25828b545905@linaro.org>
 <0a81938b-f30e-fa78-fd73-c753af4e324b@quicinc.com>
In-Reply-To: <0a81938b-f30e-fa78-fd73-c753af4e324b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Aug 2022 14:09:16 +0300
Message-ID: <CAA8EJppAprzF5S-zvYYo53QenosUkXU49kiWWzWndVwhWZgS7Q@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 5/8] drm/msm/a6xx: Ensure CX collapse
 during gpu recovery
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
Cc: Sean Paul <sean@poorly.run>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Matthias Kaehlcke <mka@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 3 Aug 2022 at 13:15, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 8/2/2022 12:44 PM, Dmitry Baryshkov wrote:
> > On 30/07/2022 12:40, Akhil P Oommen wrote:
> >> Because there could be transient votes from other drivers/tz/hyp which
> >> may keep the cx gdsc enabled, we should poll until cx gdsc collapses.
> >> We can use the reset framework to poll for cx gdsc collapse from gpucc
> >> clk driver.
> >>
> >> This feature requires support from the platform's gpucc driver.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>
> >> Changes in v3:
> >> - Use reset interface from gpucc driver to poll for cx gdsc collapse
> >>    https://patchwork.freedesktop.org/series/106860/
> >>
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
> >>   drivers/gpu/drm/msm/msm_gpu.c         | 4 ++++
> >>   drivers/gpu/drm/msm/msm_gpu.h         | 4 ++++
> >>   3 files changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 1b049c5..721d5e6 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -10,6 +10,7 @@
> >>     #include <linux/bitfield.h>
> >>   #include <linux/devfreq.h>
> >> +#include <linux/reset.h>
> >>   #include <linux/soc/qcom/llcc-qcom.h>
> >>     #define GPU_PAS_ID 13
> >> @@ -1224,6 +1225,9 @@ static void a6xx_recover(struct msm_gpu *gpu)
> >>       /* And the final one from recover worker */
> >>       pm_runtime_put_sync(&gpu->pdev->dev);
> >>   +    /* Call into gpucc driver to poll for cx gdsc collapse */
> >> +    reset_control_reset(gpu->cx_collapse);
> >
> > Do we have a race between the last pm_runtime_put_sync(), this polling
> > and other voters removing their votes beforehand?
> I can't see any issue with a race here. reset_control_reset() will
> return immediately in that case.

Ack, ok then.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
